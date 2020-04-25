{% assign profile = include.profile %}

## Generate the filesystem table

### Generate fstab
```
$ genfstab -U /mnt >> /mnt/etc/fstab
```

{% if profile.has-swapfile %}
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
