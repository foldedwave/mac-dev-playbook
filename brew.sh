#!/bin/zsh

autoload colors; colors
echo $fg[green]Installing/Updating Homebrew$reset_color

yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
if [[ "$(uname -m)" == "x86_64" ]]; then
  echo 'eval "$(/usr/local/Homebrew/bin/brew shellenv)"' >> /Users/david/.zprofile
  eval "$(/usr/local/Homebrew/bin/brew shellenv)"
else
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/david/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo $fg[green]Installing/Updating apps from Brew$reset_color
brew update 1>/dev/null
brew upgrade 1>/dev/null

brew tap mongodb/brew

brew install --quiet miniconda

brew install --quiet mas
brew install --quiet powershell
brew install --quiet dotnet-sdk
brew install --quiet romkatv/powerlevel10k/powerlevel10k
brew install --quiet task
brew install --quiet timewarrior
brew install --quiet ansible
brew install --quiet gnupg
brew install --quiet htop
brew install --quiet wget

#brew install --quiet mariadb
#brew install --quiet mongodb-community

brew install --quiet colima
brew install --quiet docker
#brew install --quiet kubernetes-cli
#brew install --quiet kompose
#brew install --quiet helm


#brew install --cask iterm2
#brew install --quiet --cask rider
brew install --quiet --cask visual-studio-code
#brew install --quiet --cask docker
brew install --quiet --cask logseq
brew install --quiet --cask kitty
