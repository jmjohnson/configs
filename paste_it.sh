#!/bin/bash

SAVED_CLIP="`xclip -selection clipboard -o`"
( printf "$*" |  xsel -b -i ; ) & # Reads from stdin
wait

xdotool key ctrl+v

printf "$SAVED_CLIP" | xsel -b -i && xsel --keep &
wait
disown
