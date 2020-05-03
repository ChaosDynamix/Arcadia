## Edit the configuration of the tables

{% if scenario.has_fstab_cfg %}
### Edit the fstab

##### /etc/fstab
```
{{ scenario.fstab_cfg -}}
```
{% endif %}
{% if scenario.has_crypttab_cfg %}
### Edit the crypttab

##### /etc/crypttab
```
{{ scenario.crypttab_cfg -}}
```
{% endif %}
{% if scenario.has_crypttab_initramfs_cfg %}
### Edit the initramfs crypttab

##### /etc/crypttab.initramfs
```
{{ scenario.crypttab_initramfs_cfg -}}
```

**Note**: Replace `device_UUID` with the UUID of `/dev/sda2` and `/dev/sdb1`.
{: .fs-3 }
{% endif %}
