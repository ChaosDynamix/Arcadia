{% assign profile = site.data.lvm.profile[scenario.lvm.template] %}

## Setup the Logical Volume Manager

| Node                | Label              | Size recommendation |
| :------------------ | :----------------- | :------------------ |
{%- for volume in profile.volumes %}
| `{{ volume.node }}` | {{ volume.label }} | {{ volume.size }}   |
{%- endfor %}

### Create the Physical Volume
```
$ pvcreate {{ scenario.lvm.pv }}
```

### Create the Volume Group
```
$ vgcreate grp {{ scenario.lvm.pv }}
```

### Create the Logical volumes

Before creating the `HOME` volume, use `vgdisplay` to see how many space are available. The `HOME` volume size is equal to the size of the remaining space minus 5G. The 5G of free space are used later for the snapshot volume.

```
{%- for volume in profile.volumes %}
$ lvcreate -L SIZE grp -n {{ volume.label | downcase }}
{%- endfor %}
```

**Note**: Replace SIZE accordingly.
{: .fs-3}
