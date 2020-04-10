{% assign template = include.template %}
{% assign scenario = include.scenario %}

{% assign lvs = scenario.lvs %}
{% assign root_lv = lvs | where: "name", "root" | first %}
{% assign swap_lv = lvs | where: "name", "swap" | first %}
{% assign mkdir_lvs = scenario.lvs | where: "mkdir", true %}
{% assign mkdir_lv_names = mkdir_lvs | map: "name" %}
{% assign mkdir_lv_number = mkdir_lvs | size %}

{% assign partitions_node = template.system-partitions | map: "node" %}
{% assign containers_mapper = template.containers | map: "mapper" %}

## Setup the Logical Volume Manager

| Node          | label                  | Size recommendation |
| :------------ | :--------------------- | :------------------ |
{%- for lv in lvs %}
| {{ lv.node }} | {{ lv.name | upcase }} | {{ lv.size }}       |
{%- endfor %}

### Create the Physical Volume

```
$ pvcreate {% if scenario.has-encrypted-volumes %}{{ partitions_node | sort | join: " " }}{% else %}{{ containers_mapper | sort | join: " " }}{% endif %}
```

### Create the Volume Group

```
$ vgcreate {{ scenario.vg }} {% if scenario.has-encrypted-volumes %}{{ partitions_node | sort | join: " " }}{% else %}{{ containers_mapper | sort | join: " " }}{% endif %}
```

### Create the Logical volumes

Before creating the `HOME` volume, use `vgdisplay` to see how many space are available. The `HOME` volume size is equal to the size of the remaining space minus 5G. The 5G of free space are used later for the snapshot volume.

```
{%- for lv in lvs %}
$ lvcreate -L SIZE {{ scenario.vg }} -n {{ lv.name }}
{%- endfor %}
```

### Format the Volumes

```
{%- for lv in lvs %}
  {%- unless lv.name == "swap" or lv.name == "cryptswap" %}
$ mkfs.ext4 -L {{ lv.name | upcase }} {{ lv.node }}
  {%- endunless %}
{%- endfor %}
```

### Mount the volumes

```
$ mount {{ root_lv.node }} /mnt
{%- if mkdir_lv_number == 1 %}
$ mkdir /mnt/{{ mkdir_lv_names[0] }}
{%- else %}
$ mkdir /mnt/{ {{- mkdir_lv_names | sort | join: "," -}} }
{%- endif %}
{%- for mkdir_lv in mkdir_lvs %}
$ mount {{ mkdir_lv.node }} /mnt/{{ mkdir_lv.name }}
{%- endfor %}
```

### Setup the Swap volume

```
$ mkswap -L {{ swap_lv.name | upcase }} {{ swap_lv.node }}
$ swapon {{ swap_lv.node }}
```

---
