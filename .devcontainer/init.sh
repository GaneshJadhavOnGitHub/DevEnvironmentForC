#!/bin/bash

#---------------------------------------------------------------------------------------------------------------#
# Author : Ganesh K Jadhav
# Date : February 06, 2025.
# Version : 1.0.0
# Description : Small shell script to create the 'c_programs' directiry and 'history' directory for .zsh_history file.
#---------------------------------------------------------------------------------------------------------------#

# Take back-up of previous history and c_programs directory before building new image.

# Create the required directories and file.
# 'history' directory is mounted to c devcontainer and used to store .zsh_history file.
# 'c_programs' directory is also mounted to c devcontainer and used to store c programs persistently on host.

mkdir -p ../history
mkdir -p ../c_programs

# Create .zsh_history file in the 'history' directory. This file is used to store zsh command history persistently.
touch ../history/.zsh_history
echo "History file and 'c_programs' directory created successfully!"

