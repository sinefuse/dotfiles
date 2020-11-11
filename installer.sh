#!/usr/bin/env bash
# Installer script for dotfiles among other things

# Basically a more or less guided thing to install stuff.
# Right now, there isn't really anything in here except for a few snippets that I am gonna need.
echo Welcome to the installer script. This will guide you through installing all the necessary things to have your nonsense just work... hopefully.
read -rsp $'Press any key to continue.\n' -n1 key
echo Key pressed, you did thing.

# I'll work on this a bit more but outside of a VM that I currently use. Atom keeps shooting itself in the foot lol
# However, here's a list of the things that this script will do for me:
# Install rpmfusion, first and foremost

# Install some copr repositories
# mhdahmad/workstation

# Install developer group packages for the sake of having that stuff

# Check whether Cinnamon is installed, just in case.

# Install all the dependencies
# sudo dnf install gnome-tweaks util-linux-user
