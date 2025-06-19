#!/bin/bash

# Step 1: Prompt for new assignment name
read -p "Enter the new assignment name: " new_assignment

# Step 2: Update the ASSIGNMENT value in config/config.env
# We escape forward slashes in the assignment name to avoid sed errors
escaped_assignment=$(echo "$new_assignment" | sed 's/\//\\\//g')

sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$escaped_assignment\"/" config/config.env

echo "✅ Assignment updated to: $new_assignment"
echo "----------------------------------------"

# Step 3: Re-run the app
./startup.sh

