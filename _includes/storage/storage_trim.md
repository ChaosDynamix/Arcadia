## Enable periodic TRIM
{: .d-inline-block}

SOLID STATE DRIVE
{: .label .label-blue}

### Check if your SSD has TRIM support
```
$ lsblk --discard
```

DISC-GRAN (discard granularity) and DISC-MAX (discard max bytes) columns must show non-zero values.

### Activate weekly fstrim service
```
$ systemctl enable fstrim.timer
```

### Edit the LVM configuration

##### /etc/lvm/lvm.conf
```
issue_discards = 1
```
