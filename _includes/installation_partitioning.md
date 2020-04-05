{% assign scenario = include.data %}

## {% if scenario.has-multiple-devices %}Partition the devices{% else %}Partition the device{% endif %}

{% for firmware in site.data.firmwares %}

### {{ firmware.name }} / {{ firmware.partition-table }}
{: .no_toc .text-delta .mt-6}

  {% if scenario.has-raid1 %}

```bash
$ sgdisk -o {{ firmware.sgdisk-creation }} {{ scenario.sgdisk-creation }} {{ firmware.sgdisk-partype }} {{ scenario.sgdisk-partype }} -R=/dev/sdb {{ scenario.sgdisk-device }}
$ sgdisk -G /dev/sdb
```

| Partition id                 | Partition type               | Partition size               |
| :--------------------------- | :--------------------------- | :--------------------------- |
| {{ firmware.table-device1 }} | {{ firmware.table-partype }} | {{ firmware.table-parsize }} |
| {{ scenario.table-parid1 }}  | {{ scenario.table-partype }} | {{ scenario.table-parsize }} |
| {{ firmware.table-device2 }} | {{ firmware.table-partype }} | {{ firmware.table-parsize }} |
| {{ scenario.table-parid2 }}  | {{ scenario.table-partype }} | {{ scenario.table-parsize }} |

  {% elsif scenario.has-multiple-devices %}

```bash
$ sgdisk -o {{ firmware.sgdisk-creation }} {{ scenario.sgdisk-creation }} {{ firmware.sgdisk-partype }} {{ scenario.sgdisk-partype }} {{ scenario.sgdisk-device }}
$ sgdisk -o -n=1:0:0 {{ scenario.sgdisk-partype }} /dev/sdb
```

| Partition id                 | Partition type               | Partition size               |
| :--------------------------- | :--------------------------- | :--------------------------- |
| {{ firmware.table-device1 }} | {{ firmware.table-partype }} | {{ firmware.table-parsize }} |
| {{ scenario.table-parid1 }}  | {{ scenario.table-partype }} | {{ scenario.table-parsize }} |
| {{ scenario.table-parid2 }}  | {{ scenario.table-partype }} | {{ scenario.table-parsize }} |

  {% else %}

```bash
$ sgdisk -o {{ firmware.sgdisk-creation }} {{ scenario.sgdisk-creation }} {{ firmware.sgdisk-partype }} {{ scenario.sgdisk-partype }} {{ scenario.sgdisk-device }}
```

| Partition id                 | Partition type               | Partition size               |
| :--------------------------- | :--------------------------- | :--------------------------- |
| {{ firmware.table-device1 }} | {{ firmware.table-partype }} | {{ firmware.table-parsize }} |
| {{ scenario.table-parid1 }}  | {{ scenario.table-partype }} | {{ scenario.table-parsize }} |

  {% endif %}

{% endfor %}

---
