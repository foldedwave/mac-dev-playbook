autoload colors; colors
echo $fg[green]Configuring macos$reset_color

# Dark mode
defaults write NSGlobalDomain AppleInterfaceStyle Dark
defaults delete NSGlobalDomain AppleInterfaceStyleSwitchesAutomatically
defaults write com.apple.dock "tilesize" -int "36" && killall Dock

# Keyboard repeat settings
defaults write NSGlobalDomain InitialKeyRepeat 25
defaults write NSGlobalDomain KeyRepeat 2

# ITerm2 prefs in custom location for syncing to dotfiles
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
