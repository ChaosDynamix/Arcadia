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

#### TRIM

##### /etc/default/grub
```
{{ scenario.grub -}}
```

#### NO TRIM

##### /etc/default/grub
```
{{ scenario.grub | replace: ":allow-discards", "" | replace: "rd.luks.options=discard ", "" -}}
```

{% unless template.has_systemd %}
**Note**: Replace `device_uuid` with the UUID of your device.
{: .fs-3 }
{% endunless %}

### Install GRUB on the device{%- if template.has_raid %}s{% endif %}

```
{%- if template.has_raid %}
$ grub-install --target=i386-pc --recheck /dev/sda
$ grub-install --target=i386-pc --recheck /dev/sdb
{%- else %}
$ grub-install --target=i386-pc --recheck /dev/sda
{%- endif %}
```
