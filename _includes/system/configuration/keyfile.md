{% assign bootable_containers = template.encryption.containers | where: "is_bootable", true %}

## Create the Keyfile{% if template.encryption.containers.size > 1 %}s{% endif %}

{% if bootable_containers.size > 1 %}
Replace `UUID` with the first 4 alphanumeric characters of the devices UUID so you can identify them properly. Example: `cryptsystem7b38.keyfile`.
{% endif %}

### Create the keys directory
```
$ mkdir -m 700 /etc/luks-keys
```

### Generate the key{% if template.encryption.containers.size > 1 %}s{% endif %}
```
{%- for container in template.encryption.containers %}
$ dd bs=512 count=4 if=/dev/random of={{ container.keyfile }} iflag=fullblock
{%- endfor %}
```

### Change the permissions
```
{%- for container in template.encryption.containers %}
$ chmod 600 {{ container.keyfile }}
{%- endfor %}
$ chmod 600 /boot/initramfs-linux*
```

### Add the key{% if bootable_containers.size > 1 %}s{% endif %} in the container{% if bootable_containers.size > 1 %}s{% endif %}

```
{%- for container in bootable_containers %}
$ cryptsetup luksAddKey {{ container.node }} {{ container.keyfile }}
{%- endfor %}
```
