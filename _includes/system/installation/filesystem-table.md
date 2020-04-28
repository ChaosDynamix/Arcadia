{%- assign swapfile = site.data.system.installation.filesystem-table.swapfile[page.parent_uuid] %}

## Generate the fstab file

genfstab helps fill in an fstab file by autodetecting all the current mounts below a given mountpoint and printing them in fstab-compatible format to standard output.

It can be used to persist a manually mounted filesystem hierarchy and is often used during the initial install and configuration of an OS.

```
$ genfstab -U /mnt >> /mnt/etc/fstab
```

{% if swapfile %}
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
