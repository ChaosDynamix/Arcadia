## Setup the Logical Volume Manager

| Node | Label | Size recommendation |
| :--- | :---- | :------------------ |
{%- for volume in site.data.context.lvm[scenario.lvm.template].lvs %}
| `{{ volume.node | replace: "_grp_", site.data.context.lvm[scenario.lvm.template].vg }}` | {{ volume.label }}  | {{ volume.size }} |
{%- endfor %}

### Create the Physical Volume
```
$ pvcreate {{ scenario.lvm.physical_vol }}
```

### Create the Volume Group
```
$ vgcreate {{ site.data.context.lvm[scenario.lvm.template].vg }} {{ scenario.lvm.physical_vol }}
```

### Create the Logical volumes

Before creating the `HOME` volume, use `vgdisplay` to see how many space are available. The `HOME` volume size is equal to the size of the remaining space minus 5G. The 5G of free space are used later for the snapshot volume.

```
{%- for volume in site.data.context.lvm[scenario.lvm.template].lvs %}
$ lvcreate -L SIZE {{ site.data.lvm[scenario.lvm.template].vg }} -n {{ volume.label | downcase }}
{%- endfor %}
```

**Note**: Replace SIZE accordingly.
{: .fs-3}
