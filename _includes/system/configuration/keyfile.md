{%- assign scenario_title = site.data.system.configuration.keyfile.map[page.parent_uuid] %}
{%- assign scenario = site.data.system.configuration.keyfile.scenario[scenario_title] %}

## Setup the Keyfile for the container{% if scenario.plural %}s{% endif %}

### Create the keys directory
```
$ mkdir -m 700 /etc/luks-keys
```

### Generate the key{% if scenario.plural %}s{% endif %}
```
{%- for container in scenario.containers %}
$ dd bs=512 count=4 if=/dev/random of=/etc/luks-keys/{{ container.keyfile | replace: "_context_", page.context_abbr | downcase }} iflag=fullblock
{%- endfor %}
```

### Change the permissions
```
{%- for container in scenario.containers %}
$ chmod 600 /etc/luks-keys/{{ container.keyfile | replace: "_context_", page.context_abbr | downcase }}
{%- endfor %}
$ chmod 600 /boot/initramfs-linux*
```

### Add the key{% if scenario.plural %}s{% endif %} in the container{% if scenario.plural %}s{% endif %}
```
{%- for container in scenario.containers %}
$ cryptsetup luksAddKey {{ container.node }} /etc/luks-keys/{{ container.keyfile | replace: "_context_", page.context_abbr | downcase }}
{%- endfor %}
```

{% if scenario.systemd %}
### Add entries to the initramfs crypttab

##### /etc/crypttab.initramfs
```
cryptlvm1     /dev/sda2     /etc/luks-keys/cryptlvm1.keyfile
cryptlvm2     /dev/sdb1     /etc/luks-keys/cryptlvm2.keyfile
```

It is highly recommended to replace the nodes (/dev/sdXY) with the UUID of the devices, however during the installation, it is easier to use `/dev/sdXY`. **Consider replacing the values after the installation**.

##### Example
```
cryptlvm1     UUID=2f9a8428-ac69-478a-88a2-4aa458565431     /etc/luks-keys/cryptlvm1.keyfile
cryptlvm2     UUID=2f9a8428-ac69-478a-88a2-4aa458565431     /etc/luks-keys/cryptlvm2.keyfile
```
{% endif %}
