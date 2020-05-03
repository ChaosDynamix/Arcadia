{% assign bootable_containers = scenario.encryption.containers | where: "is_bootable", true %}

## Setup the Keyfile{% if scenario.encryption.containers.size > 1 %}s{% endif %}

{% if bootable_containers.size > 1 %}
Replace `UUID` with the first 4 alphanumeric characters of the devices UUID so you can identify them properly. Example: `cryptlvm7b38.keyfile`.
{% endif %}

### Create the keys directory
```
$ mkdir -m 700 /etc/luks-keys
```

### Generate the key{% if scenario.encryption.containers.size > 1 %}s{% endif %}
```
{%- for container in scenario.encryption.containers %}
  {%- assign keyfile = scenario.encryption.keyfiles | where: "id", container.keyfile_id | first %}
$ dd bs=512 count=4 if=/dev/random of={{ keyfile.path }} iflag=fullblock
{%- endfor %}
```

### Change the permissions
```
{%- for container in scenario.encryption.containers %}
  {%- assign keyfile = scenario.encryption.keyfiles | where: "id", container.keyfile_id | first %}
$ chmod 600 {{ keyfile.path }}
{%- endfor %}
$ chmod 600 /boot/initramfs-linux*
```

### Add the key{% if bootable_containers.size > 1 %}s{% endif %} in the container{% if bootable_containers.size > 1 %}s{% endif %}

```
{%- for container in bootable_containers %}
  {%- assign keyfile = scenario.encryption.keyfiles | where: "id", container.keyfile_id | first %}
$ cryptsetup luksAddKey {{ container.node }} {{ keyfile.path }}
{%- endfor %}
```
