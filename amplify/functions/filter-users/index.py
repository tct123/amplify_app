import json
import boto3
import requests
from requests_aws4auth import AWS4Auth

def handler(event, context):
    # 1. Set your AppSync endpoint and region
    appsync_url = "https://7no5eh3btzexni2o453gyivwmu.appsync-api.eu-north-1.amazonaws.com/graphql"
    region = "eu-north-1"  # Adjust to your region

    # 2. Get AWS credentials for signing the request
    session = boto3.Session()
    credentials = session.get_credentials()
    aws_auth = AWS4Auth(
        credentials.access_key, 
        credentials.secret_key, 
        region, 
        'appsync',
        session_token=credentials.token
    )

    # 3. Define the GraphQL mutation for creating a CallList.
    # Note: The auto-generated resolvers will fill in id, createdAt, and updatedAt.
    mutation = """
    mutation CreateCallList($input: CreateCallListInput!) {
      createCallList(input: $input) {
        id
        callerId
        calls
        createdAt
        updatedAt
      }
    }
    """

    # 4. Retrieve users from the users table (using DynamoDB directly).
    dynamodb = boto3.resource('dynamodb')
    users_table = dynamodb.Table('User-wzrxyxdpvjfbvd57ueidm4kch4-NONE')
    response = users_table.scan()
    users = response.get('Items', [])

    results = []
    # Process every user as a caller.
    for caller in users:
        caller_id = caller.get("userId")
        if not caller_id:
            continue
        caller_gender = caller.get("gender", "").lower()
        caller_pref = caller.get("gender_preference", "").lower()

        # Find matching users for the caller.
        matching_users = []
        for user in users:
            if user.get("userId") == caller_id:
                continue
            user_gender = user.get("gender", "").lower()
            user_pref = user.get("gender_preference", "").lower()
            if user_gender == caller_pref and user_pref == caller_gender:
                matching_users.append(user)

        # Build the call list for the caller (limit to 6 entries)
        call_list = []
        for match in matching_users:
            call_pair = f"{caller_id}+{match.get('userId')}"
            call_list.append(call_pair)
            if len(call_list) >= 6:
                break

        # 5. Prepare the input for the mutation.
        # Do NOT include id, createdAt, or updatedAt. The resolvers will auto-populate these.
        input_data = {
            "callerId": caller_id,
            "calls": call_list
        }

        payload = {
            "query": mutation,
            "variables": {
                "input": input_data
            }
        }

        headers = {
            "Content-Type": "application/json"
        }

        # 6. Execute the GraphQL mutation via AppSync.
        r = requests.post(appsync_url, auth=aws_auth, json=payload, headers=headers)
        if r.status_code == 200:
            results.append({
                "caller": caller_id,
                "result": r.json()
            })
        else:
            results.append({
                "caller": caller_id,
                "error": r.text,
                "status_code": r.status_code
            })

    # 7. Return a summary of results.
    return {
        "statusCode": 200,
        "body": json.dumps({
            "message": "Call lists created via AppSync",
            "results": results
        })
    }

