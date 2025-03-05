import boto3
from boto3.dynamodb.conditions import Key, Attr

def handler(event, context):
    # Create a DynamoDB client/resource
    dynamodb = boto3.resource('dynamodb')
    
    # Replace 'YourUserTable' with your actual DynamoDB table name.
    table = dynamodb.Table('User-wzrxyxdpvjfbvd57ueidm4kch4-NONE')
    
    # Query or scan the table for users (this is a basic scan; for production, consider using query with indexes).
    response = table.scan()
    users = response.get('Items', [])
    
    # Filter users based on your criteria.
    male_users = [user for user in users if user.get('gender', '').lower() == 'male']
    female_users = [user for user in users if user.get('gender', '').lower() == 'female']
    
    # For grouping, you could use combinations as before.
    from itertools import combinations
    valid_groups = [
        list(male_group) + list(female_group)
        for male_group in combinations(male_users, 2)
        for female_group in combinations(female_users, 2)
    ]
    
    return {
        "statusCode": 200,
        "body": valid_groups
    }

