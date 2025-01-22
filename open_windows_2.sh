#!/bin/bash

# Function to check for external monitors
check_external_monitor() {
    external_monitor=$(xrandr | grep " connected" | grep -v "primary" | awk '{print $1}')
    if [ -z "$external_monitor" ]; then
        echo "No external monitor connected."
        return 1
    fi
    return 0
}

# Function to handle window management
manage_window() {
    local window_name=$1
    local command=$2
    local position=$3

    window_id=$(wmctrl -l | grep -i "$window_name" | awk '{print $1}')
    if [ -n "$window_id" ]; then
        wmctrl -i -r "$window_id" -e "$position"
    else
        eval "$command" &
        sleep 2
        window_id=$(wmctrl -l | grep -i "$window_name" | awk '{print $1}')
        if [ -n "$window_id" ]; then
            wmctrl -i -r "$window_id" -e "$position"
        fi
    fi
}

# Manage Visual Studio Code
manage_window "Visual Studio Code" "/usr/share/code/code" "0,0,3457,3450,3460"

# Manage Obsidian
manage_window "Obsidian" "/home/elliot/Applications/Obsidian-1.7.7_436a792a92d0f402e2cec3f90fd22d44.AppImage --no-sandbox %U" "0,3451,3457,2086,3290"

# Manage Noisli
manage_window "Noisli" "/opt/google/chrome/google-chrome --profile-directory=Default --app-id=gkgbglbaloldkpegmfbancknhcppcfao" "0,3422,6671,1000,310"

# Manage Stopwatch
manage_window "Stopwatch" "/opt/google/chrome/google-chrome --profile-directory=Default --app-id=pdblaehbpalhkncehapjcegeogblkjdf" "0,4425,6671,1140,310"

# Check for external monitor
if check_external_monitor; then
    # Manage ChatGPT
    manage_window "ChatGPT" "google-chrome --new-window 'https://chatgpt.com/'" "0,-35,-20,3140,3535"

    # Manage New Tab
    manage_window "New Tab - Google Chrome" "google-chrome --new-window" "0,3041,-20,3130,3535"
fi

# Ensure the script exits cleanly
exit 0
