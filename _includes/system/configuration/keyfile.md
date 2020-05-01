## Create the Keyfile{% if template.encryption.containers.size > 1 %}s{% endif %}

### Create the keys directory
```
$ mkdir -m 700 /etc/luks-keys
```

### Generate the key{% if template.encryption.containers.size > 1 %}s{% endif %}
```
{%- for container in template.encryption.containers %}
$ dd bs=512 count=4 if=/dev/random of={{ container.keyfile | replace: "_context_", scenario.controller }} iflag=fullblock
{%- endfor %}
```

### Change the permissions
```
{%- for container in template.encryption.containers %}
$ chmod 600 {{ container.keyfile | replace: "_context_", scenario.controller }}
{%- endfor %}
$ chmod 600 /boot/initramfs-linux*
```

### Add the key{% if template.encryption.containers.size > 1 %}s{% endif %} in the container{% if template.encryption.containers.size > 1 %}s{% endif %}

```
{%- for container in template.encryption.containers %}
  {%- if container.bootable %}
$ cryptsetup luksAddKey {{ container.node }} {{ container.keyfile | replace: "_context_", scenario.controller }}
  {%- endif %}
{%- endfor %}
```
