#!/bin/bash

SAVED_CLIP="`xclip -selection clipboard -o`"
TMP_PIPE=<(printf "$*" | xclip -verbose -loops 0 -selection clipboard -in 2>&1 | tee >(grep -m1 "Waiting for sel") > /dev/null ) # Reads from stdin
read < TMP_PIPE
xdotool key ctrl+v
printf "$SAVED_CLIP" | xclip -selection clipboard -in
