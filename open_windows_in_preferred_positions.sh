#!/bin/bash

# Wait for the desktop environment to fully load
sleep 5

# Open Google Chrome windows
google-chrome --new-window &  # First Chrome Window
sleep 1

# Find the "New Tab - Google Chrome" window and move it
new_tab_window=$(wmctrl -l | grep -i "New Tab - Google Chrome" | awk '{print $1}')
if [ -n "$new_tab_window" ]; then
    wmctrl -i -r "$new_tab_window" -e 0,-4,0,1544,1730
fi

# Open YouTube as a Chrome App
/opt/google/chrome/google-chrome --profile-directory=Default --app-id=agimnkijcaahngcdmfeangaknmldooml &
sleep 1

# Find the "YouTube" window and move it
youtube_window=$(wmctrl -l | grep -i "YouTube" | awk '{print $1}')
if [ -n "$youtube_window" ]; then
    wmctrl -i -r "$youtube_window" -e 0,1536,0,1032,773
fi

# Open Pomoup as a Chrome App
/opt/google/chrome/google-chrome --profile-directory=Default --app-id=pncanlcaipgfjknfdlagpdhioooabcjh &
sleep 1

# Find the "Pomoup" window and move it
pomoup_window=$(wmctrl -l | grep -i "Pomoup" | awk '{print $1}')
if [ -n "$pomoup_window" ]; then
    wmctrl -i -r "$pomoup_window" -e 0,2568,0,508,662
fi

# Open Visual Studio Code
/usr/share/code/code &  # Open VS Code
sleep 3

# Find VS Code Window and Move It
vscode_window=$(wmctrl -l | grep -i "Visual Studio Code" | awk '{print $1}')
if [ -n "$vscode_window" ]; then
    wmctrl -i -r "$vscode_window" -e 0,154,1776,2765,1704
fi

# Open Obsidian via AppImage
/home/elliot/Applications/Obsidian-1.7.7_436a792a92d0f402e2cec3f90fd22d44.AppImage --no-sandbox %U &
sleep 2

# Find Obsidian Window and Move It
obsidian_window=$(wmctrl -l | grep -i "Obsidian" | awk '{print $1}')
if [ -n "$obsidian_window" ]; then
    wmctrl -i -r "$obsidian_window" -e 0,1536,658,1536,1070
fi

# Ensure the script exits cleanly
exit 0

