---
layout: default
title: Xorg
permalink: /graphical-user-interface/display-server/xorg/
grand_parent: Graphical user interface
parent: Display server
nav_order: 1
---

# Display server / Xorg

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Install the packages

```
$ pacman -S xorg-{server,xinit,xrandr}
```

---

## Prepare the Xinit configuration file

The xinit program allows a user to manually start an Xorg display server. The `startx` script is a front-end for `xinit`. It is typically used to start window managers or desktop environments.

### Copy the example file to your home directory

```
$ cp /etc/X11/xinit/xinitrc ~/.xinitrc
```

### Edit the configuration file

At the end of the file, delete the lines below.

##### ~/.xinitrc
```
twm &
xclock -geometry 50x50-1+1 &
xterm -geometry 80x50+494+51 &
xterm -geometry 80x20+494-0 &
exec xterm -geometry 80x66+0+0 -name login
```

---

## Prepare the Xresources file

Xresources is a user-level configuration dotfile, typically located at `~/.Xresources`. It can be used to set X resources, which are configuration parameters for X client applications.

```
$ touch ~/.Xresources
```

---

## References
{: .no_toc}
