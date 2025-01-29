#!/bin/bash
# # Search for the window with "Visual Studio Code" in its name
# WINDOW_ID=$(xdotool search --name "Visual Studio Code" | head -n 1)

# # If a matching window is found, activate it and perform the actions
# if [ -n "$WINDOW_ID" ]; then
#     xdotool windowactivate "$WINDOW_ID"
#     sleep 0.1  # Add a small delay to ensure the window is fully active
#     # Click at x:140 y:6772
#     xdotool mousemove 140 6772 click 1
#     sleep 0.1  # Small delay before moving to the first location
#     # Move to x:53 y:4297 without clicking
#     xdotool mousemove 53 4297
# else
#     # Play a beep if the window is not found
#     paplay /usr/share/sounds/freedesktop/stereo/dialog-error.oga
# fi

# Search for the window with "Visual Studio Code" in its name
WINDOW_ID=$(xdotool search --name "Visual Studio Code" | head -n 1)

# If a matching window is found, activate it and send Ctrl+E
if [ -n "$WINDOW_ID" ]; then
    xdotool windowactivate "$WINDOW_ID"
    sleep 0.1  # Add a small delay to ensure the window is fully active
    # Clear all modifiers
    xdotool keyup ctrl shift alt super
    # Send Ctrl+E
    xdotool keydown ctrl key e keyup ctrl
else
    # Play a beep if the window is not found
    paplay /usr/share/sounds/freedesktop/stereo/dialog-error.oga
fi

