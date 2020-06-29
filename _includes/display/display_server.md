## Install a display server

#### XORG

### Install the packages
```
$ pacman -S xorg-{server,xinit,xrandr}
```

### Copy the Xinit configuration example file

The xinit program allows a user to manually start an Xorg display server. The `startx` script is a front-end for `xinit`. It is typically used to start window managers or desktop environments.

```
$ cp /etc/X11/xinit/xinitrc ~/.xinitrc
```

### Edit the Xinit configuration file

At the end of the file, delete the lines below.

##### ~/.xinitrc
```
twm &
xclock -geometry 50x50-1+1 &
xterm -geometry 80x50+494+51 &
xterm -geometry 80x20+494-0 &
exec xterm -geometry 80x66+0+0 -name login
```

### Prepare the Xresources file

Xresources is a user-level configuration dotfile, typically located at `~/.Xresources`. It can be used to set X resources, which are configuration parameters for X client applications.

```
$ touch ~/.Xresources
```
