## Install the packages

```
$ pacman -S xfce4 network-manager-applet numlockx
```

**Note**: Only install `numlockx` if you have a num lock key on your keyboard.
{: .fs-3}

---

## List the keyboard available configurations

Select the correct model, layout, variants, and option for your keyboard.

```
$ localectl list-x11-keymap-models
$ localectl list-x11-keymap-layouts
$ localectl list-x11-keymap-variants [layout]
$ localectl list-x11-keymap-options
```

---

## Edit Xinit configuration

Add the commands below at the very end of the file. Only add `numlockx` if you have a num lock key on your keyboard.

##### ~/.xinitrc
```
numlockx &
setxkbmap -model pc104 -layout fr -variant latin9 &

exec startxfce4
```

---

{% include desktop/desktop_autostart.md %}
