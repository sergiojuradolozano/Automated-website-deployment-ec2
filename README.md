# Automation Script for Website Deployment with EC2

# Architecture of the Web Application

This script was used in the user-data option of the launch template that was configure with the auto-scaling group to automate the following:

- Install, start and enable Apache.
- Add ec2-user to Apache.
- Change the group ownership of /var/www to apache.
- Set permissions of /var/www/
- Change the working directory.
- Install Git.
- Clone the private repository from GitHub.
- Move the files from the repository folder to /var/www/html.
- Remove the empty folder of the cloned repository.