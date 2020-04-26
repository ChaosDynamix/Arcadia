{%- assign swapfile = site.data.system.installation.filesystem-table.swapfile[page.parent_uuid] %}

## Generate the filesystem table

### Generate fstab
```
$ genfstab -U /mnt >> /mnt/etc/fstab
```

{% if swapfile%}
### Create the swapfile

TODO

### Add the swapfile in the fstab

##### /etc/fstab
```
/.swap/swapfile       none        swap        defaults        0 0
```
{% endif %}

---

## Enter the system

```
$ arch-chroot /mnt
```
