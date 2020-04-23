## Setup the localization

### List the time zones
```
$ ls /usr/share/zoneinfo/
```

### Create a symbolic link for the time zone

##### Example
```
$ ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
```

### Synchronize the hardware clock with the system clock
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

##### /etc/locale.conf
```
LANG=fr_FR.UTF-8
LC_COLLATE=C
```

### Set the console locale

##### Example
```
$ echo KEYMAP=fr-latin9 > /etc/vconsole.conf
```
