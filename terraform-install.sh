#!/bin/bash

# Update the package list
echo "Updating package list..."
sudo apt-get update -y

# Install required dependencies
echo "Installing dependencies..."
sudo apt-get install -y gnupg software-properties-common

# Add the HashiCorp GPG key
echo "Adding HashiCorp GPG key..."
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Add the official HashiCorp Linux repository
echo "Adding HashiCorp repository..."
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

# Update the package list again
echo "Updating package list again..."
sudo apt-get update -y

# Install Terraform
echo "Installing Terraform..."
sudo apt-get install -y terraform

# Verify the installation
echo "Verifying Terraform installation..."
terraform -v

echo "Terraform installation completed successfully."

