#!/bin/sh

TYPE=$(yabai -m query --spaces | jq '.[] | select(.["has-focus"] == true) | .type')
TYPE=$(echo ${TYPE} | sed 's/"//g')


sketchybar --set $NAME icon="" label="${TYPE}"
