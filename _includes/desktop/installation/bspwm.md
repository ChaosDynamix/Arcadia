## Install the packages

```
$ pacman -S bspwm sxhkd rxvt-unicode
```

| Package      | Description       |
| :----------- | :---------------- |
| bspwm        | Window manager    |
| sxhkd        | Hotkey daemon     |
| rxvt-unicode | Terminal emulator |

---

## Create the configuration files

### Create configuration directories
```
$ mkdir -p ~/.config/bspwm/
$ mkdir ~/.config/sxhkd/
```

### Copy configuration examples in the config directory
```
$ cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc
$ cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc
```

---

## Load the keyboard layout at start

### List the keyboard available configurations

Select the correct model, layout, variants, and option for your keyboard.

```
$ localectl list-x11-keymap-models
$ localectl list-x11-keymap-layouts
$ localectl list-x11-keymap-variants [layout]
$ localectl list-x11-keymap-options
```

### Edit the Bspwm configuration

If you have a non-qwerty keyboard or a non-standard layout configuration, you should provide a count of 1 to the -m option or -1 to the `sxhkd` command.

##### ~/.config/bspwm/bspwmrc
```
# Load the correct keyboard layout
setxkbmap -model pc104 -layout fr -variant latin9 &

# Execute the Hotkey daemon
sxhkd -m 1 &
```

---

## Edit Xinit configuration

Add the command below at the very end of the file.

##### ~/.xinitrc
```
exec bspwm
```

---

## Autostart Bspwm (Xorg) at login

### Edit the configuration of your shell

If the Bash profile does not exist, copy a skeleton version from `/etc/skel/.bash_profile`.

| Shell    | Profile         |
| :------- | :-------------- |
| Bash     | ~/.bash_profile |
| Zsh      | ~/.zprofile     |

```
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
```
