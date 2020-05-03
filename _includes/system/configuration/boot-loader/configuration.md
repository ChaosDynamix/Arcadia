### Edit the GRUB configuration
{: .d-inline-block}

Warning
{: .label .label-red .mx-2}

Before enabling TRIM on a device, make sure the device fully supports TRIM commands, or data loss can occur.
{: .text-red-200}

#### TRIM

##### /etc/default/grub
```
{{ scenario.grub_cfg -}}
```

#### NO TRIM

##### /etc/default/grub
```
{{ scenario.grub_cfg | replace: ":allow-discards", "" | replace: "rd.luks.options=discard ", "" -}}
```

{% unless scenario.has_systemd %}
**Note**: Replace `device_uuid` with the UUID of your device.
{: .fs-3 }
{% endunless %}
