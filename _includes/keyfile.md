## Keyfile

### Create the keys directory
{: .no_toc .mt-4}

```bash
$ mkdir -m 700 /etc/luks-keys
```

### Generate the key
{: .no_toc .mt-6}

{% if page.has_multiple_containers %}
```bash
$ dd bs=512 count=4 if=/dev/random of=/etc/luks-keys/container1 iflag=fullblock
$ dd bs=512 count=4 if=/dev/random of=/etc/luks-keys/container2 iflag=fullblock
```
{% else %}
```bash
$ dd bs=512 count=4 if=/dev/random of=/etc/luks-keys/container iflag=fullblock
```
{% endif %}

### Change the permissions
{: .no_toc .mt-6}

{% if page.has_multiple_containers %}
```bash
$ chmod 600 /etc/luks-keys/container1
$ chmod 600 /etc/luks-keys/container2
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

{% if page.has_multiple_containers %}
```bash
$ cryptsetup luksAddKey /dev/sda2 /etc/luks-keys/container1
$ cryptsetup luksAddKey /dev/sda2 /etc/luks-keys/container2
```
{% elsif page.has_detached_header %}
```bash
$ cryptsetup luksAddKey /dev/sda /etc/luks-keys/container
```
{% else %}
```bash
$ cryptsetup luksAddKey /dev/sda2 /etc/luks-keys/container
```
{% endif %}

---
