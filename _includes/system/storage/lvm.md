{% assign template = include.template %}
{% assign profile = include.profile %}

## Setup the Logical Volume Manager

| Node          | label          | Size recommendation |
| :------------ | :------------- | :------------------ |
{%- for lv in template.logical_volumes %}
| {{ lv.node }} | {{ lv.label }} | {{ lv.size }}       |
{%- endfor %}

### Create the Physical Volume

```
{{ profile.command.physical_volume }}
```

### Create the Volume Group

```
{{ profile.command.volume_group }}
```

### Create the Logical volumes

Before creating the `HOME` volume, use `vgdisplay` to see how many space are available. The `HOME` volume size is equal to the size of the remaining space minus 5G. The 5G of free space are used later for the snapshot volume.

```
{{ template.command.logical_volumes -}}
```

### Format the Volumes

```
{{ template.command.format -}}
```

### Mount the volumes

```
{{ template.command.mount -}}
```

### Setup the Swap volume

```
{{ template.command.swap -}}
```
