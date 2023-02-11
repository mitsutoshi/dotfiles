dotfiles
========

dotfiles is a tool to build my home directory. This tool will do the following.

* Change MacOS settings
* Install Homebrew & Homebrew package
* Apply dotfiles to home directory

## Usage

Execute following command for setup. Files in this repository will be installed in home directory.

### Steps

1. Download `init.sh` to your computer.

    ```zsh
    curl -O "https://raw.githubusercontent.com/mitsutoshi/dotfiles/master/init.sh"
    ```

2. Run `init.sh`, then input your MacOS password, Github username and password.

    ```zsh
    dotfiles % ./init.sh
    PASSWORD: xxxxxx
    ```

## Set up

1. Install xcode-select

    ```zsh
    xcode-select --install
    ```

2. Set up `~/.ssh`

    1. Generate new key-pair or place files to `~/.ssh` to authenticate GitHub.

    2. If key generated, register it to the GitHub.

3. Set up Homebrew

    1. Install Homebrew

        ```zsh
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        ```

    2. Install package

        ```
        while read line; do yes | brew install $line; done < ./brew.lst
        while read line; do yes | brew install $line; done < ./brewcask.lst
        ```

### Get github repository

```
ghq get -p https://$REPO
```


### Setup neovim

#### Clone dein.vim

```zsh
ghq get -p https://github.com/Shougo/dein.vim
```

#### Create virtualenv and install neovim into python3

```zsh
pyenv install ${python-version}
pyenv virtualenv ${python-version} neovim-python3
pyenv activate neovim-python3
pip install neovim
pyenv deactivate
```

Avobe command expect below definition in `.config/nvim/init.vim`.

```.
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim-python3/bin/python'
```
