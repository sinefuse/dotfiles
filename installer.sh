#!/usr/bin/env bash
# Installer script for dotfiles among other things

# Basically a more or less guided thing to install stuff.
# This is an early version, so be warned. lol
echo "Welcome to the installer script. This will guide you through installing all the necessary things to have your nonsense just work... hopefully."
echo "Please note that this script is tailored for use with Fedora 33."
read -rsp $'Press any key to continue.\n' -n1 key
echo "Switching to home directory."
cd ~
# I'll work on this a bit more but outside of a VM that I currently use. Atom keeps shooting itself in the foot lol
# However, here's a list of the things that this script will do for me:
# Install rpmfusion, first and foremost
echo "Installing rpmfusion..."
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
# Install some copr repositories
echo "Enabling a copr repository..."
sudo dnf copr enable mhdahmad/workstation

# Install developer group packages for the sake of having that stuff
# ...do I really need to, though? lol
# I'll add this later, it's not super important anyways.

# Install all the dependencies
echo "Installing a bunch of needed packages..."
sudo dnf install gnome-tweaks util-linux-user htop maim xdotool xclip mpd ncmpcpp neofetch sakura mpv obs-studio stow terminus-fonts zsh discord -y

# stow the shit because stow is pretty fuckin neat tbh
cd dotfiles
stow sakura zsh
# todo find a way to ignore installer.sh as stow shits itself if i try "stow *"
# grab maimfuse
echo "Grabbing maimfuse..."
cd ~
git clone https://github.com/sinefuse/maimfuse

# get maimfuse working
echo "maimfuse grabbed, installing..."
cd maimfuse
chmod +x maimfuse
sudo ln -s ~/maimfuse/maimfuse /usr/local/bin/maimfuse

# change shell into zsh
echo "Changing shell into zsh..."
chsh -s /bin/zsh

# gg ez
echo "Done!"
read -rsp $'Please log out and back in to have everything working.' -n1 key
