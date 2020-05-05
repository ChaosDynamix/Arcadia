{% assign step = scenario.steps | where: "id", include.step | first %}
{% assign step_containers = scenario.containers | where: "step_id", step.id %}

{% case include.step %}
  {% when 1 %}

{% assign headerless_containers = step_containers | where: "has_detached_header", true %}
{% assign bootable_containers = step_containers | where: "is_bootable", true %}

## Encrypt the {{ step.encryption_ctx }}

{% if headerless_containers.size > 0 %}
### Create the header{% if headerless_containers.size > 1 %}s{% endif %}
```
{%- for container in headerless_containers %}
$ dd if=/dev/zero of={{ container.header }} bs=16M count=1
{%- endfor %}
```
{% endif %}

### Create the LUKS1 container{% if step_containers.size > 1 %}s{% endif %}

GRUB does not support LUKS2 headers to unlock encrypted `/boot` partition so you need to specify `--type luks1` on encrypted device that GRUB need to access.

Passwords must be complex enough to not be easily guessed from e.g. personal information, or cracked using methods like social engineering or brute-force attacks. The tenets of strong passwords are based on length and randomness.

```
{%- for container in step_containers %}
$ cryptsetup --type {{ container.type }} luksFormat {{ container.node }}{% if container.has_detached_header %} --offset 32768 --header {{ container.header }}{% endif %}
{%- endfor %}
```

{% if headerless_containers.size > 0 %}
**Note**: The `--offset` option allows specifying the start of encrypted data on a device. By reserving a space at the beginning of device you have the option of later reattaching the LUKS header. The value is specified in 512-byte sectors.
{: fs-3}
{% endif %}

### Open the container{% if step_containers.size > 1 %}s{% endif %}

```
{%- for container in step_containers %}
$ cryptsetup open{% if container.has_detached_header %} --header {{ container.header }}{% endif %} {{ container.node }} {{ container.name }}
{%- endfor %}
```

{% if bootable_containers.size > 1 %}
**Note**: Replace `UUID` with the first 4 alphanumeric characters of the devices UUID so you can identify them properly. Example: `cryptlvm7b38`.
{: .fs-3 }
{% endif %}
  {% when 2 %}
## Encrypt the {{ step.encryption_ctx }}

### Create the LUKS1 container{% if step_containers.size > 1 %}s{% endif %}

```
{%- for container in step_containers %}
$ cryptsetup --type {{ container.type }} luksFormat {{ container.node }} {{ container.keyfile }}
{%- endfor %}
```

### Open the container{% if step_containers.size > 1 %}s{% endif %}

```
{%- for container in step_containers %}
$ cryptsetup -d {{ container.keyfile }} open {{ container.node }} {{ container.name }}
{%- endfor %}
```
{% endcase %}
