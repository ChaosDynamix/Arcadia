{% assign scenario = include.data %}
{% assign devicenumber = scenario.storage.devices | size %}

## Encrypt the {% if devicenumber > 1 %}partitions{% elsif scenario.storage.has-raid1 %}Raid array{% else %}partition{% endif %}

GRUB does not support LUKS2 headers to unlock encrypted `/boot` partition so you need to specify `--type luks1` on encrypted device that GRUB need to access.

{% if scenario.storage.has-detached-header %}
### Create the header

```
$ dd if=/dev/zero of=header.img bs=16M count=1
```
{% endif %}

### Create the LUKS1 container{% if devicenumber > 1 %}s{% endif %}

```
{%- for container in scenario.storage.containers %}
$ cryptsetup --type luks1 luksFormat {{ container.node }} {% if scenario.storage.has-detached-header %}--offset 32768 --header header.img{% endif %}
{%- endfor %}
```

{% if scenario.storage.has-detached-header %}
The `--offset` option allows specifying the start of encrypted data on a device. By reserving a space at the beginning of device you have the option of later reattaching the LUKS header. The value is specified in 512-byte sectors.
{% endif %}

### Open the container{% if devicenumber > 1 %}s{% endif %}

```
{%- for container in scenario.storage.containers %}
$ cryptsetup open {% if scenario.storage.has-detached-header %}--header header.img {% endif %}{{ container.node }} {{ container.name }}
{%- endfor %}
```

---
