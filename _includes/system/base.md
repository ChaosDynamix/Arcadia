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

---

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

### Activate NetworkManager
```
$ systemctl enable NetworkManager
```

---

## Setup the Wifi
{: .d-inline-block}

WIFI
{: .label .label-blue}

### List nearby wifi networks
```
$ nmcli device wifi list
```

### Connect to a wifi network
```
$ nmcli device wifi connect SSID password password
```

### Install and setup the Gnome keyring for the wifi passwords

```
$ pacman -S gnome-keyring libsecret
```

##### /etc/pam.d/login
```
#%PAM-1.0

auth       required     pam_securetty.so
auth       requisite    pam_nologin.so
auth       include      system-local-login
auth       optional     pam_gnome_keyring.so
account    include      system-local-login
session    include      system-local-login
session    optional     pam_gnome_keyring.so auto_start
```

---

## Setup the account

### Change the root password

Passwords must be complex enough to not be easily guessed from e.g. personal information, or cracked using methods like social engineering or brute-force attacks. The tenets of strong passwords are based on length and randomness.

```
$ passwd
```

### Create the user and his password

| Argument       | Description                                                       |
| :------------- | :---------------------------------------------------------------- |
| -m             | Create the user's home directory if it does not exist             |
| -G             | A list of supplementary groups which the user is also a member of |
| -s             | The name of the user's login shell                                |

##### Account
```
$ useradd -m -G wheel -s /bin/bash username
```

##### Password
```
$ passwd username
```

### Allow the wheel group to use sudo

##### EDITOR=vim visudo
```
# Uncomment the line below
%wheel ALL=(ALL) ALL
```

### Enforcing strong passwords using pam_cracklib

##### /etc/pam.d/passwd
```
password required pam_cracklib.so retry=2 minlen=10 difok=6 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1
```

---

## Enable periodic TRIM
{: .d-inline-block}

SOLID STATE DRIVE
{: .label .label-blue}

### Check if your SSD has TRIM support
```
$ lsblk --discard
```

DISC-GRAN (discard granularity) and DISC-MAX (discard max bytes) columns must show non-zero values.

### Install the package
```
$ pacman -S util-linux
```

### Activate util-linux
```
$ systelctl enable fstrim.timer
```

### Edit the LVM configuration

##### /etc/lvm/lvm.conf
```
issue_discards = 1
```
