{%- assign scenario = site.data.system.installation.filesystem-table.scenario[page.parent_uuid] %}

## Generate the fstab file

genfstab helps fill in an fstab file by autodetecting all the current mounts below a given mountpoint and printing them in fstab-compatible format to standard output.

It can be used to persist a manually mounted filesystem hierarchy and is often used during the initial install and configuration of an OS.

```
$ genfstab -U /mnt >> /mnt/etc/fstab
```

{% unless scenario.luks_partition %}
### Add the swap volume in the crypttab
```
swap    /dev/grp/cryptswap    /dev/urandom    swap,cipher=aes-xts-plain64,size=256
```

### Add the swap volume in the fstab
```
/dev/mapper/swap    none    swap    sw    0 0
```
{% endunless %}

{% if scenario.has_swapfile %}
### Create the swapfile

```
$ truncate -s 0 /swapfile
$ chattr +C /swapfile
$ btrfs property set /swapfile compression none
$ dd if=/dev/zero of=/swapfile bs=1M count=512 status=progress
$ chmod 600 /swapfile
$ mkswap /swapfile
$ swapon /swapfile
```

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
