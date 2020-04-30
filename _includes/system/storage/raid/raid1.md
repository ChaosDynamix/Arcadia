When creating an array from Arch Linux ISO image, use the option `--homehost=myhostname` (or `--homehost=any` to always have the same name regardless of the host) to set the hostname, otherwise the hostname archiso will be written in the array metadata.

### Create the EFI raid1 array
{: .d-inline-block .my-3}

UEFI
{: .label .label-blue}

```
$ mdadm --create --level=1 --metadata=1.0 --raid-devices=2 --homehost=myhostname /dev/md/efi /dev/sda1 /dev/sdb1
```

### Create the system raid1 array
```
$ mdadm --create --level=1 --metadata=1.2 --raid-devices=2 --homehost=myhostname /dev/md/system /dev/sda2 /dev/sdb2
```

### Check the synchronization of the array
```
$ watch cat /proc/mdstat
```
