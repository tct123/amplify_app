import json
import boto3
import uuid
from datetime import datetime

def handler(context):
    print("Create Event Lambda function started.")
    
    # Initialize the DynamoDB resource.
    dynamodb = boto3.resource('dynamodb')
    # Replace with the actual name of your Event table.
    event_table = dynamodb.Table('Event-wzrxyxdpvjfbvd57ueidm4kch4-NONE')
    
    
    # Extract required fields from the input.
    should_add_man = True
    orientation = "heterosexual"
    date_str = "2025-03-25T19:00:00Z"  # 25th March at 8 PM CET converted to UTC
    location = {"lat": 59.3293, "long": 18.0686}  # Stockholm center coordinates
    queue_id = ""
    event_id_field = str(uuid.uuid4())
    
    # Optionally, generate a timestamp (if your schema uses them elsewhere).
    now = datetime.utcnow().replace(microsecond=0).isoformat() + "Z"
    
    # Build the item to insert.
    # Note: Your model requires these fields:
    #   - id, shouldAddMan, orientation, date, location (with lat and long), queueId, eventId
    # The relationships 'event' and 'queue' are managed by DataStore/Amplify.
    item = {
        "id": event_id_field,
        "shouldAddMan": should_add_man,
        "orientation": orientation,
        "date": date_str,
        "location": location,
        "queueId": queue_id,
        "eventId": event_id_field,
        "createdAt": now,
        "updatedAt": now
    }
    
    print("Inserting new event item:", item)
    
    try:
        event_table.put_item(Item=item)
        print("Successfully inserted event.")
    except Exception as e:
        error_msg = str(e)
        print("Error inserting event:", error_msg)
        return {
            "statusCode": 500,
            "body": json.dumps("Error inserting event: " + error_msg)
        }
    
    return {
        "statusCode": 200,
        "body": json.dumps({
            "message": "Event created successfully",
            "event": item
        })
    }

