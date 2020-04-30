## Partition the device{% if scenario.plural %}s{% endif %}

Select the partitioning mode corresponding of the boot mode verification in the preparation step.

{% include tabs.html title="partitioning" %}

### Check the partitioning of your device{% if scenario.plural %}s{% endif %}

Verify that the layout is the same as the table above. The code represent the partition type, check the [Arch Linux Wiki Gdisk page](https://wiki.archlinux.org/index.php/GPT_fdisk#Partition_type) for more infos.

```
{%- for device in scenario.storage.devices %}
$ gdisk -l {{ device.node }}
{%- endfor %}
```
