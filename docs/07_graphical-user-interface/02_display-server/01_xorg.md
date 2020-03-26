---
layout: default
title: Xorg
permalink: /graphical-user-interface/display-server/xorg/
grand_parent: Graphical user interface
parent: Display server
nav_order: 1
---

# Display server / Xorg
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Xorg-server

### Install the package

```bash
$ pacman -S xorg-server
```

### Edit the keyboard configuration for Xorg

Select the correct model, layout, variants, and option for your keyboard and use localectl to set the keyboard layout.

```bash
localectl list-x11-keymap-models
localectl list-x11-keymap-layouts
localectl list-x11-keymap-variants [layout]
localectl list-x11-keymap-options
```

#### EXAMPLE

```bash
localectl --no-convert set-x11-keymap fr pc104 latin9
```

---

## Xorg-xinit

### Installation

```bash
$ pacman -S xorg-xinit
```

### Copy the example file to your home directory

```bash
$ cp /etc/X11/xinit/xinitrc ~/.xinitrc
```

### Edit the configuration file

Delete the lines below.

~/.xinitrc
{: .fs-3 .mb-0}

```bash
twm &
xclock -geometry 50x50-1+1 &
xterm -geometry 80x50+494+51 &
xterm -geometry 80x20+494-0 &
exec xterm -geometry 80x66+0+0 -name login
```

---

## Xorg-randr


---

## References
{: .no_toc}