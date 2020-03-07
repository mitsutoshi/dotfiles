#!/bin/zsh
#
# Create symbolik link
# 

function create_slink() {

    if [ ! -e $1 ]; then
        echo "$1 does not exists"
        return
    elif [ -e $2 ]; then
        echo "$2 already exists"
        return
    fi

    ln -s $1 $2
    if [ $? -eq 0 ]; then
        echo "Symbolick link has been created: $1 -> $2"
    else
        echo "Failed to create symbolink link: $1 -> $2"
    fi
}

DIR=`pwd`

# create symbolink link to home directory
cd ~
for f in `ls -a $REPO_DIR | grep -e "^\.[a-zA-Z0-9]\+"`
do
    create_slink $REPO_DIR/$f $f
done
create_slink  $REPO_DIR/.config/nvim .vim
create_slink  $REPO_DIR/.config/nvim/init.vim .vimrc

# back to original directory
cd $DIR
