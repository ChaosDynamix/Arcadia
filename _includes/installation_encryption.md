{% assign scenario = include.data %}

## {% if scenario.has-multiple-containers %}Encrypt the partitions{% elsif scenario.has-raid1 %}Encrypt the Raid array{% else %}Encrypt the partition{% endif %}

GRUB does not support LUKS2 headers to unlock encrypted `/boot` partition so you need to specify `--type luks1` on encrypted device that GRUB need to access.

{% if page.has-detached-header %}
### Create the header
{: .no_toc}

```bash
$ dd if=/dev/zero of=header.img bs=16M count=1
```
{% endif %}

### {% if page.has-multiple-containers %}Create the LUKS1 containers{% else %}Create the LUKS1 container{% endif %}
{: .no_toc .mt-6}

{% if page.has-multiple-containers and page.has-detached-header %}
```bash
$ cryptsetup --type luks1 luksFormat {{ scenario.cryptsetup-device1 }}
$ cryptsetup --type luks1 luksFormat {{ scenario.cryptsetup-device2 }}
```
{% else %}
```bash
$ cryptsetup --type luks1 luksFormat {{ scenario.cryptsetup-device1 }} {% if scenario.has-detached-header %}--offset 32768 --header header.img{% endif %}
```
{% if scenario.has-detached-header %}
The `--offset` option allows specifying the start of encrypted data on a device. By reserving a space at the beginning of device you have the option of later reattaching the LUKS header. The value is specified in 512-byte sectors.
{% endif %}

{% endif %}

### {% if page.has_multiple_containers %}Open the containers{% else %}Open the container{% endif %}
{: .no_toc .mt-6}

{% if page.has-multiple-containers %}
```bash
$ cryptsetup open /dev/sda2 container1
$ cryptsetup open /dev/sdb1 container2
```
{% else %}
```bash
$ cryptsetup open {% if scenario.has-detached-header %}--header header.img{% endif %} {{ scenario.cryptsetup-device1 }} {{ scenario.container-name }}
```
{% endif %}

---
