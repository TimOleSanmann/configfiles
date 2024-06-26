#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

SOURCE=$1
DEFAULT_SOURCE=~/.config

if [ -z "$SOURCE" ] 
then 
    read -p "No source defined. Use default? [$DEFAULT_SOURCE] (y/Y/n/N)" -n 1 -r
    printf "\n"
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        SOURCE=$DEFAULT_SOURCE
    else
        echo "Error: Source folder must be defined"
        exit
    fi
fi

cd $SCRIPT_DIR
cd ..
cp ~/.tmux.conf ./.tmux.conf
cp -rv $SOURCE/nvim .
cp -rv $SOURCE/sketchybar .
cp -rv $SOURCE/skhd .
cp -rv $SOURCE/yabai .
