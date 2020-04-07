{% assign scenario = include.data %}
{% assign containernumber = scenario.storage.containers | size %}

## Setup the Keyfile for the container{% if containernumber > 1 %}s{% endif %}

### Create the keys directory
{: .no_toc}

```bash
$ mkdir -m 700 /etc/luks-keys
```

### Generate the key{% if containernumber > 1 %}s{% endif %}
{: .no_toc .mt-6}

```bash
{%- for container in scenario.storage.containers %}
$ dd bs=512 count=4 if=/dev/random of=/etc/luks-keys/{{ container.keyfile }} iflag=fullblock
{%- endfor %}
```

### Change the permissions
{: .no_toc .mt-6}

```bash
{%- for container in scenario.storage.containers %}
$ chmod 600 /etc/luks-keys/{{ container.keyfile }}
{%- endfor %}
$ chmod 600 /boot/initramfs-linux*
```

### Add the key in the container{% if containernumber > 1 %}s{% endif %}
{: .no_toc .mt-6}

```bash
{%- for container in scenario.storage.containers %}
  {%- unless container.name == "home" and scenario.storage.lvm.has-encrypted-volumes %}
$ cryptsetup luksAddKey {{ container.node }} /etc/luks-keys/{{ container.keyfile }}
  {%- endunless %}
{%- endfor %}
```

{% if scenario.storage.containers > 1 %}
---

## Add entries to the initramfs crypttab
{: .no_toc .mt-6}

/etc/crypttab.initramfs
{: .fs-3 .mb-0}

```bash
{%- for container in scenario.storage.containers %}
{{ container.name }}    {{ container.node }}     /etc/luks-keys/{{ container.keyfile }}
{%- endfor %}
```
{% endif %}

---
