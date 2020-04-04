---
layout: default
title: Bspwm
permalink: /graphical-user-interface/window-manager/bspwm/
grand_parent: Graphical user interface
parent: Window manager
nav_order: 1
---

# Window manager / Bspwm
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Install the packages

```bash
$ pacman -S bspwm sxhkd
```

---

## Create the configuration files

### Create configuration directories

```bash
$ mkdir -p ~/.config/bspwm/
$ mkdir ~/.config/sxhkd/
```

### Copy configuration examples in the config directory

```bash
$ cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/bspwmrc
$ cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/sxhkdrc
```

---

## Load the keyboard layout at start

### List the keyboard available configurations

Select the correct model, layout, variants, and option for your keyboard.

```bash
localectl list-x11-keymap-models
localectl list-x11-keymap-layouts
localectl list-x11-keymap-variants [layout]
localectl list-x11-keymap-options
```

### Edit the Bspwm configuration

If you have a non-QWERTY keyboard or a non-standard layout configuration, you should provide a COUNT of 1 to the -m option or -1 to the `sxhkd` command.

~/.config/bspwm/bspwmrc
{: .fs-3}

#### EXAMPLE

```bash
# Load the correct keyboard layout
setxkbmap -model pc104 -layout fr -variant latin9 &

# Execute the Hotkey daemon
sxhkd -m 1 &
```

---

## Edit Xinit configuration

Add the command below at the very end of the file.

~/.xinitrc
{: .fs-3 .mb-0}

```bash
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

```bash
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
```