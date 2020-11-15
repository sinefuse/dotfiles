#!/usr/bin/env bash
# Installer script for dotfiles among other things
echo "Welcome to the installer script. This will guide you through installing all the necessary things to have your nonsense just work... hopefully."
echo "Please note that this script is tailored for use with Fedora 33."
read -rsp $'Press any key to continue.\n' -n1 key
echo "Switching to home directory."
cd ~

# Install rpmfusion, first and foremost
echo "Installing rpmfusion..."
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
# Install some copr repositories
echo "Enabling a copr repository..."
sudo dnf copr enable mhdahmad/workstation -y
 
# Install developer group packages for the sake of having that stuff
# ...do I really need to, though? lol
# I'll add this later, it's not super important anyways.
 
# Install all the dependencies
echo "Installing a bunch of needed packages..."
sudo dnf install gnome-tweaks util-linux-user htop maim xdotool xclip mpd ncmpcpp neofetch sakura mpv obs-studio stow terminus-fonts zsh discord arc-theme -y
 
# Install Oh-My-Zsh, but unattended so we can keep going our merry way
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/uninstall.sh)" "" --unattended
 
# Oh-My-Zsh will generate its own .zshrc. We have our own in our dotfiles,
# So we're getting rid of this one.
cd ~
rm .zshrc
 
# Time to stow, baby
cd dotfiles
# We only want to stow things inside of the directories, so we're doing just that
stow -t ~ */
# Grab maimfuse.
echo "Grabbing maimfuse..."
cd ~
git clone https://github.com/sinefuse/maimfuse
 
# Get maimfuse working.
echo "maimfuse grabbed, installing..."
cd maimfuse
chmod +x maimfuse
sudo ln -s ~/maimfuse/maimfuse /usr/local/bin/maimfuse
 
# change shell into zsh
echo "Changing shell into zsh..."
chsh -s /bin/zsh
 
# gg ez
echo "Done!"
echo "Remember to set your preferred applications."
read -rsp $'Please log out and back in to have everything working.' -n1 key