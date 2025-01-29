#!/bin/bash
# Search for the window with "Visual Studio Code" in its name
WINDOW_ID=$(xdotool search --name "Visual Studio Code" | head -n 1)

# If a matching window is found, activate it and send Ctrl+E
if [ -n "$WINDOW_ID" ]; then
    xdotool windowactivate "$WINDOW_ID"
    sleep 0.1  # Add a small delay to ensure the window is fully active
    # Clear all modifiers
    xdotool keyup ctrl shift alt super
    # Send Ctrl+E
    xdotool keydown ctrl key y keyup ctrl
else
    # Play a beep if the window is not found
    paplay /usr/share/sounds/freedesktop/stereo/dialog-error.oga
fi