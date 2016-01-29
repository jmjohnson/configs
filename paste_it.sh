#!/bin/bash

SAVED_CLIP="`xclip -selection clipboard -o`"
printf "$*" | xclip -selection clipboard -in & # Reads from stdin
wait

xdotool key ctrl+v
printf "$SAVED_CLIP" | xclip -selection clipboard -in
