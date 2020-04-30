## Encrypt the {{ scenario.encryption.context }}

GRUB does not support LUKS2 headers to unlock encrypted `/boot` partition so you need to specify `--type luks1` on encrypted device that GRUB need to access.

{% if scenario.encryption.headerless  %}
### Create the header

```
$ dd if=/dev/zero of=header.img bs=16M count=1
```
{% endif %}

### Create the LUKS1 container{% if scenario.encryption.containers.size > 1 %}s{% endif %}

Passwords must be complex enough to not be easily guessed from e.g. personal information, or cracked using methods like social engineering or brute-force attacks. The tenets of strong passwords are based on length and randomness.

```
{%- for container in scenario.encryption.containers %}
$ cryptsetup --type luks1 luksFormat {{ container.node }}
{%- endfor %}
```

{% if scenario.encryption.headerless %}
**Note**: The `--offset` option allows specifying the start of encrypted data on a device. By reserving a space at the beginning of device you have the option of later reattaching the LUKS header. The value is specified in 512-byte sectors.
{: fs-3}
{% endif %}

### Open the container{% if scenario.encryption.containers.size > 1 %}s{% endif %}

```
{%- for container in scenario.encryption.containers %}
  {%- if container.bootable %}
$ cryptsetup open {{ container.node }} {{ container.name }}
  {%- endif %}
{%- endfor %}
```
