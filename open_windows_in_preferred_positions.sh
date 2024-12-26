#!/bin/bash

# Wait for the desktop environment to fully load
sleep 5

# Open Google Chrome windows
google-chrome --new-window "https://chatgpt.com" &  # First Chrome Window navigates to chatgpt.com
sleep 3
wmctrl -r "ChatGPT" -e 0,-4,0,1544,1730  # Position the ChatGPT window

google-chrome --new-window "https://www.noisli.com/favorites" &  # Second Chrome Window navigates to Noisli
sleep 3

# Find the "Favorites | Noisli - Google Chrome" window and move it
noisli_window=$(wmctrl -l | grep -i "Favorites | Noisli - Google Chrome" | awk '{print $1}')
if [ -n "$noisli_window" ]; then
    wmctrl -i -r "$noisli_window" -e 0,1537,0,1544,1249
fi

# Open Visual Studio Code
/usr/share/code/code &  # Open VS Code
sleep 3

# Find VS Code Window and Move It
vscode_window=$(wmctrl -l | grep -i "Visual Studio Code" | awk '{print $1}')
if [ -n "$vscode_window" ]; then
    wmctrl -i -r "$vscode_window" -e 0,183,1751,1663,1670
fi

# Open Obsidian via AppImage
/home/elliot/Applications/Obsidian-1.7.7_436a792a92d0f402e2cec3f90fd22d44.AppImage --no-sandbox %U &
sleep 3

# Find Obsidian Window and Move It
obsidian_window=$(wmctrl -l | grep -i "Obsidian" | awk '{print $1}')
if [ -n "$obsidian_window" ]; then
    wmctrl -i -r "$obsidian_window" -e 0,1849,1725,1096,1695
fi

# Open GNOME Terminal
gnome-terminal &
sleep 1
wmctrl -r "Terminal" -e 0,1537,1250,1528,455  # Adjusted position

# Ensure the script exits cleanly
exit 0

