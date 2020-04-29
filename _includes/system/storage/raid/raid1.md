### Create the efi raid1 array
{: .d-inline-block .my-3}

UEFI
{: .label .label-blue}

Replace `myhostname` accordingly.

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

Wait until the synchronization is done.
