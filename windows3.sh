#!/bin/bash

# Check if external monitor is connected using xrandr
if xrandr | grep -q "HDMI-1 connected" || xrandr | grep -q "DP-1 connected"; then
    # Get window IDs for existing Chrome windows
    window_ids=($(wmctrl -l | grep "Google Chrome" | cut -d' ' -f1))
    num_windows=${#window_ids[@]}

    case $num_windows in
        0)  # No existing windows - create two new ones
            google-chrome --new-window &
            sleep .5
            google-chrome --new-window &
            sleep .5
            # Get the new window IDs
            window_ids=($(wmctrl -l | grep "Google Chrome" | cut -d' ' -f1))
            ;;
        1)  # One existing window - create one new one
            # Move existing window to first position
            wmctrl -i -r "${window_ids[0]}" -e 0,-15,-10,1313,1480
            # Create second window
            google-chrome --new-window &
            sleep .5
            # Get updated window IDs
            window_ids=($(wmctrl -l | grep "Google Chrome" | cut -d' ' -f1))
            ;;
        *)  # Two or more windows - use the first two found
            ;;
    esac

    # Position the windows (using first two if more than two exist)
    if [ ${#window_ids[@]} -ge 2 ]; then
        # Move first window to left position
        wmctrl -i -r "${window_ids[0]}" -e 0,-15,-10,1313,1480
        # Move second window to right position
        wmctrl -i -r "${window_ids[1]}" -e 0,1270,-10,1310,1480
    else
        echo "Error: Could not find or create enough Chrome windows"
    fi
fi

manage_window() {
    local window_name=$1
    local command=$2
    local position=$3

    window_id=$(wmctrl -l | grep -i "$window_name" | awk '{print $1}')
    if [ -n "$window_id" ]; then
        wmctrl -i -r "$window_id" -e "$position"
    else
        eval "$command" &
        sleep .5
        window_id=$(wmctrl -l | grep -i "$window_name" | awk '{print $1}')
        if [ -n "$window_id" ]; then
            wmctrl -i -r "$window_id" -e "$position"
        fi
    fi
}

# Move/Create VS Code
manage_window "Visual Studio Code" "/usr/share/code/code" "0,0,1470,1520,1566"

# Move/Create Obsidian
manage_window "Obsidian" "/home/elliot/Applications/Obsidian-1.7.7_436a792a92d0f402e2cec3f90fd22d44.AppImage --no-sandbox %U" "0,1521,1440,1040,1520"

# Move/Create Noisli
manage_window "Noisli" "/opt/google/chrome/google-chrome --profile-directory=Default --app-id=gkgbglbaloldkpegmfbancknhcppcfao" "0,1506,2921,536,150"

# Move/Create Stopwatch
manage_window "Stopwatch" "/opt/google/chrome/google-chrome --profile-directory=Default --app-id=pdblaehbpalhkncehapjcegeogblkjdf" "0,2021,2921,565,150"