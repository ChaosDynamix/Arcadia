{% assign profile = include.profile %}

## Setup the initial ramdisk images

### Edit the configuration

##### /etc/mkinitcpio.conf
```
{{ profile.mkinitcpio -}}
```

### Generate the images

```
$ mkinitcpio -p linux
```
