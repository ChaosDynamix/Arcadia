{% assign template = include.template %}

## Setup the initial ramdisk images

### Set the console locale

#### EXAMPLE
```
$ echo KEYMAP=fr-latin9 > /etc/vconsole.conf
```

### Edit the configuration

##### /etc/mkinitcpio.conf
```
{{ template.configuration.mkinitcpio -}}
```

### Generate the images

```
$ mkinitcpio -p linux
```

---
