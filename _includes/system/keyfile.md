{% assign bootable_containers = scenario.containers | where: "is_bootable", true %}
{% assign keyfile_containers = scenario.containers | where: "has_keyfile", true %}

{% if keyfile_containers.size > 0 %}
## Setup the Keyfile{% if scenario.containers.size > 1 %}s{% endif %}

{% if bootable_containers.size > 1 %}
Replace `UUID` with the first 4 alphanumeric characters of the devices UUID so you can identify them properly. Example: `cryptlvm7b38.keyfile`.
{% endif %}

### Create the keys directory
```
$ mkdir -m 700 /etc/luks-keys
```

### Generate the key{% if scenario.containers.size > 1 %}s{% endif %}
```
{%- for container in keyfile_containers %}
$ dd bs=512 count=4 if=/dev/random of={{ container.keyfile }} iflag=fullblock
{%- endfor %}
```

### Change the permissions
```
{%- for container in keyfile_containers %}
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
{% else %}
## ERROR: There is no container with a keyfile
{% endif %}
