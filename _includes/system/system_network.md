## Setup the network

### Setup the hostname

/etc/hostname
{: .fs-3 .mt-2 .mb-0}

```bash
myhostname
```

### Setup the hosts

/etc/hosts
{: .fs-3 .mt-2 .mb-0}

```bash
127.0.0.1    localhost
::1          localhost
127.0.1.1    myhostname.localdomain    myhostname
```

### Install the package

#### NETWORKMANAGER

```bash
$ pacman -S networkmanager
```

### Activate the service

#### NETWORKMANAGER

```bash
$ systemctl enable NetworkManager 
```
