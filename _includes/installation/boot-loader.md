{% assign scenario = include.data %}

## Setup the Boot loader

### Install GRUB package

Grub is choosed because it allow encrypted /boot and increase the security of your system.

{% for firmware in site.data.firmwares %}
#### {{ firmware.name }}

```
$ {{ firmware.grub.package }}
```
{% endfor %}

### Edit the GRUB configuration
{: .d-inline-block}

Warning
{: .label .label-red .mx-2}

Before enabling TRIM on a device, make sure the device fully supports TRIM commands, or data loss can occur.
{: .text-red-200}

##### /etc/default/grub
```
{{ scenario.configuration.grub -}}
```

### Install GRUB on your device

{% for firmware in site.data.firmwares %}
#### {{ firmware.name }}

```
$ {{ firmware.grub.install }}
```
{% endfor %}

### Generate the configuration
```
$ grub-mkconfig -o /boot/grub/grub.cfg
```

---
