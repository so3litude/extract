#!/bin/bash

# Check if a file path is provided
if [ -z "$1" ]; then
  echo "Error: Please provide a file path as an argument."
  exit 1
fi

text_file="$1"

# Check if the file exists
if [ ! -f "$text_file" ]; then
  echo "Error: File not found at '$text_file'. Please provide a valid file path."
  exit 1
fi

# Combined regex for subdomains and IPs
regex="(([a-z0-9\-_]+\.)+[a-z0-9\-_]+|[0-9]{1,3}(\.[0-9]{1,3}){3})"

# Extract matches using grep and the regex
matches=$(grep -oP "$regex" "$text_file" | sort -u)

# Check if any matches are found
if [ -z "$matches" ]; then
  echo "No matches found."
  exit 0
fi

# Print all results as a single list
echo "Found:"
echo "$matches"
