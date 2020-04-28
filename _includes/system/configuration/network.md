## Setup the network

### Set the hostname

A hostname is a unique name created to identify a machine on a network, configured in `/etc/hostname`.

```
# Replace "name" accordingly
$ echo name > /etc/hostname
```

### Set local hostname resolution

##### /etc/hosts
```
127.0.0.1   localhost
::1         localhost
127.0.1.1   myhostname.localdomain	myhostname
```

### Install a manager

#### NETWORKMANAGER

```
$ pacman -S networkmanager
$ systemctl enable NetworkManager
```
