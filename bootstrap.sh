#!/bin/bash

#set verbose mode 
set -x
# Checks if executable exists in current path
command_exists () {
  command -v "$1" > /dev/null 2>&1;
}

# Ask for the administrator password upfront
echo "need admin pw for everything"
sudo -v

# root check
if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi



if ! command_exists xcode-select
then
    echo "installing xcode commandline tools"
    xcode-select --install
else
    echo "xcode comandline tools already installed"

# Check if Homebrew is available
if ! command_exists brew
then
  echo 'Homebrew not found, will installing it'
  echo "install brew"
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh
else
  echo "Update Homebrew ..."
  brew update
fi

ech "upgrading brew formulae"
brew upgrade

echo "installing tools"
brew install vim --with-override-system-vi
brew install grep
brew install cocoapods
brew install swiftlint
brew install tree
brew install htop
brew install git
brew install zsh
brew install robotsandpencils/made/xcodes
brew install aria2

echo "installing casks"
brew install --cask iterm2
brew install --cask 1password
brew install --cask rectangle
brew install --cask visual-studio-code
brew install --cask chrome
brew install --cask deepl
brew install --cask iina
brew install --cask spotify
brew install --cask beekeeper-studio
brew install --cask gitkraken
brew install --cask xcodes

echo "install fira font"
brew tap homebrew/cask-fonts
brew install --cask font-fira-code

echo "clean up"
brew cleanup

echo "install oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "generate xcodes comandline completions"
mkdir ~/.oh-my-zsh/completions
xcodes --generate-completion-script > ~/.oh-my-zsh/completions/_xcodes

echo "installing latest xcode"
xcodes install --latest --experimental-unxip

echo "updating path"
echo 'PATH="/usr/local/bin:$PATH"' >> ~/.zshrc

# curl -fsSL https://github.com/twostraws/ControlRoom.git
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "dont forgett to install Icon Set Generator, Amphetamine Craft from App Store!"

#./.macos