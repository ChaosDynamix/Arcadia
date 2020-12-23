---
title     : !!str Keyboard
nav_order : !!int 1
permalink : !!str /live-environment/keyboard
parent    : !!str Live environment
---

# {{ page.title }}
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Live environment console keymap

There is 3 main types of keyboard layouts :

- **Physical layout**: The actual positioning of the keys on a keyboard
- **Visual layout**: The arrangement of the legends (labels, markings, engravings) that appear on those keys
- **Functional layout**: The arrangement of the key-meaning association or keyboard mapping, determined in software, of all the keys of a keyboard

As you can see, this section refers to the functional layout of the keyboard which is the mapping between **the physical keys**, such as the A key, and **software events**, such as the letter "A" appearing on the screen.

The goal of this section is to search and load the correct console keyboard mapping (keymap) for your keyboard so that pressing a key will produce the expected result, corresponding to the legend of the physical key on your keyboard.

The default Arch Linux console keymap is "US" which is represented by the visual layout in the image below. Users who match this visual layout can skip this section.

![Representation of the default Arch Linux keymap](https://upload.wikimedia.org/wikipedia/commons/5/51/KB_United_States-NoAltGr.svg)

### Search for the correct console keymap

Searching for a keymap can be tedious as you may not know where the keyboard is from and/or how it is designed.

1. Go to the [Wikipedia - Keyboard layout page](https://en.wikipedia.org/wiki/Keyboard_layout).
1. Identify your keyboard layout.

Now that you have a lot more informations about your keyboard, list all the console keymaps available. The result of this command is send to the less program who allow you to scroll through the high number of keymaps available. At the end of your search, simply press "q" to quit the less program.

```
ls /usr/share/kbd/keymaps/**/*.map.gz | less
```

The naming conventions of console keymaps are somewhat arbitrary

- **Language codes**: where the language code is the same as its country code (e.g. de for German, or fr for French).
- **Country codes**: where variations of the same language are used in different countries (e.g.uk for United Kingdom English, or us for United States English); a list of country codes can also be found on [Wikipedia](https://en.wikipedia.org/wiki/ISO_3166-1#Officially_assigned_code_elements).
- **Keyboard layouts**: where the layout is not related to a particular country or language (e.g. dvorak for the Dvorak keyboard layout).

### Load the correct console keymap

Make sure to replace `fr` in the command below if your keymap is different.

```
loadkeys fr
```

### References
{: .text-delta .pt-4}

1. [Wikipedia - Keyboard layout](https://en.wikipedia.org/wiki/Keyboard_layout)
1. [ArchWiki - Keyboard configuration](https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration)
1. [ManPage - Ls](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ls.1.en)
1. [ManPage - Less](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/less/less.1.en)
1. [ManPage - Loadkeys](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/kbd/loadkeys.1.en)
{: .fs-3}
