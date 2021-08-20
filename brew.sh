autoload colors; colors
echo $fg[green]Installing/Updating Homebrew$reset_color

yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 1>/dev/null

echo $fg[green]Installing/Updating apps from Brew$reset_color
brew update 1>/dev/null
brew upgrade 1>/dev/null

brew tap mongodb/brew
brew tap homebrew/cask-fonts

if [[ "$(uname -m)" == "x86_64" ]]; then
  brew install miniconda 1>/dev/null
else
  brew install miniforge 1>/dev/null
fi

brew install \
  mariadb \
  mongodb-community \
  mas \
  powershell \
  dotnet-sdk \
  1>/dev/null

brew install --cask \
  rider \
  visual-studio-code \
  julia \
  docker \
  font-fira-code \
  1>/dev/null
