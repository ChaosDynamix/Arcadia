{% if template.has_crypttab_initramfs %}
## Edit the initramfs crypttab

##### /etc/crypttab.initramfs
```
{{ site.data.template[scenario.template].crypttab_initramfs | replace: "_context_", scenario.context -}}
```

**Note**: Replace `device_UUID` with the UUID of `/dev/sda2` and `/dev/sdb1`.
{: .fs-3 }
{% endif %}
