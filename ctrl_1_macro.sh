#!/bin/bash

# Record the current mouse cursor position
CURSOR_POSITION=$(xdotool getmouselocation --shell)
CURSOR_X=$(echo "$CURSOR_POSITION" | grep "X=" | cut -d= -f2)
CURSOR_Y=$(echo "$CURSOR_POSITION" | grep "Y=" | cut -d= -f2)

# Function to activate a window and perform actions
activate_window_and_actions() {
    local window_name="$1"
    local click_x="$2"
    local click_y="$3"

    # Find the window ID by name
    local window_id=$(wmctrl -l | grep -i "$window_name" | awk '{print $1}' | head -n 1)

    if [ -n "$window_id" ]; then

        # Click at the specified coordinates
        xdotool mousemove "$click_x" "$click_y" click 1
        sleep 0.1  # Small delay to ensure the click is processed

        # Send Page_Down
        xdotool key Page_Down
        sleep 0.1  # Small delay to ensure the action is processed

        # Return the mouse cursor to the original position
        xdotool mousemove "$CURSOR_X" "$CURSOR_Y"

        return 0
    else
        return 1
    fi
}

# Check for "Deepseek"
if activate_window_and_actions "Deepseek" 385 1329; then
    exit 0
fi

# Check for "Claude"
if activate_window_and_actions "Claude" 302 1374; then
    exit 0
fi

# Check for "Gemini"
if activate_window_and_actions "Gemini" 359 1367; then
    exit 0
fi

# Check for "ChatGPT"
if activate_window_and_actions "ChatGPT" 440 1334; then
    exit 0
fi

# If none of the windows are found, play a beep
paplay /usr/share/sounds/freedesktop/stereo/dialog-error.oga

# Return the mouse cursor to the original position (fallback)
xdotool mousemove "$CURSOR_X" "$CURSOR_Y"