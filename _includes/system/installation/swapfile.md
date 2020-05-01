## Create the swapfile

### Creation

```
{%- if scenario.context == "btrfs" %}
$ truncate -s 0 /swap/swapfile
$ chattr +C /swap/swapfile
$ btrfs property set /swap/swapfile compression none
{%- endif %}
$ dd if=/dev/zero of=/swap/swapfile bs=1M count=512 status=progress
$ chmod 600 /swap/swapfile
```

### Activation

```
$ mkswap /swap/swapfile
$ swapon /swap/swapfile
```

### Add the swapfile

##### /etc/fstab
```
/.swap/swapfile       none        swap        defaults        0 0
```
