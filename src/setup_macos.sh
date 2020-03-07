#!/bin/zsh
#
# Setup MacOS
# 

# show full path on finder
defaults write com.apple.finder _FXShowPosixPathInTitle -boolean true

# show remaining battery power %
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# shorten key repeat interval
defaults write -g InitialKeyRepeat -int 15

# hide dock automatically
defaults write com.apple.dock autohide -bool true

# show hidden files on Finder
defaults write com.apple.finder AppleShowAllFiles TRUE

