#!/usr/bin/env bash
# Adds the ALU public key to the ubuntu user on the server and fixes permissions

# Replace this with your actual server IP
SERVER_IP="18.233.158.107"

# ALU public key to add
ALU_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDRwFHAzt0EEdS30pEjwFxIk2gLw3BW68GwqcOyFz47EofyZgylVDM3uTKi+/FJTbzy34n9gj7SRi/eSNuu60RLbSQBmNtQPy+Ce6czMnBMAdqICWETFepegE+GvProSkiTmaEFnzJg0hSom/dHGbuXZHz5/NoDaHiXtx7faIgBmVxorAhrEMWCios561z74ynbfok28+3zL6NKlzLNVMbu+0RkntGxHARyUs2LqIWtTT1zna6CwRqRCFiSBXK+uiQIdHJh1vu3swPH8Vb1ZClCDQRlz7/sU0OYIoPpYXTtIEGrPYVFFcVmWTYZaBWD+5TcOnOLyTel43KzAeDX+9IIPKVe//DaZqvh8R/AHcOq9ndeuKaiq608cniRYD3gH+PJOJsGDlf+5MBlJ+MniQloKiHM7eulkL+c9LuZE/19ttAwKckHbtxqSRAFxlxm1sqIxS9xoxLfuZXnEnouOFpajwDckVUdoft+0kuZvkv4lijlguPziBQiadzrt3X7/uZzsy3/b4QJ9vbKKyEaKPv+aSH3iAFX15JRzIasFDDLeyCFy3zXkxuLh8mdC3Jj027DMGcH9wLNl1AQFWW9P8AENlvGVycnpEzAlMleH+jWVU4WnnPzQviU3HMXy0HpYSRdHEB0sVC7lNYI4fKdmaGWHmiyvYEOz1qu9THQVqLZFw== e.masambu@alustudent.com"

# Ensure your private key exists locally
if [ ! -f ~/.ssh/school ]; then
    echo "Private key ~/.ssh/school not found. Please create it first with ssh-keygen."
    exit 1
fi

# Add ALU public key to the server
ssh -i ~/.ssh/school ubuntu@$SERVER_IP "mkdir -p ~/.ssh && echo '$ALU_KEY' >> ~/.ssh/authorized_keys && chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys"

# Test connection
echo "Testing SSH connection..."
ssh -i ~/.ssh/school ubuntu@$SERVER_IP "echo 'SSH login successful!'"