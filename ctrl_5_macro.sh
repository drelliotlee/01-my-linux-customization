#!/bin/bash
# Search for the window with "ChatGPT" in its name
WINDOW_ID=$(wmctrl -l | grep -i "ChatGPT" | awk '{print $1}' | head -n 1)

# If a matching window is found, activate it and send Ctrl+End followed by Shift+Escape
if [ -n "$WINDOW_ID" ]; then
    wmctrl -ia "$WINDOW_ID"
    sleep 0.2  # Add a small delay to ensure the window is fully active
    # Clear all modifiers
    xdotool keyup ctrl shift alt super
    # Send Ctrl+End
    xdotool keydown ctrl key End keyup ctrl
    sleep 0.2  # Small delay before sending the next key
    # Send Shift+Escape
    xdotool keydown shift key Escape keyup shift
fi
