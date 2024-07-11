#!/bin/bash
 
# The URL of your Kubernetes service
#URL="http://172.25.231.154"
URL="http://172.25.231.155"
 
# Total number of requests to simulate
TOTAL_REQUESTS=100
 
# Counter for requests handled by the canary version
STABLE_COUNT=0
CANARY_COUNT=0
 
# Function to make a request and check the response
function send_request() {
    # Assuming the application returns a response with a version identifier
    RESPONSE=$(curl -s $URL)
    #echo "Response: $RESPONSE"
    if [[ "$RESPONSE" == *"canary"* ]]; then
        CANARY_COUNT=$((CANARY_COUNT+1))
    else
       STABLE_COUNT=$((STABLE_COUNT+1))
       #STABLE_COUNT=$[$STABLE_COUNT + 1]
    fi
}
 
# Simulate requests
for (( i=0; i<$TOTAL_REQUESTS; i++ ))
do
    send_request
done
 
# Calculate percentages
CANARY_PERCENTAGE=$((CANARY_COUNT * 100 / TOTAL_REQUESTS))
STABLE_PERCENTAGE=$((STABLE_COUNT * 100 / TOTAL_REQUESTS))
 
# Display results
echo "Total requests: $TOTAL_REQUESTS"
echo "Canary handled: $CANARY_COUNT requests ($CANARY_PERCENTAGE%)"
echo "Stable handled: $STABLE_COUNT requests ($STABLE_PERCENTAGE%)"
