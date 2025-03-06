import json
import boto3
import uuid
from datetime import datetime

def normalize_gender(value):
    """Normalize gender values to 'male' or 'female'."""
    if not value:
        return value
    value = value.lower().strip()
    if value in ['men', 'male']:
        return 'male'
    if value in ['women', 'female']:
        return 'female'
    return value

def handler(event, context):
    print("Lambda function started.")
    
    dynamodb = boto3.resource('dynamodb')
    users_table = dynamodb.Table('User-wzrxyxdpvjfbvd57ueidm4kch4-NONE')
    calllist_table = dynamodb.Table('CallList-wzrxyxdpvjfbvd57ueidm4kch4-NONE')
    
    # Retrieve all users from the Users table.
    print("Scanning users table...")
    response = users_table.scan()
    users = response.get('Items', [])
    print(f"Found {len(users)} users.")
    
    results = []
    
    for caller in users:
        caller_id = caller.get("userId")
        if not caller_id:
            print("Skipping a user without userId.")
            continue
        
        # Normalize caller's gender and gender_preference.
        caller_gender = normalize_gender(caller.get("gender", ""))
        caller_pref = normalize_gender(caller.get("gender_preference", ""))
        print(f"Processing caller: {caller_id}")
        print(f"Caller gender: {caller_gender}, caller preference: {caller_pref}")
        
        # Find matching users (skip the caller).
        matching_users = []
        for user in users:
            if user.get("userId") == caller_id:
                continue
            user_gender = normalize_gender(user.get("gender", ""))
            user_pref = normalize_gender(user.get("gender_preference", ""))
            # Check if the matching user satisfies the criteria.
            if user_gender == caller_pref and user_pref == caller_gender:
                matching_users.append(user)
        print(f"Found {len(matching_users)} matching users for caller {caller_id}.")
        
        # Build the call list: combine caller's id with each matching user's id.
        call_list = []
        for match in matching_users:
            match_id = match.get('userId')
            call_pair = f"{caller_id}{match_id}"
            call_list.append(call_pair)
            if len(call_list) >= 6:
                break
        print(f"Call list for caller {caller_id}: {call_list}")
        
        # Generate a timestamp in AWSDateTime format (ISO 8601 with trailing "Z")
        now = datetime.utcnow().replace(microsecond=0).isoformat() + "Z"
        
        # Create the item including required fields.
        item = {
            "id": str(uuid.uuid4()),
            "callerId": caller_id,
            "calls": call_list,
            "createdAt": now,
            "updatedAt": now
        }
        
        try:
            calllist_table.put_item(Item=item)
            print(f"Successfully inserted call list for caller {caller_id}.")
            results.append(item)
        except Exception as e:
            error_msg = str(e)
            print(f"Error inserting call list for caller {caller_id}: {error_msg}")
            results.append({"caller": caller_id, "error": error_msg})
    
    print("Lambda function completed.")
    return {
        "statusCode": 200,
        "body": json.dumps({
            "message": "Call lists created",
            "results": results
        })
    }

