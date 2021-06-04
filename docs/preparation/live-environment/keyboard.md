---
title: Keyboard
---

# Keyboard
This page describes how to search and load the correct console keyboard mapping (keymap) for your keyboard so that pressing a key will produce the expected result, corresponding to the legend of the physical key on your keyboard.

## About keyboard layouts
There is 3 main types of keyboard layouts :

| Layout | Description |
| :----- | :---------- |
| Physical   | The actual positioning of the keys on a keyboard|
| Visual     | The arrangement of the legends (labels, markings, engravings) that appear on those keys|
| Functional | The arrangement of the key-meaning association or keyboard mapping, determined in software, of all the keys of a keyboard|

As you can see, this section refers to the functional layout of the keyboard which is the mapping between **the physical keys**, such as the A key, and **software events**, such as the letter "A" appearing on the screen.

The default Arch Linux console keymap is "US" which is represented by the visual layout in the image below. Users who match this visual layout can skip this section.

![Representation of the default Arch Linux keymap](https://upload.wikimedia.org/wikipedia/commons/5/51/KB_United_States-NoAltGr.svg)

---

## Search for the correct console keymap
Searching for a keymap can be tedious as you may not know where the keyboard is from and/or how it is designed.

1. Go to the [Wikipedia - Keyboard layout page](https://en.wikipedia.org/wiki/Keyboard_layout).
1. Identify your keyboard layout.

Now that you have a lot more informations about your keyboard, list all the console keymaps available. The result of this command is send to the less program who allow you to scroll through the high number of keymaps available. At the end of your search, simply press "q" to quit the less program.

``` bash
ls /usr/share/kbd/keymaps/**/*.map.gz | less
```

The naming conventions of console keymaps are somewhat arbitrary

- **Language codes**: where the language code is the same as its country code (e.g. de for German, or fr for French).
- **Country codes**: where variations of the same language are used in different countries (e.g.uk for United Kingdom English, or us for United States English); a list of country codes can also be found on [Wikipedia](https://en.wikipedia.org/wiki/ISO_3166-1#Officially_assigned_code_elements).
- **Keyboard layouts**: where the layout is not related to a particular country or language (e.g. dvorak for the Dvorak keyboard layout).

---

## Load the correct console keymap

``` bash
loadkeys <KEYMAP>
```

!!! warning
    Make sure to replace `<KEYMAP>` with the correct keymap name for your keyboard.

---

??? info "References"
    - [Wikipedia - Keyboard layout](https://en.wikipedia.org/wiki/Keyboard_layout)
    - [ArchWiki - Keyboard configuration](https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration)
    - [ManPage - Ls](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ls.1.en)
    - [ManPage - Less](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/less/less.1.en)
    - [ManPage - Loadkeys](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/kbd/loadkeys.1.en)
