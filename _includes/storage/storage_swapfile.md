{% if scenario.has_swapfile %}
## Create the swapfile

### Create the swapfile

```
{%- if scenario.filesystem == "btrfs" %}
$ truncate -s 0 /swap/swapfile
$ chattr +C /swap/swapfile
$ btrfs property set /swap/swapfile compression none
{%- endif %}
$ dd if=/dev/zero of=/swap/swapfile bs=1M count=512 status=progress
$ chmod 600 /swap/swapfile
```

### Format and Activate the swapfile

```
$ mkswap -L SWAP /swap/swapfile
$ swapon /swap/swapfile
```
{% endif %}
