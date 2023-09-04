#!/bin/bash

# Get the domain name as an argument.
DOMAIN=$1

# Set the system hostname to the provided domain.
hostname $DOMAIN

# Update package lists.
apt update

# Install Snapd, a package manager for snaps.
apt install snapd -y

# Install Nextcloud using Snap.
snap install nextcloud

# Perform the Nextcloud initial manual setup, including setting up an admin user and password.
sudo nextcloud.manual-install admin admin

# Configure trusted domains for Nextcloud, specifying the provided domain.
sudo nextcloud.occ config:system:set trusted_domains 1 --value=$DOMAIN

# Display the current list of trusted domains for verification.
sudo nextcloud.occ config:system:get trusted_domains

# Manually enable HTTPS with Let's Encrypt for securing Nextcloud.
# Please note that you will need to provide your email address, agree to Let's Encrypt terms, and specify your domain during this process.
sudo nextcloud.enable-https lets-encrypt
