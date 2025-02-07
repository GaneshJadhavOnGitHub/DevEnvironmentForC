#--------------------------------------------------------------------------------------------------------------------#
# Author : Ganesh K Jadhav
# Date : February 06, 2025 to February 07, 2025.
# Version : 1.0.0
# Description : Dockerfile to create and run C devcontainer for C programming'.
#--------------------------------------------------------------------------------------------------------------------#

# Tested on February 07, 2025  --  Working 
# Image size is  1.25GB


# Ubuntu 24.04 is used as base image for c development container.
FROM ubuntu:24.04

# Define build arguments for this Dockerfile.

# This ARGUMENT is used to set value of MAINTAINER of this Dockerfile.
ARG MAINTAINER

# This ARGUMENT is used to set value of VERSION of this Dockerfile.
ARG VERSION

# This ARGUMENT is used to set value of DESCRIPTION for this Dockerfile.
ARG DESCRIPTION

# This ARGUMENT is used to set value of  Environment Variable DEBIAN_FRONTEND.
ARG DEBIAN_FRONTEND

#This ARGUMENT is used to set value of  Environment Variable EDITOR.
ARG EDITOR

#This ARGUMENT is used to set value of  Environment Variable TERM.
ARG TERM

# This ARGUMENT is used to set value of  Environment Variable LANG.
ARG LANG

# This ARGUMENT is used to set value of  Environment Variable LANGUAGE.
ARG LANGUAGE

# This ARGUMENT is used to set value of  Environment Variable LC_ALL.
ARG LC_ALL

# This ARGUMENT is used to set value of  Environment Variable TZ.
ARG TZ


# Set values of LABELS showing information about Dockerfile.
LABEL maintainer="${MAINTAINER}"
LABEL version="${VERSION}" 
LABEL description="${DESCRIPTION}"



# SET Environment Variable  DEBIAN_FRONTEND to proceed with package installations without any user input.
ENV DEBIAN_FRONTEND=${DEBIAN_FRONTEND}


# Update package list.
# Install following components/packages.
# build-essential (like GCC and other libraries) - Required for rust.
# curl - Required to download packages.
# git - Required to clone source code of zsh plug-in's.
# iputils-ping - Required to test network connectivity (optional). 
# lldb - Required for debugging.
# locales - Required to set Language, Character Encoding and other locales to Indian.
# tzdata - Required for date-time setting.
# zsh - Interactive zsh shell which supports command history, auto-complete features.
# Generate the locale data for en_IN.UTF-8 and update the system configuration for en_IN.UTF-8.
# (Had error, if locale data is not generated, So generating from here).
# Disable "detached HEAD" warning messages using git config command.
# Set default shell to ZSH (Z Shell).

RUN apt-get update && \ 
    apt-get install -y build-essential curl git iputils-ping lldb locales tzdata zsh && \
    locale-gen en_IN.UTF-8 && \ 
    update-locale LANG=en_IN.UTF-8 && \
    git config --global advice.detachedHead false && \
    chsh -s /user/bin/zsh 

# Install oh-my-zsh plugin manager for zsh
RUN zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Download and install zsh-autosuggestions plugin
RUN zsh -c 'git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions'

# Download & install zsh-syntax-highlighting plugin
RUN zsh -c 'git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting'

# Give Write permission to zshrc. 
# 644 - owner can read/write, group/others can read only
RUN chmod 644 ~/.zshrc

# To remove error -  zsh: can't rename /root/.zsh_history.new to $HISTFILE,
# HIST_SAVE_BY_COPY is unset, so zsh will not save command history to file 'zsh_history.new'.
# Note : zsh stores command history to temp file zsh_history.new and then on exit after renaming this file.
RUN echo 'unsetopt HIST_SAVE_BY_COPY' >> ~/.zshrc


# Install vim & xterm 
# --no-install-recommends flag is used here while installing vim and xterm 
#  because subsequent RUN commands are failing if this flag is used while installing build-essential, curl , git etc.
RUN apt-get update && \ 
     apt-get install --no-install-recommends -y  vim xterm



# To Set default text editor.
ENV EDITOR=${EDITOR}

# To Set the default terminal type.
ENV TERM=${TERM}


# Environment Variables
# Set environment variables for locales
# Set system language, character encoding and time zone.
# LC_ALL overrides Locale Settings. This is set explicitly because it had error if not set.
# This ensures that the programs and services running within the container handle language, 
# character encoding, and cultural formatting correctly. Time Zone is also set.

ENV LANG=${LANG}
ENV LANGUAGE=${LANGUAGE}
ENV LC_ALL=${LC_ALL}
ENV TZ=${TZ}


# Define the variable to store working directory (workspace).
ARG WORK_DIR="workspace"

# Create a directory to use as working directory.
 RUN mkdir -p "${WORK_DIR}"

# Set the working directory.
 WORKDIR "${WORK_DIR}"


# Clean local repository cache and remove automatically installed packages which are no longer needed.
# This will reduce size of the image.
RUN apt-get clean && \
rm -rf /var/lib/apt/lists/* &&\
apt-get autoremove -y

# Make the container running contineously.
# ENTRYPOINT ["/bin/zsh", "-c", "while true; do sleep 300; done"]

# Echo the message that , "C Development Container' image built successfully!".
RUN echo "'C Development Container' image built successfully!"