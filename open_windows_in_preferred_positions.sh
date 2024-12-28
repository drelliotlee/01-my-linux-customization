#!/bin/bash

# Wait for the desktop environment to fully load
sleep 5

# Open ChatGPT in Chrome
google-chrome --new-window "https://chatgpt.com/" &
sleep 2
chatgpt_window=$(wmctrl -l | grep -i "ChatGPT" | awk '{print $1}')
if [ -n "$chatgpt_window" ]; then
    wmctrl -i -r "$chatgpt_window" -e 0,0,0,1536,1587
fi

# Open a new Chrome Tab
google-chrome --new-window &
sleep 2
new_tab_window=$(wmctrl -l | grep -i "New Tab - Google Chrome" | awk '{print $1}')
if [ -n "$new_tab_window" ]; then
    wmctrl -i -r "$new_tab_window" -e 0,1536,0,1536,1726
fi

# Open Toggl Track
/opt/google/chrome/google-chrome --profile-directory=Default --app-id=chpiljhfemlfpnfoohpbokdofonkiifm &
sleep 2
toggl_window=$(wmctrl -l | grep -i "Toggl Track" | awk '{print $1}')
if [ -n "$toggl_window" ]; then
    wmctrl -i -r "$toggl_window" -e 0,768,1588,768,140
fi

# Open Noisli - Favorites
/opt/google/chrome/google-chrome --profile-directory=Default --app-id=gkgbglbaloldkpegmfbancknhcppcfao &
sleep 2
noisli_window=$(wmctrl -l | grep -i "Noisli - Favorites | Noisli" | awk '{print $1}')
if [ -n "$noisli_window" ]; then
    wmctrl -i -r "$noisli_window" -e 0,0,1588,768,140
fi

# Open Visual Studio Code
/usr/share/code/code &
sleep 2
vscode_window=$(wmctrl -l | grep -i "Visual Studio Code" | awk '{print $1}')
if [ -n "$vscode_window" ]; then
    wmctrl -i -r "$vscode_window" -e 0,160,1750,1646,1700
fi

# Open Obsidian
/home/elliot/Applications/Obsidian-1.7.7_436a792a92d0f402e2cec3f90fd22d44.AppImage --no-sandbox %U &
sleep 2
obsidian_window=$(wmctrl -l | grep -i "Obsidian" | awk '{print $1}')
if [ -n "$obsidian_window" ]; then
    wmctrl -i -r "$obsidian_window" -e 0,1810,1728,1108,1726
fi

# Ensure the script exits cleanly
exit 0

