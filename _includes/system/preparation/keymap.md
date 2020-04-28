## Load the correct Keymap

The default console keymap is US.

![Representation of the US default keyboard layout for Arch Linux](https://upload.wikimedia.org/wikipedia/commons/5/51/KB_United_States-NoAltGr.svg)

### List the keymaps

#### ALL THE KEYMAPS
```
$ ls /usr/share/kbd/keymaps/**/*.map.gz | less
```

#### SPECIFIC KEYMAP
```
$ ls /usr/share/kbd/keymaps/**/*.map.gz | grep -i search_term
```

### Load the correct keymap

##### Example
```
$ loadkeys fr-latin9
```
