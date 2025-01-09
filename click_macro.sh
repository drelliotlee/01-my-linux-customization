#!/bin/bash
# Focus the target window
xdotool windowactivate 46137348

# Move to the specified location and click
xdotool mousemove 2324 3491 click 1

# Send Ctrl+E after clicking
xdotool keydown ctrl key e keyup ctrl

