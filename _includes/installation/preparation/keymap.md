## Load the correct Keymap

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
