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

## Installation

```bash
$ pacman -S bspwm sxhkd
```

---

## Configuration

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

## Edit Xinit configuration

Add the command below at the very end of the file.

~/.xinitrc
{: .fs-3 .mb-0}

```bash
exec bspwm
```

---

## Autostart Xorg at login

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
