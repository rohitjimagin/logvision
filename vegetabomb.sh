#!/bin/bash

# Define endpoints to test
endpoints=(
  "http://localhost:80/"
)

# Define attack rates and durations
rates=(50 100 200)
durations=("10s" "30s" "1m")

# Loop through endpoints, attack rates, and durations
for endpoint in "${endpoints[@]}"; do
  for rate in "${rates[@]}"; do
    for duration in "${durations[@]}"; do
      echo "Testing $endpoint at $rate requests per second for $duration"
      echo "GET $endpoint" | vegeta attack -duration="$duration" -rate="$rate" | vegeta report
    done
  done
done
