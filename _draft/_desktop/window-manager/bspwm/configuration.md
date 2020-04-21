---
title: Configuration
nav_order: 3
parent: Bspwm
---

# {{ page.title }}
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---


## Polybar

### Install the Arch User Repository needed packages

```
$ pacman -S base-devel git
```

### Clone the Polybar repository with git

```
$ git clone https://aur.archlinux.org/polybar.git
```

### Install Polybar

```
$ cd polybar
$ makepkg -si
```
