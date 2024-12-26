#!/bin/bash

# Clear existing XKB options to prevent conflicting mappings
setxkbmap -option

# Remap Caps Lock to Backspace
setxkbmap -option caps:backspace

