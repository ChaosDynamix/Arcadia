{% assign template = include.template %}
{% assign containers = template.containers %}
{% assign containers_number = containers | size %}

## Setup the Keyfile for the container{% if containers_number > 1 %}s{% endif %}

### Create the keys directory
```
$ mkdir -m 700 /etc/luks-keys
```

### Generate the key{% if containers_number > 1 %}s{% endif %}
```
{%- for container in containers %}
$ dd bs=512 count=4 if=/dev/random of=/etc/luks-keys/{{ container.keyfile }} iflag=fullblock
{%- endfor %}
```

### Change the permissions
```
{%- for container in containers %}
$ chmod 600 /etc/luks-keys/{{ container.keyfile }}
{%- endfor %}
$ chmod 600 /boot/initramfs-linux*
```

### Add the key{% if containers_number > 1 %}s{% endif %} in the container{% if containers_number > 1 %}s{% endif %}
```
{%- for container in containers %}
  {%- unless container.name == "home" %}
$ cryptsetup luksAddKey {{ container.node }} /etc/luks-keys/{{ container.keyfile }}
  {%- endunless %}
{%- endfor %}
```

{% if containers_number > 1 %}
### Add entries to the initramfs crypttab

##### /etc/crypttab.initramfs
```
{%- for container in containers %}
{{ container.name }}      {{ container.node }}        /etc/luks-keys/{{ container.keyfile }}
{%- endfor %}
```
{% endif %}

---
