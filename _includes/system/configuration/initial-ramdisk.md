{%- assign scenario_title = site.data.system.configuration.initial-ramdisk.map[page.parent_uuid] %}
{%- assign scenario = site.data.system.configuration.initial-ramdisk.scenario[scenario_title] %}

## Setup the initial ramdisk images

### Edit the configuration

##### /etc/mkinitcpio.conf
```
{%- case page.context_abbr %}
  {%- when "lvm" %}
    {%- unless scenario.has_systemd %}
FILES=({{ scenario.files | replace: "_context_", page.context_abbr }})
HOOKS=(base udev autodetect modconf block {% if scenario.has_raid %}mdadm_udev{% endif %} encrypt lvm2 filesystems keyboard keymap fsck)
    {%- else %}
FILES=({{ scenario.files | replace: "_context_", page.context_abbr }})
HOOKS=(base systemd autodetect modconf block {% if scenario.has_raid %}mdadm_udev{% endif %} sd-encrypt sd-lvm2 filesystems keyboard sd-vconsole fsck)
    {%- endunless %}
  {%- when "btrfs" %}
    {%- unless scenario.has_systemd %}
BINARIES=(/usr/bin/btrfs)
FILES=({{ scenario.files | replace: "_context_", page.context_abbr }})
HOOKS=(base udev autodetect modconf block {% if scenario.has_raid %}mdadm_udev{% endif %} encrypt filesystems keyboard keymap fsck)
    {%- else %}
BINARIES=(/usr/bin/btrfs)
FILES=({{ scenario.files | replace: "_context_", page.context_abbr }})
HOOKS=(base systemd autodetect modconf block {% if scenario.has_raid %}mdadm_udev{% endif %} sd-encrypt filesystems keyboard sd-vconsole fsck)
    {%- endunless %}
{%- endcase %}
```

{% if scenario.has_raid %}
### Add a custom hook for mdadm_udev

This hook allow the system to start with a degraded raid array. [Source](https://bugs.archlinux.org/task/57860)

##### /usr/lib/initcpio/install/mdadm_udev
```
add_runscript
```

**Note**: Add this command in the build() function at the end.
{: .fs-3 }

##### /usr/lib/initcpio/hooks/mdadm_udev
```
#!/usr/bin/ash
run_hook() {
  local seconds=10
  mdadm --detail --scan | grep -q INACTIVE_ARRAY || return 0
  echo "Waiting $seconds seconds for incomplete mdadm arrays..."
  sleep $seconds
  mdadm -IRs
}
# vim: set ft=sh ts=4 sw=4 et:
```

**Note**: The script create a local variable, check the arrays for potential inactive array, break if everything is fine, display a message, wait 10 seconds and start the arrays even if they are in degraded state.
{: .fs-3 }

{% endif %}

### Generate the images
```
$ mkinitcpio -p linux
```
