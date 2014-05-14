# attempt to detect dual monitor setup
xrandr --output LVDS --auto --output DisplayPort-0 --auto --right-of LVDS
#xrandr --output LVDS --mode 1680x1050 --output DisplayPort-0 --mode 1920x1200 --right-of LVDS --output VGA-0 --mode 1920x1200 --left-of LVDS
# set the cursor
xsetroot -cursor_name left_ptr
# load the .Xresources file
xrdb -merge ~/.Xresources
# start compositing windows manager in daemon mode
compton -cGb
# set backround images 
nitrogen --restore 
# make sure screensaver is running so we can lock screen
xscreensaver -nosplash &
#start xmonad
exec xmonad
