{% if scenario.has_crypttab_initramfs %}
## Edit the initramfs crypttab

##### /etc/crypttab.initramfs
```
{{ scenario.crypttab_initramfs -}}
```

**Note**: Replace `device_UUID` with the UUID of `/dev/sda2` and `/dev/sdb1`.
{: .fs-3 }
{% endif %}
