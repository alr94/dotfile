#!/bin/sh 

modeline=`cvt 1920 1080 | grep Modeline | cut -d' ' -f3-`
modename="laptop-screen"

xrandr --newmode $modename $modeline
xrandr --addmode eDP1 $modename

xrandr --output VIRTUAL1 --off --output DP3 --off --output eDP1 --primary --mode $modename --pos 0x1080 --rotate normal --output DP1 --off --output HDMI3 --off --output HDMI2 --off --output HDMI1 --mode 1920x1080 --rate 144 --pos 0x0 --rotate normal --output DP2 --off
