#!/bin/bash

# Set up the primary laptop display (eDP-1)
xrandr --output eDP-1 --primary --mode 2765x1728 --pos 0x1727 --rotate normal

# Set up the external monitor (DP-3)
xrandr --output DP-3 --mode 3072x1728 --pos 0x0 --rotate normal

