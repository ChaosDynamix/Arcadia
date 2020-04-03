---
layout: default
title: Keyboard layout
permalink: /live-environment/keyboard-layout/
parent: Live environment
nav_order: 1
---

# Live environment / Keyboard layout
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Select a keymap

Choose one of the two commands

### LIST ALL THE KEYMAPS
{: .no_toc .text-delta}

```bash
$ ls /usr/share/kbd/keymaps/**/*.map.gz | less
```

### SEARCH SPECIFIC KEYMAP
{: .no_toc .text-delta .mt-5}

```bash
$ ls /usr/share/kbd/keymaps/**/*.map.gz | grep -i search_term
```

---

## Load the keymap

Replace fr-latin9 accordingly

```bash
$ loadkeys fr-latin9
```

---

## References
{: .no_toc}

### KEYBOARD
{: .no_toc .text-delta .pt-2}

1. [ArchWiki - Installation guide - Set the keyboard layout](https://wiki.archlinux.org/index.php/Installation_guide#Set_the_keyboard_layout)
1. [ArchWiki - Linux console - Keyboard configuration](https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration)

### MANUALS
{: .no_toc .text-delta .pt-4}

1. [Man page - ls](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ls.1.en)
1. [Man page - less](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/less/less.1.en)
1. [Man page - grep](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/grep/grep.1.en)
1. [Man page - loadkeys](https://jlk.fjfi.cvut.cz/arch/manpages/man/loadkeys.1)
