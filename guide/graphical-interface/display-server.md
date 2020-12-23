---
title     : !!str Display server
nav_order : !!int 1
permalink : !!str /graphical-interface/display-server
parent    : !!str Graphical interface
---

# {{ page.title }}
{: .no_toc }

This page describes how to install the Xorg display server and it's related tools.
{: .fs-5 .fw-300}

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

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
