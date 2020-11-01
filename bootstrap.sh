#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# root check
if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

echo 'PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
xcode-select --install

#install brew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh
# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade
brew install vim --with-override-system-vi
brew install grep
brew install cocoapods
brew install swiftlint
brew install tree
brew install htop
brew install git
brew install zsh
brew cask install iterm2
brew cask install sourcetree
brew cask install 1password
brew cask install rectangle
brew cask install visual-studio-code
brew cask install macdown
brew cask install notion
brew install mas
brew cask install slack
brew cask install iina

brew tap homebrew/cask-fonts
brew cask install font-fira-code

brew cleanup

echo "dont forget to install chrome"
# curl -fsSL https://updates.cdn-apple.com/2019/cert/061-41823-20191025-5efc5a59-d7dc-46d3-9096-396bb8cb4a73/SwiftRuntimeForCommandLineTools.dmg
curl -fsSL https://raw.githubusercontent.com/guarinogabriel/mac-cli/master/mac-cli/tools/install
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k



# install brew casks and important apps
# set macos options
#./.macos