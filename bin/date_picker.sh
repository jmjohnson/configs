#!/bin/bash

# TODO: Set the WINDOWID environment variable to one of the windows, perhaps the
# currently active one. Otherwise, xmonad tries to tile it.
paste_it.sh "`zenity --calendar --width=1 --height=1`"
