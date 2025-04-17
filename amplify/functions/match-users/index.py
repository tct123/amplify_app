import boto3
import json
import math
import uuid
from datetime import datetime
from boto3.dynamodb.conditions import Key, Attr

dynamodb = boto3.resource('dynamodb', region_name='eu-north-1')
USER_TABLE_NAME = 'User-wzrxyxdpvjfbvd57ueidm4kch4-NONE'
CALL_TABLE_NAME = 'Call-wzrxyxdpvjfbvd57ueidm4kch4-NONE'

def handler(event, context):
    user_id = event['arguments']['userId']
    print(f"Starting matchmaking for user: {user_id}")

    try:
        user_table = dynamodb.Table(USER_TABLE_NAME)
        call_table = dynamodb.Table(CALL_TABLE_NAME)

        # 1. Get current user's details
        print(f"Fetching user details for userId: {user_id}")
        user_response = user_table.get_item(Key={'userId': user_id})
        current_user = user_response.get('Item')
        if not current_user or not current_user['isAvailable'] or not current_user['online']:
            print(f"User {user_id} is not available or offline: {current_user}")
            return {'error': 'User is not available or offline'}

        # 2. Search for available users
        print("Scanning for available matches")
        matches_response = user_table.scan(
            FilterExpression=(
                Attr('userId').ne(user_id) &
                Attr('isAvailable').eq(True) &
                Attr('online').eq(True) &
                Attr('gender').eq(current_user['gender_preference']) &
                Attr('age').between(current_user['age'] - 5, current_user['age'] + 5)
            )
        )
        matches = matches_response.get('Items', [])
        print(f"Found {len(matches)} potential matches")

        match = next((m for m in matches 
                     if m['gender_preference'] == current_user['gender'] and 
                        (not current_user.get('location') or 
                         is_within_distance(current_user.get('location'), m.get('location'), 50))), 
                     None)

        if not match:
            print("No compatible match found")
            return {'status': 'waiting'}

        # 3. Create Call entry with UUID
        call_id = str(uuid.uuid4())
        print(f"Creating Call entry with id: {call_id}")
        now = datetime.utcnow().strftime('%Y-%m-%dT%H:%M:%SZ')
        call_item = {
            'id': call_id,
            'callerId': user_id,
            'calledId': match['userId'],
            'createdAt': now,
            'updatedAt': now,
            'status': 'active',
            '__typename': 'Call'
        }
        call_table.put_item(Item=call_item)
        print(f"Call created: {call_item}")

        # 4. Retrieve the Call entry
        print(f"Retrieving Call entry: {call_id}")
        call_response = call_table.get_item(Key={'id': call_id})
        created_call = call_response.get('Item')
        if not created_call:
            print(f"Failed to retrieve Call: {call_id}")
            return {'error': 'Failed to create Call entry'}

        # 5. Update users' currentCall and availability
        print(f"Updating user {user_id} with callId: {call_id}")
        user_table.update_item(
            Key={'userId': user_id},
            UpdateExpression='SET isAvailable = :false, currentCall = :callId',
            ExpressionAttributeValues={':false': False, ':callId': call_id}
        )
        print(f"Updating matched user {match['userId']} with callId: {call_id}")
        user_table.update_item(
            Key={'userId': match['userId']},
            UpdateExpression='SET isAvailable = :false, currentCall = :callId',
            ExpressionAttributeValues={':false': False, ':callId': call_id}
        )

        # 6. Return response
        response = {
            'callId': call_id,
            'matchedUser': {
                'userId': match['userId'],
                'name': match['name'],
                'profilePicture': match.get('profile_picture')
            }
        }
        print(f"Matchmaking successful, returning: {response}")
        return response

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
    print(f"Distance between locations: {distance} km")
    return distance <= max_distance
