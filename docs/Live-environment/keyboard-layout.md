---
layout: default
title: Keyboard layout
nav_order: 1
has_children: false
parent: Live environment
permalink: /live-environment/keyboard-layout/
has_toc: false
---

# Live environment keyboard layout
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## About

A keyboard layout is any specific mechanical, visual, or functional arrangement of the keys, legends, or key-meaning associations (respectively) of a computer, typewriter, or other typographic keyboard.

| Layout     | Description                                           |
| ---------- | ----------------------------------------------------- |
| Mecanical  | Placements and keys of a keyboard                     |
| Visual     | Symbols printed on the physical keycaps               |
| Functional | Mapping between the physical keys and software events |

### Why this step is important ?
{: .no_toc .pt-3}

The functional layout represented by a **keymap** need to match the visual layout of the keyboard being used, so that pressing a key will produce the expected result, corresponding to the legends on the keyboard.

The Arch Linux default keymap is `US`. Please follow the steps of this page if your visual layout don't match the keymap below.

![US keymap](https://upload.wikimedia.org/wikipedia/commons/5/51/KB_United_States-NoAltGr.svg)

### References
{: .no_toc .text-delta .pt-5}

- [Wikipedia - Keyboard layout](https://en.wikipedia.org/wiki/Keyboard_layout)

---

## List the keymaps

It might be very difficult to type the command needed if your keyboard mapping is wrong. For example, Pressing `A` on a french visual keyboard layout will print `Q` before you correctly set the keymap.

The Arch Linux installation guide recommend the `ls` command but it might be easier for you to use `localectl` instead.

- The first command list all the keymap
- The second command search a specific keymap

### With localectl
{: .no_toc .pt-3}

Not recommended
{: .label .label-yellow .mx-0}

```bash
localectl list-keymaps
localectl list-keymaps | grep -i search_term
```

### With LS
{: .no_toc .pt-3}

Recommended
{: .label .label-green .mx-0}

```bash
ls /usr/share/kbd/keymaps/**/*.map.gz | less
ls /usr/share/kbd/keymaps/**/*.map.gz | grep -i search_term
```

### References
{: .no_toc .text-delta .pt-5}

- [ArchWiki - Installation guide - Set the keyboard layout](https://wiki.archlinux.org/index.php/Installation_guide#Set_the_keyboard_layout)
- [ArchWiki - Linux console - Keyboard configuration](https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration)
- [Manual - localectl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/localectl.1.en)
- [Manual - ls](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ls.1.en)
- [Manual - less](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/less/less.1.en)
- [Manual - grep](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/grep/grep.1.en)

---

## Load the keymap

Loadkeys replace the default keymap (US) with the keymap append to the command

```bash
# Replace fr-latin9 accordingly
$ loadkeys fr-latin9
```

### References
{: .no_toc .text-delta .pt-5}

- [ArchWiki - Installation guide - Set the keyboard layout](https://wiki.archlinux.org/index.php/Installation_guide#Set_the_keyboard_layout)
- [Manual - loadkeys](https://jlk.fjfi.cvut.cz/arch/manpages/man/loadkeys.1)
