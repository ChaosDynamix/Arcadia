{% case include.step %}
  {% when 1 %}
## Generate the fstab file

genfstab helps fill in an fstab file by autodetecting all the current mounts below a given mountpoint and printing them in fstab-compatible format to standard output.

It can be used to persist a manually mounted filesystem hierarchy and is often used during the initial install and configuration of an OS.

```
$ genfstab -U /mnt >> /mnt/etc/fstab
```

---

## Enter the system

```
$ arch-chroot /mnt
```
  {% when 2 %}
    {% case scenario.profile.devices_table %}
      {% when "luks_multiple_partitions" %}
## Edit the initramfs crypttab

##### /etc/crypttab.initramfs
```
cryptlvmUUID     UUID=device_UUID   /etc/luks-keys/cryptlvmUUID.keyfile
cryptlvmUUID     UUID=device_UUID   /etc/luks-keys/cryptlvmUUID.keyfile
```

**Note**: Replace `device_UUID` with the UUID of `/dev/sda2` and `/dev/sdb1`.
{: .fs-3 }
  {% when "luks_logical_volumes" %}
## Edit the fstab

##### /etc/fstab
```
/dev/mapper/swap    none    swap    sw          0 0
/dev/mapper/home    /home   ext4    defaults    0 2
```

---

## Edit the crypttab

##### /etc/crypttab
```
swap    /dev/grp/cryptswap     /dev/urandom          swap,cipher=aes-xts-plain64,size=256
home    /dev/grp/crypthome     /etc/luks-keys/crypthome.keyfile
```
    {% endcase %}
{% endcase %}
