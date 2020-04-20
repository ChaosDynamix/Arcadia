## Create the RAID array

Redundant Array of Independent Disks (RAID) is a storage technology that combines multiple disk drive components (typically disk drives or partitions thereof) into a logical unit. Depending on the RAID implementation, this logical unit can be a file system or an additional transparent layer that can hold several partitions.

### Create a RAID1 array with the devices
```
$ mdadm --create --level=1 --metadata=1.2 --raid-devices=2 /dev/md/array /dev/sda2 /dev/sdb2
```

### Check the synchronization of the array
```
$ watch /proc/mdstat
```

---
