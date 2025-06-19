#!/bin/bash

# Step 1: Prompt for the user's name
read -p "Enter your name: " name
project_dir="submission_reminder_${name}"

# Step 2: Create the main directory and subdirectories
mkdir -p "$project_dir"/{assets,config,modules}

# Step 3: Create and populate config.env
cat <<EOF > "$project_dir/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

# Step 4: Create and populate functions.sh
cat <<'EOF' > "$project_dir/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=\$1
    echo "Checking submissions in \$submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        student=\$(echo "\$student" | xargs)
        assignment=\$(echo "\$assignment" | xargs)
        status=\$(echo "\$status" | xargs)

        if [[ "\$assignment" == "\$ASSIGNMENT" && "\$status" == "not submitted" ]]; then
            echo "Reminder: \$student has not submitted the \$ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "\$submissions_file")
}
EOF

# Step 5: Create and populate reminder.sh
cat <<'EOF' > "$project_dir/reminder.sh"
#!/bin/bash

source ./config/config.env
source ./modules/functions.sh

submissions_file="./assets/submissions.txt"

echo "Assignment: \$ASSIGNMENT"
echo "Days remaining to submit: \$DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions \$submissions_file
EOF

# Step 6: Create and populate submissions.txt with at least 9 records
cat <<EOF > "$project_dir/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Daniel, Shell Navigation, submitted
Sophia, Shell Navigation, not submitted
Elijah, Git, not submitted
Maya, Shell Navigation, not submitted
Zane, Shell Basics, submitted
EOF

# Step 7: Create startup.sh
cat <<'EOF' > "$project_dir/startup.sh"
#!/bin/bash

chmod +x reminder.sh
./reminder.sh
EOF

# Step 8: Add a dummy image file
touch "$project_dir/image.png"

# Step 9: Make all .sh files executable
find "$project_dir" -name "*.sh" -exec chmod +x {} \;

echo "✅ Environment setup complete at: $project_dir"

