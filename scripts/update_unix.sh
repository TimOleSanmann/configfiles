#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

TARGET=$1
DEFAULT_TARGET=~/.config

if [ -z "$TARGET" ]
then
    read -p "No target defined. Use default? [$DEFAULT_TARGET] (y/Y/n/N)" -n 1 -r
    printf "\n"
    if [[ $REPLY =~ ^[Yy]$ ]] 
    then
        TARGET=$DEFAULT_TARGET
    else
        echo "Error: Target Folder must be defined"
        exit
    fi
fi
cd $SCRIPT_DIR
cd ..
cp -rv ./nvim $TARGET
cp -rv ./sketchybar $TARGET
cp -rv ./skhd $TARGET
cp -rv ./yabai $TARGET
