#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

TARGET=$1
DEFAULT_TARGET=~/.config/nvim

if [ -z "$TARGET" ]
then
    read -p "No target defined. Use default? [$DEFAULT_TARGET] (y/Y/n/N)" -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]] 
    then
        TARGET=$DEFAULT_TARGET
    else
        echo "Error: Target Folder must me defined"
        exit
    fi
fi
cd $SCRIPT_DIR
cd ..
cp -rv ./init.vim $TARGET/init.vim
cp -rv ./lua $TARGET
