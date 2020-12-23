---
title     : !!str Display server
nav_order : !!int 1
permalink : !!str /graphical-interface/display-server
parent    : !!str Graphical interface
---

## Setup the display server

### Install the Xorg server
```
sudo pacman -S xorg-{server,xinit,xrandr}
```
### References
{: .text-delta .pt-4}

1. [ArchWiki - Xorg](https://wiki.archlinux.org/index.php/Xorg)
{: .fs-3}
