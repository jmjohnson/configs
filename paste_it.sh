#!/bin/bash

SAVED_CLIP="`xclip -selection c -o`"
printf "$@" | xclip -selection c -in # Reads from stdin
xdotool key ctrl+shift+v
printf "$SAVED_CLIP" | xclip -selection c -in
