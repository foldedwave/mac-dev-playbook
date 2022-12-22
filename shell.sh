#!/bin/zsh

autoload colors; colors
echo $fg[green]Configuring shell$reset_color

open macdev.terminal

defaults write com.apple.terminal 'Default Window Settings' "macdev"
defaults write com.apple.terminal 'Startup Window Settings' "macdev"

