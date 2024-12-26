#!/bin/bash

# List all windows with titles
wmctrl -l | while read -r line; do
    # Extract window ID and title
    win_id=$(echo "$line" | awk '{print $1}')
    title=$(echo "$line" | cut -d' ' -f5-)

    # Get window geometry using xdotool
    geometry=$(xdotool getwindowgeometry "$win_id" 2>/dev/null | grep -E 'Position|Geometry')

    # If xdotool fails, try xwininfo
    if [ -z "$geometry" ]; then
        geometry=$(xwininfo -id "$win_id" 2>/dev/null | grep -E 'Absolute upper-left|Width|Height' | awk '{print $NF}' | paste -s -d' ')
    fi

    # Display the window information
    echo "Window: $title"
    if [ -n "$geometry" ]; then
        echo "Geometry: $geometry"
    else
        echo "Geometry: Not available"
    fi
    echo
done

