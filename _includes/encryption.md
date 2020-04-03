## Encryption

GRUB does not support LUKS2 headers to unlock encrypted `/boot` partition so you need to specify `--type luks1` on encrypted device that GRUB need to access.

{% if page.has_detached_header %}
### Create the header
{: .no_toc}

```bash
$ dd if=/dev/zero of=header.img bs=16M count=1
```

### Create the LUKS1 container with detached header
{: .no_toc .mt-6}

```bash
$ cryptsetup --type luks1 luksFormat /dev/sda --offset 32768 --header header.img
```

The `--offset` option allows specifying the start of encrypted data on a device. By reserving a space at the beginning of device you have the option of later reattaching the LUKS header. The value is specified in 512-byte sectors.

### Open the container
{: .no_toc .mt-6}

```bash
$ cryptsetup open --header header.img /dev/sda container
```

### Move the header to the USB flash device
{: .no_toc .mt-6}
{% else %}
### {% if page.has_multiple_containers %}Create the LUKS1 containers{% else %}Create the LUKS1 container{% endif %}
{: .no_toc .mt-6}

{% if page.has_multiple_containers %}
```bash
$ cryptsetup --type luks1 luksFormat /dev/sda2
$ cryptsetup --type luks1 luksFormat /dev/sdb1
```
{% elsif page.has_raid %}
```bash
$ cryptsetup --type luks1 luksFormat /dev/md/array
```
{% else %}
```bash
$ cryptsetup --type luks1 luksFormat /dev/sda2
```
{% endif %}

### {% if page.has_multiple_containers %}Open the containers{% else %}Open the container{% endif %}
{: .no_toc .mt-6}

{% if page.has_multiple_containers %}
```bash
$ cryptsetup open /dev/sda2 container1
$ cryptsetup open /dev/sdb1 container2
```
{% elsif page.has_raid %}
```bash
$ cryptsetup open /dev/md/array container
```
{% else %}
```bash
$ cryptsetup open /dev/sda2 container
```
{% endif %}
{% endif %}




---
