# $HOME/.xinitrc
# This file is sourced when running startx and other programs
# which call xinit.

# Configure URxvt daemon:
urxvtd -o -q -f

# Disable blanking screen and Energy Star features.
# Have added this due to problems using Synergy with my
# work laptop when trying to switch back to my desktop
# after the screen has been blanked.
xset s off
xset -dpms

# Swap caps lock and escape keys with each other:
setxkbmap -option caps:swapescape

# Start udiskie to auto-manage mounting of block devices:
udiskie &

# Apply above changes:
xrdb -merge ~/.config/X11/.Xresources

# Launch i3wm (i3 window manager):
# N.B.: The following command must be LAST IN THIS FILE!
exec i3
