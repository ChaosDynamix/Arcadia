{% assign template = include.template %}
{% assign containers = template.containers %}
{% assign container_number = template.containers | size %}
{% assign headerless_containers = template.containers | where: "headerless", true %}
{% assign headerless_container_number = headerless_containers | size %}

## Encrypt the {% if container_number > 1 %}partitions{% elsif template.has-raid %}Raid array{% else %}partition{% endif %}

GRUB does not support LUKS2 headers to unlock encrypted `/boot` partition so you need to specify `--type luks1` on encrypted device that GRUB need to access.

{% if headerless_container_number >= 1  %}
### Create the header

```
{%- for container in headerless_containers %}
  {%- if headerless_container_number > 1 %}
$ dd if=/dev/zero of=header{{ container.id }}.img bs=16M count=1
  {%- else %}
$ dd if=/dev/zero of=header.img bs=16M count=1  
  {%- endif %}
{%- endfor %}
```
{% endif %}

### Create the LUKS1 container{% if container_number > 1 %}s{% endif %}

```
{%- for container in containers %}
$ cryptsetup --type luks1 luksFormat {{ container.node }} {% if container.headerless %}--offset 32768 --header header{% if headerless_container_number > 1 %}{{ container.id }}{% endif %}.img{% endif %}
{%- endfor %}
```

{% if header_container_number >= 1  %}
The `--offset` option allows specifying the start of encrypted data on a device. By reserving a space at the beginning of device you have the option of later reattaching the LUKS header. The value is specified in 512-byte sectors.
{% endif %}

### Open the container{% if container_number > 1 %}s{% endif %}

```
{%- for container in containers %}
$ cryptsetup open {% if container.headerless %}--header header{% if headerless_container_number > 1 %}{{ container.id }}{% endif %}.img {% endif -%} {{ container.node }} {{ container.name }}
{%- endfor %}
```
