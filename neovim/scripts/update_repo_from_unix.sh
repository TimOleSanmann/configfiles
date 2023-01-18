#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SOURCE=$1
DEFAULT_SOURCE=~/.config/nvim

if [ -z "$SOURCE" ] then 
    read -p "No source defined. Use default? [$DEFAULT_SOURCE] (y/Y/n/N)" -n 1 -r
    if [[ $REPLY =~ ˆ[Yy]$ ]]
    then
        SOURCE=$DEFAULT_SOURCE
    else
        echo "Error: Source folder must me defined"
        exit
    fi
fi

cd $SCRIPT_DIR
cd ..
cp -rv $SOURCE .
