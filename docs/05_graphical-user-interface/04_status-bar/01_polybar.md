---
layout: default
title: Polybar
permalink: /graphical-user-interface/status-bar/polybar/
grand_parent: Graphical user interface
parent: Status bar
nav_order: 1
---

# Status bar / Polybar
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---


## Install the Arch User Repository needed packages

```bash
$ pacman -S base-devel git
```

---

## Clone the Polybar repository with git

```bash
$ git clone https://aur.archlinux.org/polybar.git
```

---

## Install Polybar

```bash
$ cd polybar
$ makepkg -si
```