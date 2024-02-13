#!/bin/bash


# Check if git is installed or not
if ! command -v git &> /dev/null; then
  echo "Git is not installed, installing git ..."
  sudo pacman -Sy --noconfirm git

  # Check if git install was a success or not
  if ! command -v git &> /dev/null; then
    echo "Failed to install git, check your internet maybe!"
    exit 1
  else
    echo "Git installed successfully"
  fi
fi

# Check if yay is installed or not
if command -v yay &> /dev/null; then
  echo "yay is already installed"
else
  # Clone yay repo
  git clone https://aur.archlinux.org/yay.git
  
  # Build and install yay
  cd yay
  makepkg -si

  # Check if yay was successfully installed
  if command -v yay &> /dev/null; then
    echo "yay has been installed successfully"
  else
    echo "Failed to install yay, check your internet maybe!"
  fi

  # Delete the yay repo from local machine
  cd ..
  rm -rf yay
fi

# Install some required softwares (I use them so yeah, feel free to modify the script)
yay -S --noconfirm \
  curl google-chrome \
  spotify discord \
  xwaylandvideobridge \
  neofetch neovim-git \
  visual-studio-code-bin \
  htop bpytop freshfetch \
  gcc clang go base-devel opencl-amd \
  ttf-symbola noto-fonts-cjk \
  noto-fonts-emoji ttf-twemoji \
  podman-docker

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Node using Volta
curl https://get.volta.sh | bash

# Activate the changes
source ~/.bashrc
