#!/bin/bash
#
# This Azure DevTest Labs artifact installs various requirements for the ITWS 2110 course at RPI.
#
# NOTE: Intended for use by the Azure DevTest Lab artifact system.
#
set -e

# Update Apt
apt update

# Install packages
apt install git tmux nano -y