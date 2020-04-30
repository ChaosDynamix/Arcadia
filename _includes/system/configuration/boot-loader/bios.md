### Install GRUB package

Grub is choosed because it allow encrypted /boot and increase the security of your system.

```
$ pacman -S grub
```

### Edit the GRUB configuration
{: .d-inline-block}

Warning
{: .label .label-red .mx-2}

Before enabling TRIM on a device, make sure the device fully supports TRIM commands, or data loss can occur.
{: .text-red-200}

{% for configuration in site.date.template[scenario.template].grub_configurations %}
#### {{ configuration.title }}

##### /etc/default/grub
```
{{ configuration.cmd | replace: "_context_", page.context_abbr -}}
```
{% endfor %}

{% unless site.date.template[scenario.template].init_system == "systemd" %}
**Note**: Replace `7b38f0ff-08a5-463d-8c18-e4386b89721e` with the UUID of your device.
{: .fs-3 }
{% endunless %}

### Install GRUB on the device{%- if scenario.storage.has_raid %}s{% endif %}

```
{%- if scenario.storage.has_raid %}
$ grub-install --target=i386-pc --recheck /dev/sda
$ grub-install --target=i386-pc --recheck /dev/sdb
{%- else %}
$ grub-install --target=i386-pc --recheck /dev/sda
{%- endif %}
```
