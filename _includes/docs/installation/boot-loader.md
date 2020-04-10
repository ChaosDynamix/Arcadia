{% assign template = include.template %}
{% assign firmwares = site.data.docs.firmwares %}
{% assign firmwares_partitions = template.firmware-partitions %}
{% assign devices = template.devices %}

## Setup the Boot loader

### Install GRUB package

Grub is choosed because it allow encrypted /boot and increase the security of your system.

{% for firmware in firmwares %}
#### {{ firmware.name }}

```
$ pacman -S {{ firmware.grub.package-list }}
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
{{ template.configuration.grub -}}
```

### Install GRUB on your device

{% for firmware in firmwares %}
#### {{ firmware.name }}

```
{%- case firmware.name %}
  {%- when "BIOS / GPT" %}
    {%- for partition in firmwares_partitions %}
    {%- assign device_node = partition.node | truncate: 8, "" %}
{{ firmware.grub.install-cmd | replace: "device_node", device_node }}
    {%- endfor %}
  {%- when "UEFI / GPT" %}
    {%- for partition in firmwares_partitions %}
{{ firmware.grub.install-cmd | replace: "fimrware_partition_label", partition.efi-label | downcase }}
    {%- endfor %}
{%- endcase %}
```
{% endfor %}

### Generate the configuration
```
$ grub-mkconfig -o /boot/grub/grub.cfg
```

---
