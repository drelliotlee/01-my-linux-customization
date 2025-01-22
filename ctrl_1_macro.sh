#!/bin/bash

# Record the current mouse cursor position
CURSOR_POSITION=$(xdotool getmouselocation --shell)
CURSOR_X=$(echo "$CURSOR_POSITION" | grep "X=" | cut -d= -f2)
CURSOR_Y=$(echo "$CURSOR_POSITION" | grep "Y=" | cut -d= -f2)

# Function to activate a window and perform actions
activate_window_and_clicks() {
    local window_name="$1"
    shift
    local window_id=$(wmctrl -l | grep -i "$window_name" | awk '{print $1}' | head -n 1)

    if [ -n "$window_id" ]; then
        wmctrl -ia "$window_id"
        sleep 0.1  # Ensure the window is fully activated

        while [ $# -gt 0 ]; do
            if [ "$1" == "click" ]; then
                xdotool mousemove "$2" "$3" click 1
                shift 3
            elif [ "$1" == "pagedown" ]; then
                xdotool key Page_Down
                shift 1
            fi
        done

        return 0
    else
        return 1
    fi
}

# Check for "ChatGPT"
if activate_window_and_clicks "ChatGPT" click 1079 1790 click 1803 3128 click 1125 3254; then
    xdotool mousemove "$CURSOR_X" "$CURSOR_Y"  # Return to the original cursor position
    exit 0
fi

# Check for "Deepseek"
if activate_window_and_clicks "Deepseek" click 1170 1659 pagedown click 1021 3227; then
    xdotool mousemove "$CURSOR_X" "$CURSOR_Y"  # Return to the original cursor position
    exit 0
fi

# Check for "Claude"
if activate_window_and_clicks "Claude" click 918 708 pagedown click 211 3325; then
    xdotool mousemove "$CURSOR_X" "$CURSOR_Y"  # Return to the original cursor position
    exit 0
fi

# If none of the windows are found, play a beep
paplay /usr/share/sounds/freedesktop/stereo/dialog-error.oga

# Return the mouse cursor to the original position
xdotool mousemove "$CURSOR_X" "$CURSOR_Y"
