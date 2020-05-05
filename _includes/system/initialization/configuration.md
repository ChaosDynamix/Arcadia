### Edit the GRUB configuration
{: .d-inline-block}

Warning
{: .label .label-red .mx-2}

Before enabling TRIM on a device, make sure the device fully supports TRIM commands, or data loss can occur.
{: .text-red-200}

{%- case scenario.profile.initialization %}
  {%- when "busybox_luks_lvm" %}
    {%- assign bootable_container = scenario.containers | when: "is_bootable" true | first %}
#### TRIM
##### /etc/default/grub
```
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=device_uuid:{{ bootable_container.name }}:allow-discards cryptkey=rootfs:{{ bootable_container.keyfile }} root=/dev/grp/root loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```
#### NO TRIM
##### /etc/default/grub
```
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=device_uuid:{{ bootable_container.name }} cryptkey=rootfs:{{ bootable_container.keyfile }} root=/dev/grp/root loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```
  {%- when "systemd_luks_lvm" %}
#### TRIM
##### /etc/default/grub
```
GRUB_CMDLINE_LINUX_DEFAULT="rd.luks.options=discard root=/dev/grp/root loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```
#### NO TRIM
##### /etc/default/grub
```
GRUB_CMDLINE_LINUX_DEFAULT="root=/dev/grp/root loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```
**Note**: Replace `device_uuid` with the UUID of your device.
{: .fs-3 }
{%- endcase %}
