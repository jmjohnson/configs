#!/bin/bash

# Save the clipboard to a variable
SAVED_CLIP="`xclip -selection clipboard -o`"

# Send this script's arguments to the clipboard selection.
## Presumably, xsel attaches the cliboard selection to this currently running program.
printf "$*" |  xsel -b -i
xsel --keep &
wait # May not be needed..?

# Send the paste command.
## TODO: Use a default ctrl v and add special cases for gnome terminal.
xdotool key ctrl+v

# Restore the clipboard contents.
printf "$SAVED_CLIP" | xsel -b -i

# Ask xsel to fork into a new process group and hold onto the selection... This will only work for text selections...
xsel --keep
