import os
import json
import pymysql
from itertools import combinations

def handler(event, context):
    # Retrieve credentials and connection info from environment variables.
    db_host = os.environ.get("DB_HOST")
    db_user = os.environ.get("DB_USER")
    db_password = os.environ.get("DB_PASSWORD")
    db_name = os.environ.get("DB_NAME")

    # Establish a connection using credentials from environment variables.
    try:
        connection = pymysql.connect(
            host=db_host,
            user=db_user,
            password=db_password,
            database=db_name,
            cursorclass=pymysql.cursors.DictCursor,
            connect_timeout=5
        )
    except Exception as e:
        return {
            "statusCode": 500,
            "body": json.dumps({"error": f"Database connection failed: {str(e)}"})
        }
    
    try:
        with connection.cursor() as cursor:
            # Retrieve all users from the 'users' table.
            cursor.execute("SELECT id, name, gender FROM users")
            users = cursor.fetchall()
    except Exception as e:
        return {
            "statusCode": 500,
            "body": json.dumps({"error": f"Query execution failed: {str(e)}"})
        }
    finally:
        connection.close()
    
    # Separate users by gender (expects values like "male" or "female")
    male_users = [user for user in users if user.get('gender', '').lower() == 'male']
    female_users = [user for user in users if user.get('gender', '').lower() == 'female']
    
    # Build groups of 4 (2 males and 2 females)
    valid_groups = [
        list(male_group) + list(female_group)
        for male_group in combinations(male_users, 2)
        for female_group in combinations(female_users, 2)
    ]
    
    return {
        "statusCode": 200,
        "body": json.dumps(valid_groups)
    }

