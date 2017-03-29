#!/bin/bash

# Save the clipboard to a variable
SAVED_CLIP="`xsel --clipboard -o`"

# Send this script's arguments to the clipboard selection.
## Presumably, xsel attaches the cliboard selection to this currently running program.
xsel --clipboard --clear
printf "$*" |  xsel -b -i

# Send the paste command.
## TODO: Use a default ctrl v and add special cases for gnome terminal.
xdotool key ctrl+v

# Restore the clipboard contents.
printf "$SAVED_CLIP" | xsel -b -i
