#!/bin/sh

modeline=`cvt 1920 1080 | grep Modeline | cut -d' ' -f3-`
modename="laptop-screen"

xrandr --newmode $modename $modeline
xrandr --addmode eDP1 $modename

xrandr --output VIRTUAL1 --off --output DP3 --off --output eDP1 --primary --mode $modename --pos 0x0 --rotate normal --output DP1 --off --output HDMI3 --off --output HDMI2 --off --output HDMI1 --off --output DP2 --off --output DP3-2 --off
