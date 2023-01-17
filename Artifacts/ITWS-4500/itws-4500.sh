#!/bin/bash
#
# This Azure DevTest Labs artifact installs various requirements for the ITWS 4500 course at RPI.
#
# NOTE: Intended for use by the Azure DevTest Lab artifact system.
#
set -e

# Update Apt
apt update

# Install packages
apt install git tmux nano -y

# Setup faculty & TA access

## Setup user
useradd -m itws_su
mkdir -p ~itws_su/.ssh
touch ~itws_su/.ssh/authorized_keys
chown -R itws_su:itws_su ~itws_su/.ssh/

## Grant sudo access to new user
cat << EOF > /etc/sudoers.d/itws_su
# User rules for itws_su
itws_su ALL=(ALL) NOPASSWD:ALL
EOF

## Add SSH public keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDE5JT/e6dJlQAaVrQFfIDih3p/E50rFZsw+Qxe6ULSWcKLeg73vcWY6HHrp2tV9LLJ3x7YXb+fxssMRa3Ayueulj5KX+w1AD+bZwWRPUznPh7OWww/FE76quDo2Efy1NCG8TFjXcAA7B8B/oCLwTvIdGEDh3YDfvtrVx3Z3gBRU2xtHK6R0dpZZh2JPvyqoEf8GevC+kAXKbpm+ZGWbn+oUaEILjqbT3Xz6qgS5VkshHgQSevfQJZT5ClXHQE1E9eJMpPHiaO3RAVOQKw5NTlk6RgEfUrjLAAq0nGgXa1H68YdKRgBJJxWO6sgmp7XxYwsoLRO1OaLK6wnLUVAvhYLq3WJUXBRDOFfQVsdZE8aJajE8UUVj9HvYXvM2SKsVQAS5gh+0T6Y8/XXXsgRCI5CMrrGHbE2K4KmsDGcwGv5yHZYHXTtwUPEGcCyNHIGfZB/q7AjbFvESeyxGRUIiVeH94jeSoezXbStBgBhJfUBTQqygi4VpaO28Xv/qoiPfOwsBqEfsFKe+rWHPNAHOMSHNqpFWN3RuzeQkpeQTv5jX+FkRIN8smxWNq4uLP5tmPgGRJWMKmENKEFGDiHzcdezanO0J9ZzwV6zzJ8Fy9IMJQ6pZ49h37ha7JHx8Jnv4u3O+5HqlGdEpo4bd/2EmosV9LROKGSdWigowIN+Ym6BYQ== rplotka@tsi400.com" >> ~itws_su/.ssh/authorized_keys

echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII9O0W6HeOiw5Qo8h3JiVTbL2xCDMX3MiT0uvnJY7MXn brian@mini.anthrobsd.net" >> ~itws_su/.ssh/authorized_keys