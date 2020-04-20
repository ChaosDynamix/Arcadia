## Network

### Set the hostname

```
$ echo hostname > /etc/hostname
```

### Set the hosts

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

---
