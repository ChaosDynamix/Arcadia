{% assign scenario = include.data %}

{%- assign rootlv = scenario.storage.lvm.lvs | where: "is-root", true | first %}
{%- assign swaplv = scenario.storage.lvm.lvs | where: "is-swap", true | first %}
{%- assign otherlvs = scenario.storage.lvm.lvs | where: "has-dir", true %}
{%- assign otherlvslabels = scenario.storage.lvm.lvs | where: "has-dir", true | map: "label" %}

## Setup the Logical Volume Manager

| Node          | label          | Size recommendation |
| :------------ | :------------- | :------------------ |
{%- for lv in scenario.storage.lvm.lvs %}
| {{ lv.node }} | {{ lv.label }} | {{ lv.size }}       |
{%- endfor %}

### Create the Physical Volume
{: .no_toc}

```bash
$ pvcreate {{ scenario.storage.lvm.pv }}
```

### Create the Volume Group
{: .no_toc .mt-6}

```bash
$ vgcreate {{ scenario.storage.lvm.vg }} {{ scenario.storage.lvm.pv }}
```
### Create the Logical volumes
{: .no_toc .mt-6}

{%- unless scenario.storage.lvm.has-encrypted-volumes %}
Before creating the `HOME` volume, use `vgdisplay` to see how many space are available. The `HOME` volume size is equal to the size of the remaining space minus 5G. The 5G of free space are used later for the snapshot volume.
{%- endunless %}

```bash
{%- for lv in scenario.storage.lvm.lvs %}
$ lvcreate {{ lv.arg }} SIZE {{ scenario.storage.lvm.vg }} -n {{ lv.label }}
{%- endfor %}
```

{% unless scenario.storage.lvm.has-encrypted-volumes %}
### Format the Volumes
{: .no_toc .mt-6}

```bash
{%- for lv in scenario.storage.lvm.lvs %}
  {%- unless lv.is-swap %}
$ mkfs.ext4 -L {{ lv.label }} {{ lv.node }}
  {%- endunless %}
{%- endfor %}
```

### Mount the volumes
{: .no_toc .mt-6}

```bash
$ mount {{ rootlv.node }} {{ rootlv.mount }}
$ mkdir /mnt/{ {{- otherlvslabels | sort_natural | join: "," | downcase -}} }
{%- for otherlv in otherlvs %}
$ mount {{ otherlv.node }} {{ otherlv.mount }}
{%- endfor %}
```

### Setup the Swap volume
{: .no_toc .mt-6}

```bash
$ mkswap -L {{ swaplv.label }} {{ swaplv.node }}
$ swapon {{ swaplv.node }}
```
{% endunless %}

---
