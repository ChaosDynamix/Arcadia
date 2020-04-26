{%- assign configuration = site.data.system.configuration.initial-ramdisk[page.parent_uuid] %}

## Setup the initial ramdisk images

### Edit the configuration

##### /etc/mkinitcpio.conf
```
{{ configuration -}}
```

### Generate the images
```
$ mkinitcpio -p linux
```
