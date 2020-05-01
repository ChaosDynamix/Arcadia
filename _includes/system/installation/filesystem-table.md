## Generate the fstab file

genfstab helps fill in an fstab file by autodetecting all the current mounts below a given mountpoint and printing them in fstab-compatible format to standard output.

It can be used to persist a manually mounted filesystem hierarchy and is often used during the initial install and configuration of an OS.

```
$ genfstab -U /mnt >> /mnt/etc/fstab
```

### Enter the system

```
$ arch-chroot /mnt
```

{% if scenario.template == "luks_logical_volumes" %}
### Add the Swap volume

##### /etc/crypttab
```
swap    /dev/grp/cryptswap    /dev/urandom    swap,cipher=aes-xts-plain64,size=256
```

##### /etc/fstab
```
/dev/mapper/swap    none    swap    sw    0 0
```
{% endif %}
