import boto3
import json
import math
from datetime import datetime
from boto3.dynamodb.conditions import Key, Attr

dynamodb = boto3.resource('dynamodb', region_name='eu-north-1')
TABLE_NAME = 'User-wzrxyxdpvjfbvd57ueidm4kch4-NONE'

def handler(event, context):
    user_id = event['arguments']['userId']

    try:
        table = dynamodb.Table(TABLE_NAME)

        # 1. Get current user's details
        user_response = table.get_item(Key={'userId': user_id})
        current_user = user_response.get('Item')
        if not current_user or not current_user['isAvailable'] or not current_user['online']:
            return {'error': 'User is not available or offline'}

        # 2. Find a match using Scan
        matches_response = table.scan(
            FilterExpression=(
                Attr('userId').ne(user_id) &
                Attr('isAvailable').eq(True) &
                Attr('online').eq(True) &
                Attr('gender').eq(current_user['gender_preference']) &
                Attr('age').between(current_user['age'] - 5, current_user['age'] + 5)
            )
        )
        matches = matches_response.get('Items', [])

        match = next((m for m in matches 
                     if m['gender_preference'] == current_user['gender'] and 
                        (not current_user.get('location') or 
                         is_within_distance(current_user.get('location'), m.get('location'), 50))), 
                     None)

        if not match:
            return {'status': 'waiting'}

        # 3. Create Call entry
        call_id = f"{user_id}-{match['userId']}-{int(datetime.now().timestamp())}"
        table.put_item(Item={
            'id': call_id,
            'callerId': user_id,
            'calledId': match['userId'],
            'createdAt': datetime.utcnow().isoformat(),
            'status': 'active',
            '__typename': 'Call'
        })

        # 4. Update users' availability
        table.update_item(
            Key={'userId': user_id},
            UpdateExpression='SET isAvailable = :false, currentCall = :callId',
            ExpressionAttributeValues={':false': False, ':callId': call_id}
        )
        table.update_item(
            Key={'userId': match['userId']},
            UpdateExpression='SET isAvailable = :false, currentCall = :callId',
            ExpressionAttributeValues={':false': False, ':callId': call_id}
        )

        return {
            'callId': call_id,
            'matchedUser': {
                'userId': match['userId'],
                'name': match['name'],
                'profilePicture': match.get('profile_picture')
            }
        }

    except Exception as e:
        print(f"Matchmaking error: {str(e)}")
        return {'error': str(e)}

def is_within_distance(loc1, loc2, max_distance):
    if not loc1 or not loc2:
        return True
    R = 6371  # Earth radius in km
    dLat = math.radians(loc2['lat'] - loc1['lat'])
    dLon = math.radians(loc2['long'] - loc1['long'])
    a = math.sin(dLat/2) * math.sin(dLat/2) + \
        math.cos(math.radians(loc1['lat'])) * math.cos(math.radians(loc2['lat'])) * \
        math.sin(dLon/2) * math.sin(dLon/2)
    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1-a))
    distance = R * c
    return distance <= max_distance
