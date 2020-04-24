{% assign profile = include.profile %}

## Encrypt the {{ profile.context }}

GRUB does not support LUKS2 headers to unlock encrypted `/boot` partition so you need to specify `--type luks1` on encrypted device that GRUB need to access.

{% if profile.headerless  %}
### Create the header

```
$ dd if=/dev/zero of=header.img bs=16M count=1
```
{% endif %}

### Create the LUKS1 container{% if profile.plural %}s{% endif %}

```
{{ profile.command.create }}
```

{% if profile.headerless %}
The `--offset` option allows specifying the start of encrypted data on a device. By reserving a space at the beginning of device you have the option of later reattaching the LUKS header. The value is specified in 512-byte sectors.
{% endif %}

### Open the container{% if profile.plural %}s{% endif %}

```
{{ profile.command.open }}
```
