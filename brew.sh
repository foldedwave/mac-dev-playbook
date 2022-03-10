autoload colors; colors
echo $fg[green]Installing/Updating Homebrew$reset_color

yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" > /dev/null

echo $fg[green]Installing/Updating apps from Brew$reset_color
brew update 1>/dev/null
brew upgrade 1>/dev/null

brew tap mongodb/brew
brew tap homebrew/cask-fonts

if [[ "$(uname -m)" == "x86_64" ]]; then
  brew install --quiet miniconda
else
  brew install --quiet miniforge
fi

brew install --quiet \
  mariadb \
  mongodb-community \
  mas \
  powershell \
  dotnet-sdk

brew install --quiet --cask \
  rider \
  visual-studio-code \
  julia \
  docker \
  font-fira-code
