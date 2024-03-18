# Config Files

This is my personal config file repository. Within those folders i store my scripts and configs i reuse whenever i setup a new environment. Beside the config files the most folders contain a detailed step by step description which commands at what point have to be done. This allows me to reproduce the installation everytime and using git to track the changes over time.
## Setup
### Nerd Font
Install and configure Hack Nerd Font for the Terminal emulator:
[Nerdfont](https://www.nerdfonts.com/)
### Zsh
On Linux and macOS, make sure, the used shell is ZSH.
### Git, Curl
Make sure, git and curl are installed and configured
### Oh my ZSH
Follow the installation instructions for Oh my ZSH on
[Ohmyzsh](https://ohmyz.sh/#install)

### Oh my ZSH Plugins
- git
- docker
- npm
- zsh-autosuggestions

## Lazygit
Install Lazygit following the installation guide:
[Lazygit](https://github.com/jesseduffield/lazygit#installation)

## GCC
Make sure gcc is installed.

## Delta
Delta is a git diff tool. Install it with the following repo:
[Delta](https://github.com/dandavison/delta)

## Docker
Make sure Docker is installed.
For Windows and macOS you can follow [Docker](https://www.docker.com/)
### When WSL is used
You can set a configuration to use the windows docker desktop environment from the used WSL distro to avoid installing docker inside the devloping WSL distro. Therefore, go into Docker Desktop --> Settings --> Resources --> WSL Integration. There you can check the distros where you want to use docker.

For openSUSE do:
```
sudo zypper install docker
```
## TMUX
First install tmux as the go to window multiplexer.

### TPM 
Install [TPM](https://github.com/tmux-plugins/tpm).

## Sketchybar
Install Sketchybar as described in the [official documentation](https://github.com/FelixKratz/SketchyBar). Afterwards, copy the config from the Sketchybar directory to the config directory.

## skhd
Install skhd as described in the [official documentation](https://github.com/koekeishiya/skhd). Afterwards, copy the config from the skhd directory to the config directory.

## yabai
Install yabai as described in the [official documentation](https://github.com/koekeishiya/yabai). Afterwards, copy the config from the yabai directory to the config directory.

IMPORTANT: Follow every step in the configuration, since this is crucial to make it run properly. Otherwise you can face several issues.
