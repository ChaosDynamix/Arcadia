## Create the Keyfile{% if scenario.encryption.containers.size > 1 %}s{% endif %}

### Create the keys directory
```
$ mkdir -m 700 /etc/luks-keys
```

### Generate the key{% if scenario.encryption.containers.size > 1 %}s{% endif %}
```
{%- for container in scenario.encryption.containers %}
$ dd bs=512 count=4 if=/dev/random of={{ container.keyfile }} iflag=fullblock
{%- endfor %}
```

### Change the permissions
```
{%- for container in scenario.encryption.containers %}
$ chmod 600 {{ container.keyfile }}
{%- endfor %}
$ chmod 600 /boot/initramfs-linux*
```

### Add the key{% if scenario.encryption.containers.size > 1 %}s{% endif %} in the container{% if scenario.encryption.containers.size > 1 %}s{% endif %}

```
{%- for container in scenario.encryption.containers %}
  {%- if container.bootable %}
$ cryptsetup luksAddKey {{ container.node }} {{ container.keyfile }}
  {%- endif %}
{%- endfor %}
```
