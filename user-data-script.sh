#!/bin/bash

# Install, start and enable the Apache web server.
yum update -y
yum install -y httpd 
sudo systemctl start httpd
sudo systemctl enable httpd

# Add ec2-user to the apache group.
sudo usermod -a -G apache ec2-user

# Change the group ownership of /var/www to the apache group
sudo chown -R ec2-user:apache /var/www

# Change the file permisions of the apache directory
find /var/www -type f -exec sudo chmod 0664 {} \;

# install Git
yum install -y git

# Change the working directory to clone the repository inside the apache directory
cd  /var/www/html

# Clone the private repository from GitHub.
# Replace <github-access-token> with the generated personal access tokens from GitHub
# Replace <username> and <repository> with the corresponding username and repository
git clone https://<github-access-token>@github.com/<username>/<repository>

# To display the website when opening the endpoint of the ec2 instance,
# the repository needs to be without its parent folder inside /var/www/html
# Move all objects from the repository folder to the current directory (/var/www/html)
mv <repository>/* .

# Remove the empty folder where the repository was initially cloned
sudo rm -R Websiteeeee/

#Done