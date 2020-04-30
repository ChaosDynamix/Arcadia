## Setup the Keyfile for the container{% if scenario.encryption.containers.size > 1 %}s{% endif %}

### Create the keys directory
```
$ mkdir -m 700 /etc/luks-keys
```

### Generate the key{% if scenario.encryption.containers.size > 1 %}s{% endif %}
```
{%- for container in scenario.encryption.containers %}
$ dd bs=512 count=4 if=/dev/random of=/etc/luks-keys/{{ container.keyfile }} iflag=fullblock
{%- endfor %}
```

### Change the permissions
```
{%- for container in scenario.encryption.containers %}
$ chmod 600 /etc/luks-keys/{{ container.keyfile }}
{%- endfor %}
$ chmod 600 /boot/initramfs-linux*
```

### Add the key{% if scenario.encryption.containers.size > 1 %}s{% endif %} in the container{% if scenario.encryption.containers.size > 1 %}s{% endif %}
```
{%- for container in scenario.encryption.containers %}
$ cryptsetup luksAddKey {{ container.node }} /etc/luks-keys/{{ container.keyfile }}
{%- endfor %}
```

{% if site.data.template[scenario.template].init_system == "systemd" %}
### Add entries to the initramfs crypttab

##### /etc/crypttab.initramfs
```
cryptlvm1     UUID=device_UUID_of_sda2     /etc/luks-keys/cryptlvm1.keyfile
cryptlvm2     UUID=device_UUID_of_sdb1     /etc/luks-keys/cryptlvm2.keyfile
```

**Note**: Replace `device_UUID_of_sdXY` with the UUID of `/dev/sda2` and `/dev/sdb1`.
{: .fs-3 }
{% endif %}
