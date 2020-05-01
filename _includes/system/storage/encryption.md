{% assign step = scenario.encryption.steps | where: "id", include.step | first %}
{% assign step_containers = scenario.encryption.containers | where: "step_id", include.step %}

## Encrypt the {{ step.ctx }}

{% if step.id == 1 %}
GRUB does not support LUKS2 headers to unlock encrypted `/boot` partition so you need to specify `--type luks1` on encrypted device that GRUB need to access.
{% endif %}

{% if scenario.encryption.headerless  %}
### Create the header

```
$ dd if=/dev/zero of=header.img bs=16M count=1
```
{% endif %}

### Create the LUKS1 container{% if step_containers.size > 1 %}s{% endif %}

Passwords must be complex enough to not be easily guessed from e.g. personal information, or cracked using methods like social engineering or brute-force attacks. The tenets of strong passwords are based on length and randomness.

```
{%- for container in step_containers %}
$ cryptsetup --type luks1 luksFormat {{ container.node }} {% if container.init_key %}{{ container.keyfile }}{% endif %}
{%- endfor %}
```

{% if scenario.encryption.headerless %}
**Note**: The `--offset` option allows specifying the start of encrypted data on a device. By reserving a space at the beginning of device you have the option of later reattaching the LUKS header. The value is specified in 512-byte sectors.
{: fs-3}
{% endif %}

### Open the container{% if step_containers.size > 1 %}s{% endif %}

```
{%- for container in step_containers %}
$ cryptsetup {% if container.init_key %}-d {{ container.keyfile }}{% endif %} open {{ container.node }} {{ container.name }}
{%- endfor %}
```
