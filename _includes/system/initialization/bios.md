### Install GRUB package
```
$ pacman -S grub
```

### Edit the GRUB configuration
{: .d-inline-block}

Warning
{: .label .label-red .mx-2}

Before enabling TRIM on a device, make sure the device fully supports TRIM commands, or data loss can occur.
{: .text-red-200}

#### TRIM
##### /etc/default/grub
```
{{ scenario.grub.config -}}
```

#### NO TRIM
##### /etc/default/grub
```
{{ scenario.grub.config | replace: ":allow-discards", "" | replace: "rd.luks.options=discard ", "" -}}
```

{% if bootable_containers.size > 1 %}
**Note**: Replace `device_uuid` with the UUID of your device.
{: .fs-3 }
{% endif %}

### Install GRUB on the device{%- if scenario.has_raid %}s{% endif %}

```
{%- if scenario.has_raid %}
$ grub-install --target=i386-pc --recheck /dev/sda
$ grub-install --target=i386-pc --recheck /dev/sdb
{%- else %}
{%- assign boot = scenario.partitions | where: "has_boot", true | first %}
$ grub-install --target=i386-pc --recheck {{ boot.node | slice: 0,8 }}
{%- endif %}
```
