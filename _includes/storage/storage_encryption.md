{% assign step_containers = scenario.containers | where: "page", page.title %}
{% assign headerless_containers = step_containers | where: "has_detached_header", true %}
{% assign bootable_containers = step_containers | where: "is_bootable", true %}
{% assign keyfile_containers = step_containers | where: "init_method", "keyfile" %}
{% assign password_containers = step_containers | where: "init_method", "password" %}

## Encrypt the {{ txt.include.encryption_ctx }}

{% if headerless_containers.size > 0 %}
### Create the header{% if headerless_containers.size > 1 %}s{% endif %}
```
{%- for container in headerless_containers %}
$ dd if=/dev/zero of={{ container.header }} bs=16M count=1
{%- endfor %}
```
{% endif %}

### Create the LUKS1 container{% if step_containers.size > 1 %}s{% endif %}

{% if bootable_containers.size > 0 %}
GRUB does not support LUKS2 headers to unlock encrypted `/boot` partition so you need to specify `--type luks1` on encrypted device that GRUB need to access.
{% endif %}

{% if password_containers.size > 0 %}
Passwords must be complex enough to not be easily guessed from e.g. personal information, or cracked using methods like social engineering or brute-force attacks. The tenets of strong passwords are based on length and randomness.
{% endif %}

```
{%- for container in step_containers %}
$ cryptsetup --type {{ container.type }} luksFormat {{ container.node }}{% if container.has_detached_header %} --offset 32768 --header {{ container.header }}{% endif %}{% if container.init_method == "keyfile" %} {{ container.keyfile }}{% endif %}
{%- endfor %}
```

{% if headerless_containers.size > 0 %}
**Note**: The `--offset` option allows specifying the start of encrypted data on a device. By reserving a space at the beginning of device you have the option of later reattaching the LUKS header. The value is specified in 512-byte sectors.
{: fs-3}
{% endif %}

### Open the container{% if step_containers.size > 1 %}s{% endif %}

```
{%- for container in step_containers %}
$ cryptsetup open{% if container.init_method == "keyfile" %} -d {{ container.keyfile }}{% endif %}{% if container.has_detached_header %} --header {{ container.header }}{% endif %} {{ container.node }} {{ container.name }}
{%- endfor %}
```

{% if bootable_containers.size > 1 %}
**Note**: Replace `UUID` with the first 4 alphanumeric characters of the devices UUID so you can identify them properly. Example: `cryptlvm7b38`.
{: .fs-3 }
{% endif %}

### References

1. [Wikipedia - Encryption](https://en.wikipedia.org/wiki/Encryption)
1. [Wikipedia - Dm-crypt](https://en.wikipedia.org/wiki/Dm-crypt)
1. [Wikipedia - LUKS](https://en.wikipedia.org/wiki/Linux_Unified_Key_Setup)
1. [ArchWiki - Dm-crypt/Device encryption](https://wiki.archlinux.org/index.php/Dm-crypt/Device_encryption)
1. [ArchWiki - Dm-crypt/Encrypting an entire system](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system)
1. [ManPage - Cryptsetup](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/cryptsetup/cryptsetup.8.en)
{: .fs-3}
