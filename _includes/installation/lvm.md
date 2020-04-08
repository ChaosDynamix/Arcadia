{% assign scenario = include.data %}

{%- assign rootLv = scenario.storage.lvm.lvs | where: "name", "root" | first %}
{%- assign swapLv = scenario.storage.lvm.lvs | where: "name", "swap" | first %}
{%- assign otherLvs = scenario.storage.lvm.lvs | where: "has-dir", true %}
{%- assign otherLvNames = scenario.storage.lvm.lvs | where: "has-dir", true | map: "name" %}
{%- assign otherLvNumber = otherLvs | size %}

## Setup the Logical Volume Manager

| Node          | label          | Size recommendation |
| :------------ | :------------- | :------------------ |
{%- for lv in scenario.storage.lvm.lvs %}
| {{ lv.node }} | {{ lv.label }} | {{ lv.size }}       |
{%- endfor %}

### Create the Physical Volume

```
$ pvcreate {{ scenario.storage.lvm.pv }}
```

### Create the Volume Group

```
$ vgcreate {{ scenario.storage.lvm.vg }} {{ scenario.storage.lvm.pv }}
```

### Create the Logical volumes

{%- unless scenario.storage.lvm.has-encrypted-volumes %}
Before creating the `HOME` volume, use `vgdisplay` to see how many space are available. The `HOME` volume size is equal to the size of the remaining space minus 5G. The 5G of free space are used later for the snapshot volume.
{%- endunless %}

```
{%- for lv in scenario.storage.lvm.lvs %}
$ lvcreate {{ lv.size-arg }} SIZE {{ scenario.storage.lvm.vg }} -n {{ lv.label | downcase }}
{%- endfor %}
```

{% unless scenario.storage.lvm.has-encrypted-volumes %}
### Format the Volumes

```
{%- for lv in scenario.storage.lvm.lvs %}
  {%- unless lv.name == "swap" %}
$ mkfs.ext4 -L {{ lv.label }} {{ lv.node }}
  {%- endunless %}
{%- endfor %}
```

### Mount the volumes

```
$ mount {{ rootLv.node }} /mnt
$ mkdir /mnt/{% if otherLvNumber > 1 %}{ {{- otherLvNames | sort_natural | join: "," -}} }{% else %}{{ otherLvNames[0] }}{% endif %}
{%- for otherLvs in otherLvs %}
$ mount {{ otherLvs.node }} /mnt/{{ otherLvs.name }}
{%- endfor %}
```

### Setup the Swap volume

```
$ mkswap -L {{ swapLv.label }} {{ swapLv.node }}
$ swapon {{ swapLv.node }}
```
{% endunless %}

---
