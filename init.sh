#!/bin/zsh

REPO_DIR="~/repos"

printf "password: "
read PASSWORD
printf "github username: "
read GHB_USER
printf "github password: "
read GHB_PASS

echo "\n Change OS Settings"
echo "===================="

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

echo "Done\n"

echo "\n Install Homebrew & Homebrew Package"
echo "====================================="
which brew > /dev/null
if [ $? -e 0 ]; then
    echo "Homebrew already exists [`which brew`]"
else
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    while read line; do yes | brew install $line; done < ./brew.lst
    while read line; do yes | brew install $line; done < ./brewcask.lst
fi

echo "\n Setup Home Directory"
echo "======================"

#
# Get dotfiles repository
# =========================================================

# make directory for git
if [ ! -e $REPO_DIR]; then
    mkdir $REPO_DIR
fi

# clone
cd $REPO_DIR
git close "https://$GHB_USER:$GHB_PASS@github.com/$GHB_USER/dotfiles"
if [ $? -ne 0 ]; then
    echo "Failed to get dotfiles repository [https://github.com/$GHB_USER/dotfiles]"
    echo "Abort"
    exit 1
fi

#
# Create symbolik link
# =========================================================

function create_slink() {

    if [ ! -e $1 ]; then
        echo "$1 does not exists"
        return
    elif [ -e $2 ]; then
        echo "$2 already exists"
        return
    fi

    # ln -s $1 $2
    echo "[test] ln -s $1 $2"
    if [ $? -eq 0 ]; then
        echo "Symbolick link has been created: $1 -> $2"
    else
        echo "Failed to create symbolink link: $1 -> $2"
    fi
}

# create symbolink link to home directory
cd ~
for f in `ls -a $REPO_DIR | grep -e "^\.[a-zA-Z0-9]\+"`
do
    create_slink $REPO_DIR/$f $f
done
create_slink  $REPO_DIR/.config/nvim .vim
create_slink  $REPO_DIR/.config/nvim/init.vim .vimrc
