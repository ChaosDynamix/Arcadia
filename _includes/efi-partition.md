## EFI partition
{: .d-inline-block}

UEFI
{: .label .label-blue .ml-2}

### Format the partition
{: .no_toc .mt-0}

{% if page.has_raid %}
```bash
$ mkfs.fat -F32 -n EFI1 /dev/sda1
$ mkfs.fat -F32 -n EFI1 /dev/sdb1
```
{% elsif page.has_detached_header %}
```bash
$ mkfs.fat -F32 -n EFI /dev/sdb1
```
{% else %}
```bash
$ mkfs.fat -F32 -n EFI /dev/sda1
```
{% endif %}

### Mount the partition
{: .no_toc .mt-6}

{% if page.has_raid %}
```bash
$ mkdir /mnt/{efi1,efi2}
$ mount /dev/sda1 /mnt/efi1
$ mount /dev/sdb1 /mnt/efi2
```
{% elsif page.has_detached_header %}
```bash
$ mkdir /mnt/efi
$ mount /dev/sdb1 /mnt/efi
```
{% else %}
```bash
$ mkdir /mnt/efi
$ mount /dev/sda1 /mnt/efi
```
{% endif %}

---
