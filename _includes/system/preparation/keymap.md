## Load the correct Keymap

The default console keymap is US.

![Representation of the US default keyboard layout for Arch Linux](https://upload.wikimedia.org/wikipedia/commons/5/51/KB_United_States-NoAltGr.svg)

### List the keymaps

#### LIST ALL THE KEYMAPS
```
$ ls /usr/share/kbd/keymaps/**/*.map.gz | less
```

#### SEARCH SPECIFIC KEYMAP
```
$ ls /usr/share/kbd/keymaps/**/*.map.gz | grep -i search_term
```

### Load the keymap

Replace fr-latin9 accordingly

```
$ loadkeys fr-latin9
```
