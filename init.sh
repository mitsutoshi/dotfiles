#!/bin/zsh

REPO_DIR="~/repos"

printf "password: "
read PASSWORD
printf "github username: "
read GHB_USER
printf "github password: "
read GHB_PASS

echo "\n [Setup MacOS]"
src/setup_macos.sh

echo "\n [Install Homebrew & Homebrew Package]"
src/add_brew.sh

echo "\n [Clone dotfiles repository]"
src/clone_dotfiles.sh $REPO_DIR $GHB_USER $GHB_PASS

echo "\n [Create symbolic link]"
src/add_symlink.sh
