#!/bin/bash


chatgpt_window=$(wmctrl -l | grep -i "ChatGPT" | awk '{print $1}')
if [ -n "$chatgpt_window" ]; then
    wmctrl -i -r "$chatgpt_window" -e 0,0,0,1536,1587
fi

new_tab_window=$(wmctrl -l | grep -i "New Tab - Google Chrome" | awk '{print $1}')
if [ -n "$new_tab_window" ]; then
    wmctrl -i -r "$new_tab_window" -e 0,1536,0,1536,1726
fi

toggl_window=$(wmctrl -l | grep -i "Stopwatch" | awk '{print $1}')
if [ -n "$toggl_window" ]; then
    wmctrl -i -r "$toggl_window" -e 0,768,1588,768,140
fi

noisli_window=$(wmctrl -l | grep -i "Noisli - Favorites | Noisli" | awk '{print $1}')
if [ -n "$noisli_window" ]; then
    wmctrl -i -r "$noisli_window" -e 0,0,1588,768,140
fi

vscode_window=$(wmctrl -l | grep -i "Visual Studio Code" | awk '{print $1}')
if [ -n "$vscode_window" ]; then
    wmctrl -i -r "$vscode_window" -e 0,160,1750,1646,1700
fi

obsidian_window=$(wmctrl -l | grep -i "Obsidian" | awk '{print $1}')
if [ -n "$obsidian_window" ]; then
    wmctrl -i -r "$obsidian_window" -e 0,1810,1728,1108,1726
fi

# Ensure the script exits cleanly
exit 0
