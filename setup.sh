#!/bin/bash

# Install: Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install: Bashstrap
cd; curl -#L https://github.com/barryclark/bashstrap/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,screenshot.png}

# Install: Node Version Manager
brew install nvm
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
echo '. "/usr/local/opt/nvm/nvm.sh"' >> ~/.bashrc

source ~/.bashrc

brew install yarn
