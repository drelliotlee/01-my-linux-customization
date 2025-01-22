#!/bin/bash
# Search for the window with "Obsidian" in its name
WINDOW_ID=$(wmctrl -l | grep -i "Obsidian" | awk '{print $1}' | head -n 1)

# If a matching window is found, activate it
if [ -n "$WINDOW_ID" ]; then
    wmctrl -ia "$WINDOW_ID"
else
    # If the window is not found, play an error sound
    paplay /usr/share/sounds/freedesktop/stereo/dialog-error.oga
fi