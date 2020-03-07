dotfiles
========

dotfiles is my home directory build tool. This tool will do the following.

* Change MacOS settings
* Install Homebrew & Homebrew package
* Apply dotfiles to home directory

## Usage

Execute following command for setup.  Files in this repositorys will be installed in home directory.

### Steps

1. Download `init.sh` to your computer.

    ```zsh
    curl -O "https://raw.githubusercontent.com/mitsutoshi/dotfiles/master/init.sh"
    ```

2. Run `init.sh`, then input your MacOS password, Github username and password.

    ```zsh
    dotfiles % ./init.sh
    password: xxxxxx
    github username: xxxxxx
    github password: xxxxxx
    ```
