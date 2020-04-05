{% assign scenario = include.data %}

## {% if scenario.has-multiple-containers %}Setup the Keyfile for the containers{% else %}Setup the Keyfile for the container{% endif %}

### Create the keys directory
{: .no_toc}

```bash
$ mkdir -m 700 /etc/luks-keys
```

### Generate the key
{: .no_toc .mt-6}

{% if scenario.has-multiple-containers or scenario.has-encrypted-volumes %}
```bash
$ dd bs=512 count=4 if=/dev/random of=/etc/luks-keys/{{ scenario.keyfile1 }} iflag=fullblock
$ dd bs=512 count=4 if=/dev/random of=/etc/luks-keys/{{ scenario.keyfile2 }} iflag=fullblock
```
{% else %}
```bash
$ dd bs=512 count=4 if=/dev/random of=/etc/luks-keys/{{ scenario.keyfile1 }} iflag=fullblock
```
{% endif %}

### Change the permissions
{: .no_toc .mt-6}

{% if scenario.has-multiple-containers or scenario.has-encrypted-volumes %}
```bash
$ chmod 600 /etc/luks-keys/{{ scenario.keyfile1 }}
$ chmod 600 /etc/luks-keys/{{ scenario.keyfile2 }}
$ chmod 600 /boot/initramfs-linux*
```
{% else %}
```bash
$ chmod 600 /etc/luks-keys/container
$ chmod 600 /boot/initramfs-linux*
```
{% endif %}

### Add the key in the container
{: .no_toc .mt-6}

{% if scenario.has-multiple-containers %}
```bash
$ cryptsetup luksAddKey /dev/sda2 /etc/luks-keys/{{ scenario.keyfile1 }}
$ cryptsetup luksAddKey /dev/sdb1 /etc/luks-keys/{{ scenario.keyfile2 }}
```

{% else %}
```bash
$ cryptsetup luksAddKey {{ scenario.cryptsetup-device1 }} /etc/luks-keys/{{ scenario.keyfile1 }}
```
{% endif %}

{% if scenario.has-multiple-containers %}
---

## Add entries to the initramfs crypttab
{: .no_toc .mt-6}

/etc/crypttab.initramfs
{: .fs-3 .mb-0}

```bash
container1    /dev/sda2     /etc/luks-keys/container1
container2    /dev/sdb1     /etc/luks-keys/container2
```
{% endif %}

{% if scenario.has-encrypted-volumes %}
---

## Setup the Home volume

```bash
$ cryptsetup --type luks1 luksFormat /dev/grp/crypthome /etc/luks-keys/{{ scenario.keyfile2 }}
$ cryptsetup -d /etc/luks-keys/{{ scenario.keyfile2 }} open /dev/grp/crypthome home
$ mkfs.ext4 -L HOME /dev/mapper/home
$ mount /dev/mapper/home /home
```

---

## Add entries to Fstab and Crypttab

### /etc/fstab
{: .no_toc .fs-3 .mb-0}

```bash
/dev/mapper/swap      none        swap        sw              0 0
/dev/mapper/home      /home       ext4        defaults        0 2
```

### /etc/crypttab
{: .no_toc .fs-3 .mb-0}

```bash
swap    /dev/grp/cryptswap    /dev/urandom	         swap,cipher=aes-xts-plain64,size=256
home    /dev/grp/crypthome    /etc/luks-keys/{{ scenario.keyfile2 }}
```
{% endif %}

---
