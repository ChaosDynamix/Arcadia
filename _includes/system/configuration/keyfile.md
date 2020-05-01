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

{% if site.data.template[scenario.template].init_system == "systemd" %}
### Add entries to the initramfs crypttab

##### /etc/crypttab.initramfs
```
{%- for container in scenario.encryption.containers %}
{{ container.name }}     UUID=device_UUID     {{ container.keyfile }}
{%- endfor %}
```

**Note**: Replace `device_UUID` with the UUID of `/dev/sda2` and `/dev/sdb1`.
{: .fs-3 }
{% endif %}
