## Keyfile

### Create the keys directory
{: .no_toc .mt-4}

```bash
$ mkdir -m 700 /etc/luks-keys
```

### Generate the key
{: .no_toc .mt-6}

{% if page.has_multiple_containers or page.title == "Luks on logical volumes" %}
```bash
$ dd bs=512 count=4 if=/dev/random of=/etc/luks-keys/{% if page.title == "Luks on logical volumes" %}root{% else %}container1{% endif %} iflag=fullblock
$ dd bs=512 count=4 if=/dev/random of=/etc/luks-keys/{% if page.title == "Luks on logical volumes" %}home{% else %}container2{% endif %} iflag=fullblock
```
{% else %}
```bash
$ dd bs=512 count=4 if=/dev/random of=/etc/luks-keys/container iflag=fullblock
```
{% endif %}

### Change the permissions
{: .no_toc .mt-6}

{% if page.has_multiple_containers or page.title == "Luks on logical volumes" %}
```bash
$ chmod 600 /etc/luks-keys/{% if page.title == "Luks on logical volumes" %}root{% else %}container1{% endif %}
$ chmod 600 /etc/luks-keys/{% if page.title == "Luks on logical volumes" %}home{% else %}container2{% endif %}
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
$ cryptsetup luksAddKey /dev/sdb1 /etc/luks-keys/container2
```
{% elsif page.has_detached_header %}
```bash
$ cryptsetup luksAddKey /dev/sda /etc/luks-keys/container
```
{% else %}
```bash
$ cryptsetup luksAddKey {% if page.title == "Luks on logical volumes" %}/dev/grp/cryptroot /etc/luks-keys/root{% else %}/dev/sda2 /etc/luks-keys/container{% endif %}
```
{% endif %}

{% if page.has_multiple_containers %}
### Add entries to the initramfs crypttab
{: .no_toc .mt-6}

/etc/crypttab.initramfs
{: .fs-3 .mb-0}

```bash
container1    /dev/sda2     /etc/luks-keys/container1
container2    /dev/sdb1     /etc/luks-keys/container2
```
{% endif %}

---
