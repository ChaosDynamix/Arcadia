{% assign template = include.template %}

## Setup the initial ramdisk images

### Edit the configuration

##### /etc/mkinitcpio.conf
```
{{ template.configuration.mkinitcpio -}}
```

### Generate the images

```
$ mkinitcpio -p linux
```
