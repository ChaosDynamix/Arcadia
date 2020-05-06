{% if scenario.has_lvm %}
## Setup the Logical Volume Manager

| Node          | Name          | Size recommendation |
| :------------ | :------------ | :------------------ |
{%- for lv in scenario.lvm.lvs %}
| {{ lv.node }} | {{ lv.name }} | {{ lv.size }}       |
{%- endfor %}

### Create the Physical Volume
```
$ pvcreate {{ scenario.lvm.pv }}
```

### Create the Volume Group
```
$ vgcreate {{ scenario.lvm.vg }} {{ scenario.lvm.pv }}
```

### Create the Logical volumes

Before creating the `HOME` volume, use `vgdisplay` to see how many space are available. The `HOME` volume size is equal to the size of the remaining space minus 5G. The 5G of free space are used later for the snapshot volume.

```
{%- for lv in scenario.lvm.lvs %}
lvcreate -L SIZE {{ scenario.lvm.vg }} -n {{ lv.name }}
{%- endfor %}
```

**Note**: Replace SIZE accordingly.
{: .fs-3}
{% else %}
## ERROR: No LVM in this scenario
{% endif %}
