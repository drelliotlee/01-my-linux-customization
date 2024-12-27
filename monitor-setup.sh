#!/bin/bash

# Set framebuffer size to fit both monitors
xrandr --fb 3072x3456

# Configure external monitor (DP-2)
xrandr --output DP-2 --mode 3840x2160 --scale 0.8x0.8 --pos 0x0 --rotate normal

# Configure laptop monitor (eDP-1) with calculated horizontal offset
xrandr --output eDP-1 --mode 3456x2160 --scale 0.8x0.8 --pos 154x1728 --rotate normal

