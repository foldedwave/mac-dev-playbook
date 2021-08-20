autoload colors; colors
echo $fg[green]***Installing/Updating Homebrew$reset_color

yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo $fg[green]***Installing/Updating apps from Brew$reset_color
brew update
brew upgrade

brew tap mongodb/brew

if [[ "$(uname -m)" == "x86_64" ]]; then
  brew install miniconda
else
  brew install miniforge
fi

brew install \
  mariadb \
  mongodb-community \
  mas \
  powershell \
  dotnet-sdk

brew install --cask \
  rider \
  visual-studio-code \
  julia \
  docker
