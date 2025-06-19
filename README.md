# submission_reminder_app_UN-Bonasse_

## Submission Reminder Application

This is a simple shell-based application that alerts students about upcoming assignment deadlines. The setup script automatically creates the necessary folders and files, and the reminder script checks which students haven’t submitted a given assignment.

---

 Installation and Setup
 Step 1: Clone the Repository

```bash
git clone https://github.com/UN-Bonasse/submission_reminder_app-UN-Bonasse_.git
cd submission_reminder_app-UN-Bonasse_

 Step 2: Run the Environment Setup Script
bash create_environment.sh

What this does:

Prompts you for your name

Creates a new directory named submission_reminder_<YourName>

Inside it, creates folders and scripts like assets, modules, config, etc.

Populates each file with predefined content

Sets executable permissions for all .sh files


Step 3: Run the Reminder Application
bash submission_reminder_<YourName>/startup.sh


What this does:

Loads configuration from config.env

Reads the submissions.txt file

Displays reminders for students who haven’t submitted the current assignment

Updating the Assignment
cd submission_reminder_<YourName>
./copilot_shell_script.sh


What this does:

Prompts you to enter a new assignment name

Updates the ASSIGNMENT field in config/config.env

Automatically reruns the reminder script

File Structure

submission_reminder_<YourName>/
│
├── assets/
│   └── submissions.txt
│
├── config/
│   └── config.env
│
├── modules/
│   └── functions.sh
│
├── reminder.sh
├── startup.sh
├── image.png
└── copilot_shell_script.sh

