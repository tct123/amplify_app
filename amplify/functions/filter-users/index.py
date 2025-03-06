import json
import boto3

def handler(event, context):
    # Initialize DynamoDB resource and reference the tables.
    dynamodb = boto3.resource('dynamodb')
    users_table = dynamodb.Table('User-wzrxyxdpvjfbvd57ueidm4kch4-NONE')
    calllist_table = dynamodb.Table('CallList')
    
    # Retrieve all users from the users table.
    response = users_table.scan()
    users = response.get('Items', [])
    
    # Prepare a results list to track the output of each caller.
    results = []
    
    # Loop through every user, treating each as a caller.
    for caller in users:
        caller_id = caller.get("userId")
        caller_gender = caller.get("gender", "").lower()
        caller_pref = caller.get("gender_preference", "").lower()
        
        # Filter matching users:
        # - Skip the caller themselves.
        # - Include only users whose gender equals the caller's gender preference
        #   and whose own gender_preference equals the caller's gender.
        matching_users = []
        for user in users:
            if user.get("userId") == caller_id:
                continue  # Skip the caller.
            user_gender = user.get("gender", "").lower()
            user_pref = user.get("gender_preference", "").lower()
            if user_gender == caller_pref and user_pref == caller_gender:
                matching_users.append(user)
        
        # Build a call list for the caller.
        # For each matching user, create a string that concatenates caller's id and the matching user's id.
        # Limit the call list to at most 6 entries.
        call_list = []
        for match in matching_users:
            call_pair = f"{caller_id}+{match.get('userId')}"
            call_list.append(call_pair)
            if len(call_list) >= 6:
                break
        
        # Create an entry for the caller in the CallList table.
        # The entry includes the caller's id and the call list array.
        item = {
            "caller": caller_id,
            "calls": call_list
        }
        
        try:
            calllist_table.put_item(Item=item)
            results.append(item)
        except Exception as e:
            results.append({"caller": caller_id, "error": str(e)})
    
    # Return a response indicating that call list entries have been created.
    return {
        "statusCode": 200,
        "body": json.dumps({
            "message": "Call lists created",
            "results": results
        })
    }

