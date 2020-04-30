## Setup the initial ramdisk images

### Edit the configuration

##### /etc/mkinitcpio.conf
```
FILES=({{ scenario.encryption.containers | map: "keyfile_path" | sort | join: " " }})
HOOKS=({{ site.data.template[scenario.template].mkinitcpio.hooks }})
```

{% if scenario..storage.has_raid %}
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
