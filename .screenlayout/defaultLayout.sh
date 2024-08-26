#!/bin/bash
xrandr --output DP-1 --off --output DP-2 --off --output DP-3 --primary --mode 5120x1440 --pos 0x0 --rotate normal --output HDMI-1 --mode 1920x1080 --pos 5120x0 --rotate normal

"$(dirname "$0")"/post-layout-script.sh
