tiling-dev-box
============

A collection of notes and config files for debian testing (jessie) amd64
to try out and track my latest experimental devlelopment environment setup!

My goal is to have a nifty environment for browsing, editing code, and general
hacking around in Linux.  The design goals include:
1. Minimal simple yet elegant graphical layout
1. Keyboard bindings/shortcuts compatible across favorite apps.
1. Avoid using mouse when possible.
1. Git managed configuration files
1. Quickly (re)deployable to different computing/virtual targets.
1. Fun!
1. Profit! ??? err...

Try it out!
-----------

*Quick Start*

    $ VirtualBox &
    $ #Startup and Login
    $ startx
    $ <alt-shift-enter> # To open a terminal
    $ vim
    $ <alt-shift-enter>
    $ vimperator-iceweasel
    $ ,s xmonad
       
#### TODO:

1. Setup xmonad files
1. setup vimperator-iceweasel files
1. setup .x files for good fonts
1. setup uxvrt
1. Curate .vimrc files
1. Control everything with git
1. Automate deployment with scripts/ansible.
1. Get this working with LXC

#### Virtual Box Setup:

1. Download desired debian netinst
    * `$ wget http://cdimage.debian.org/cdimage/daily-builds/daily/arch-latest/amd64/iso-cd/debian-testing-amd64-netinst.iso`
1. Fire up Virtual Box 
    * click "New"
    * Name: "debian-dev-box"
    * Type: "Linux"
    * Version: "Debian (64 bit)"
    * Memory Size: "1024MB"
    * Create a virtual hard drive now
    * VDI (VirtualBox Disk Image)
    * Dynamically allocated
    * virtual drive file name: debian-dev-box
    * 16.00 GB
1. Install with the debian .iso
    * l/p: person/whatever
1. Setup manually repo to point to http://http.debian.net/debian
    * This will automatically choose the best mirror for your location.
1. tasksel "Choose software to install: only select Standard and SSH"
1. Setup grub in MBR
1. Reboot, login, change config files.
    * `$ su`
    * `$ apt-get install sudo`
    * `$ vi /etc/sudoers` person ALL=(ALL:ALL) ALL
    * `$ exit`
    * `$ sudo -i`
    * `$ vi /etc/ssh/sshd_config` PermitRootLogin no
1. Setup VirtualBox Guest Additions
    * `$ apt-get install dkms`
    * `$ # install vbox guest additions cd`
    * `$ mount /media/cdrom`
    * `$ cd /media/cdrom`
    * `$ sudo sh ./VBoxLinuxAdditions.run`
1. Install Extra Packages:
    * `$ apt-get install xorg`   # basic desktop environment files
    * `$ apt-get install xserver-xorg-video-ati`
    * `$ apt-get install firmware-linux-nonfree` # only if you *must* :(
    * `$ sudo Xorg -config`      # your milage may vary
    * `$ xrandr`                 # setup a script for your monitor config
    * `$ apt-get install git`    # DVCS track config files and do work

#### Configure System:

* *.bashrc*
    1. user
    1. root
* *source code pro* a nice monotype font for programming
    1. [source code pro](https://github.com/adobe/source-code-pro)
    1. download and uncompress into /usr/share/fonts/truetype
* *vim* -- editor of choice
    1. `$ apt-get install vim-nox` -- compiled with +python
    1. Setup .vim/
    1. setup .vimrc
* *xmonad* -- slick tiling desktop environment
    1. `$ apt-get install xmonad`
* *xmombar* -- lightweight, text-based status bar
    1. `$ apt-get install xmobar`
    1. [xmobar tips](http://www.haskell.org/haskellwiki/Xmonad/Config_archive/John_Goerzen%27s_Configuration#Installing_xmobar)
    1. [xmobmar plugins](http://projects.haskell.org/xmobar/#system-monitor-plugins)
* *urxvt* -- terminal with good unicode support
    1. `$ apt-get install rxvt-unicode-256color`
    1. [rxvt-unicode](https://wiki.archlinux.org/index.php/Rxvt-unicode)
    1. $ vi ~/.Xresources
    1. $ xrdb -merge ~/.Xresources
* *iceweasel-vimperator* -- like firefox browser + vim bindings
    1. `$ apt-get install iceweasel-vimperator`
    1. Setup security to not save passwords etc.
    1. Set main page to https://duckduckgo.com
    1. Install Adblock Plus
        * Remove Social Media Buttons
        * Disable Tracking            
    1. Install Flashblock
    1. Generate a base config file
        * :mkvimperatorrc
        * edit to liking
        * `$ vim ~/.vimperatorrc`
* *compton* -- standalone compositing window manager
    1. `$ apt-get install compton`
    1. mkdir ~/.config
    1. cp /usr/share/doc/compton/examples/comtpon/sample.conf ~/.config/compton.conf
    1. [compton tips](http://duncanlock.net/blog/2013/06/07/how-to-switch-to-compton-for-beautiful-tear-free-compositing-in-xfce/)
    1. `$ compton &`
    1. ~/.xprofile -- compton -cGb
* *xorg* -- this old girl needs some love to look good...
    1. `xrandr --output DisplayPort-0 --mode 1920x1080` -- turn on external displayport
    1. `xrandr --output LVDS --auto --output DisplayPort-0 --auto --same-as LVDS` -- clone screens
    1. `xrandr --output LVDS --auto --output DisplayPort-0 --auto --above LVDS` -- stack screens

### Issues:

#### Notes:

#### Requires:
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads/) -- `sudo apt-get install virtualbox-4.2`

#### Special Thanks:
* [l3net](http://l3net.wordpress.com/2013/04/30/lightweight-debian-lxde-desktop-from-scratch/) -- Great review of desktops and ram usage on various linux flavors!
* [cool bash prompts](http://makandracards.com/makandra/1090-customize-your-bash-prompt)
* [pretty xterm stuff](http://unix4lyfe.org/xterm/)
* [better font help](http://community.linuxmint.com/tutorial/view/1021)
