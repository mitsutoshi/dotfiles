#!/bin/zsh
#
# Install Homebrew & Homebrew Package
# 

which brew > /dev/null
if [ $? -e 0 ]; then
    echo "Homebrew already exists [`which brew`]"
else
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    while read line; do yes | brew install $line; done < ./brew.lst
    while read line; do yes | brew install $line; done < ./brewcask.lst
fi
