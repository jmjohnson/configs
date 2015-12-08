#!/bin/bash

SAVED_CLIP="`xclip -selection c -o`"
printf "$@" | xclip -selection c -in # Reads from stdin
xdotool key shift+Insert
printf "$SAVED_CLIP" | xclip -selection c -in
