autoload colors; colors
echo $fg[green]Installing/Updating Homebrew$reset_color

yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/david/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo $fg[green]Installing/Updating apps from Brew$reset_color
brew update 1>/dev/null
brew upgrade 1>/dev/null

brew tap mongodb/brew
#brew tap homebrew/cask-fonts

if [[ "$(uname -m)" == "x86_64" ]]; then
  brew install --quiet miniconda
else
  brew install --quiet miniforge
fi

brew install --quiet mariadb
brew install --quiet mongodb-community
brew install --quiet mas
brew install --quiet powershell
brew install --quiet dotnet-sdk
brew install --quiet colima
brew install --quiet docker
brew install --quiet romkatv/powerlevel10k/powerlevel10k
brew install --quiet eask

brew install --cask iterm2
#brew install --quiet --cask vscodium
#brew install --quiet --cask rider
brew install --quiet --cask visual-studio-code
#brew install --quiet --cask julia
#brew install --quiet --cask docker
