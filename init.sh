#!/bin/zsh

REPO="github.com/mitsutoshi/dotfiles"

printf "password: "
read PASSWORD

echo "\n [Setup MacOS]"
# show full path on finder
defaults write com.apple.finder _FXShowPosixPathInTitle -boolean true

# show remaining battery power %
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# shorten key repeat interval
defaults write -g InitialKeyRepeat -int 15

# hide dock automatically
defaults write com.apple.dock autohide -bool true


echo "\n"
echo "===================================="
echo "Install Homebrew & Homebrew Package"
echo "===================================="
which brew > /dev/null
if [ $? -e 0 ]; then
    echo "Homebrew already exists [`which brew`]"
else
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    while read line; do yes | brew install $line; done < ./brew.lst
    while read line; do yes | brew install $line; done < ./brewcask.lst
fi


echo "\n"
echo "============================"
echo "Clone dotfiles"
echo "============================"
ghq get https://$REPO


echo "\n"
echo "============================"
echo "Setup Home Directory"
echo "============================"
ln -s ~/ghq/$REPO/.zshrc      .zshrc
ln -s ~/ghq/$REPO/.zshenv     .zshenv
ln -s ~/ghq/$REPO/.tmux       .tmux
ln -s ~/ghq/$REPO/.tmuxconf   .tmuxconf
ln -s ~/ghq/$REPO/.config     .config
ln -s .config/nvim            .vim
ln -s .config/nvim/init.vim   .vimrc

