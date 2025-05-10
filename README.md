dotfiles
========

dotfiles is a tool to build my home directory. This tool will do the following.

* Change MacOS settings
* Install Homebrew & Homebrew package
* Apply dotfiles to home directory

## How to set up

Execute following command for setup.

1. Install xcode-select

    ```zsh
    xcode-select --install
    ```

2. Set up `~/.ssh`

    1. Generate new key-pair or place files to `~/.ssh` to authenticate GitHub.

    2. If key generated, register it to the GitHub.

3. Download `init.sh` to your computer.

    ```zsh
    curl -O "https://raw.githubusercontent.com/mitsutoshi/dotfiles/master/init.sh"
    ```

4. Run `init.sh`, then input your MacOS password, Github username and password.

    ```zsh
    dotfiles % ./init.sh
    PASSWORD: xxxxxx
    ```
