#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
if [ -z "$1" ]
then echo "Error: Target Folder must me defined"
    exit
fi

cd $SCRIPT_DIR
cp -rv .. $1
