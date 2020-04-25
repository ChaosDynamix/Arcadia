{% assign scenario = include.scenario %}

## Setup the Logical Volume Manager

| Node               | label     | Size recommendation |
| :----------------- | :-------- | :------------------ |
| /dev/grp/cryptroot | CRYPTROOT | 23-32 GiB           |
| /dev/grp/cryptswap | CRYPTSWAP | > 512M              |
| /dev/grp/crypthome | CRYPTHOME | 100%FREE            |

### Create the Physical Volume

```
{{ scenario.cmd.pv }}
```

### Create the Volume Group

```
{{ scenario.cmd.vg }}
```
