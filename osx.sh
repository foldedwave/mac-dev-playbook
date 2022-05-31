autoload colors; colors
echo $fg[green]Configuring macos$reset_color

defaults write NSGlobalDomain AppleInterfaceStyle Dark
defaults delete NSGlobalDomain AppleInterfaceStyleSwitchesAutomatically
defaults write com.apple.dock "tilesize" -int "36" && killall Dock
