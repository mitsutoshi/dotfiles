#!/bin/zsh
#
# Get dotfiles repository
# 

REPO_DIR=$1
GHB_USER=$2
GHB_PASS=$3

# make directory for git
if [ ! -e $REPO_DIR]; then
    mkdir $REPO_DIR
fi

# clone repository
cd $REPO_DIR
git close "https://$GHB_USER:$GHB_PASS@github.com/$GHB_USER/dotfiles"
if [ $? -ne 0 ]; then
    echo "Failed to get dotfiles repository [https://github.com/$GHB_USER/dotfiles]"
    echo "Abort"
    exit 1
fi
