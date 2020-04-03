## Secure erase
{: .d-inline-block}

IRREVERSIBLE DATA ERASE
{: .label .label-red .mx-2}

Before setting up encryption on a mass storage device, consider securely wiping it first. This consists of overwriting the entire device with a stream of zero bytes or random bytes, and is done for one or both of the following reasons

- Prevent recovery of previously stored data
- Prevent disclosure of usage patterns on the encrypted device

### {% if page.has_multiple-devices %}Create the temporary encrypted containers{% else %}Create the temporary encrypted container{% endif %}
{: .no_toc .mt-6}

{% if page.has_multiple-devices %}
```bash
$ cryptsetup open --type plain -d /dev/urandom /dev/sda to_be_wiped1
$ cryptsetup open --type plain -d /dev/urandom /dev/sda to_be_wiped2
```
{% else %}
```bash
$ cryptsetup open --type plain -d /dev/urandom /dev/sda to_be_wiped
```
{% endif %}



### {% if page.has_multiple-devices %}Wipe the containers with zeros{% else %}Wipe the container with zeros{% endif %}
{: .no_toc .mt-6}

{% if page.has_multiple-devices %}
```bash
$ dd if=/dev/zero of=/dev/mapper/to_be_wiped1 status=progress
$ dd if=/dev/zero of=/dev/mapper/to_be_wiped2 status=progress
```
{% else %}
```bash
$ dd if=/dev/zero of=/dev/mapper/to_be_wiped status=progress
```
{% endif %}

### {% if page.has_multiple-devices %}Close the temporary containers{% else %}Close the temporary container{% endif %}
{: .no_toc .mt-6}

{% if page.has_multiple-devices %}
```bash
$ cryptsetup close to_be_wiped1
$ cryptsetup close to_be_wiped2
```
{% else %}
```bash
$ cryptsetup close to_be_wiped
```
{% endif %}

---
