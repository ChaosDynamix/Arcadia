{% assign scenario = include.data %}

## Setup the initial ramdisk images

### Set the console locale

#### EXAMPLE
```
$ echo KEYMAP=fr-latin9 > /etc/vconsole.conf
```

### Edit the configuration

##### /etc/mkinitcpio.conf
```
{{ scenario.configuration.mkinitcpio -}}
```

### Generate the images

```
$ mkinitcpio -p linux
```

---
