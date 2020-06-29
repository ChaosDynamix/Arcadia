## Setup the localization

### Select your time zone
```
$ ls /usr/share/zoneinfo/
```

### Create a symbolic link for the time zone

This following command create an `/etc/localtime` symlink that points to a zoneinfo file under `/usr/share/zoneinfo/`.

##### Example
```
$ ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
```

### Set hardware clock from system clock

The following sets the hardware clock from the system clock. Additionally it updates `/etc/adjtime` or creates it if not present.

```
$ hwclock --systohc --utc
```

### Select needed locales

##### /etc/locale.gen
```
# Uncomment the needed locales
fr_FR.UTF-8 UTF-8
en_US.UTF-8 UTF-8
```

### Generate locales
```
$ locale-gen
```

### Set the system locale

Setting `LC_COLLATE` variable to `C` make the ls command sort dotfiles first, followed by uppercase and lowercase filenames. To get around potential issues, Arch used to set `LC_COLLATE=C `in `/etc/profile`, but this method is now deprecated.

##### /etc/locale.conf
```
LANG=fr_FR.UTF-8
LC_COLLATE=C
```

### Set the console locale

A persistent keymap can be set in `/etc/vconsole.conf`, which is read by systemd on start-up. The `KEYMAP` variable is used for specifying the keymap. If the variable is empty or not set, the us keymap is used as default value.

##### Example
```
$ echo KEYMAP=fr-latin9 > /etc/vconsole.conf
```
