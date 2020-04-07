{% assign scenario = include.data %}

## Setup the Boot loader

### Install GRUB package
{: .no_toc .mt-4}

Grub is choosed because it allow encrypted /boot and increase the security of your system.

{% for firmware in site.data.firmwares %}
#### {{ firmware.name }}
{: .no_toc .mt-6}

```bash
$ {{ firmware.grub.package }}
```
{% endfor %}

### Edit the GRUB configuration
{: .no_toc .mt-6 .d-inline-block}

Warning
{: .label .label-red .mx-2}

Before enabling TRIM on a device, make sure the device fully supports TRIM commands, or data loss can occur.
{: .text-red-200}

/etc/default/grub
{: .fs-3 .mb-0}

```bash
{{ scenario.configuration.grub -}}
```

### Install GRUB on your device
{: .no_toc .mt-6}

{% for firmware in site.data.firmwares %}
#### {{ firmware.name }}
{: .no_toc .mt-6}

```bash
$ {{ firmware.grub.install }}
```
{% endfor %}

### Generate the configuration
{: .no_toc .mt-6}

```bash
$ grub-mkconfig -o /boot/grub/grub.cfg
```

---
