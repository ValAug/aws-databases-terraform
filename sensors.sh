#!/bin/bash

# Set variables
topic='iot-core-topic'
iterations=20
wait=3
region='us-east-1'
profile='<use your aws cli-profile here>'

# Loop for the specified number of iterations
for (( i = 1; i <= iterations; i++ )); do

  # Generate random temperature and humidity values
  temperature=$(( RANDOM % 141 - 20 )) # -20 to 120 degrees Fahrenheit
  humidity=$(( RANDOM % 101 )) # 0 to 100 percent

  # Print values to console
  echo "Publishing data $i/$iterations to AWS IoT topic $topic:"
  echo "temperature: $temperature"
  echo "humidity: $humidity"

  # Publish values to the MQTT topic
  aws iot-data publish \
    --topic "$topic" \
    --cli-binary-format raw-in-base64-out \
    --payload "{\"temperature\":$temperature,\"humidity\":$humidity}" \
    --profile "$profile" \
    --region "$region"

  # Wait for the specified number of seconds
  sleep "$wait"
done