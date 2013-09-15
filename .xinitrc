# attempt to detect dual monitor setup
xrandr --output LVDS --auto --output DisplayPort-0 --auto --above LVDS
# set the cursor
xsetroot -cursor_name left_ptr
# load the .Xresources file
xrdb -merge ~/.Xresources
# start compositing windows manager in daemon mode
compton -cGb
#start xmonad
exec xmonad
