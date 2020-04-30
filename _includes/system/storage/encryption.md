{%- assign scenario_title = site.data.system.storage.encryption.map[page.parent_uuid] %}
{%- assign scenario = site.data.system.storage.encryption.scenario[scenario_title] %}

## Encrypt the {{ scenario.context }}

GRUB does not support LUKS2 headers to unlock encrypted `/boot` partition so you need to specify `--type luks1` on encrypted device that GRUB need to access.

{% if scenario.headerless  %}
### Create the header

```
$ dd if=/dev/zero of=header.img bs=16M count=1
```
{% endif %}

### Create the LUKS1 container{% if scenario.plural %}s{% endif %}

Passwords must be complex enough to not be easily guessed from e.g. personal information, or cracked using methods like social engineering or brute-force attacks. The tenets of strong passwords are based on length and randomness.

```
{%- for container in scenario.containers %}
$ cryptsetup --type luks1 luksFormat {{ container.node }}
{%- endfor %}
```

{% if profile.headerless %}
The `--offset` option allows specifying the start of encrypted data on a device. By reserving a space at the beginning of device you have the option of later reattaching the LUKS header. The value is specified in 512-byte sectors.
{% endif %}

### Open the container{% if scenario.plural %}s{% endif %}

```
{%- assign containers_size = scenario.containers | size %}
{%- for container in scenario.containers %}
  {%- if forloop.first and scenario.is_root %}
$ cryptsetup open {{ container.node }} root
  {%- elsif forloop.first and scenario.is_root == false and scenario.containers.size < 2 %}
$ cryptsetup open {{ container.node }} crypt{{ page.context_abbr | downcase }}
  {%- else %}
$ cryptsetup open {{ container.node }} crypt{{ page.context_abbr | downcase }}{{ forloop.index }}
  {%- endif %}
{%- endfor %}
```
