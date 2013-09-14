# set the cursor
xsetroot -cursor_name left_ptr
# start compositing windows manager in daemon mode
compton -cGb
#start xmonad
exec xmonad
