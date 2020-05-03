## Setup the partitions

### Format the partitions

#### ext4
```
$ mkfs.ext4 -L ROOT /dev/sda2
$ mkfs.ext4 -L HOME /dev/sda4
```

#### swap
```
$ mkswap -L SWAP /dev/sda3
```

### Mount the partitions

```
$ mount /dev/sda2 /mnt
$ mkdir /mnt/home
$ mount /dev/sda4 /mnt/home
```

### Activate the Swap

```
$ swapon /dev/sda3
```
