{% assign template = include.template %}
{% assign devices = template.devices %}
{% assign device_number = template.devices | size %}

## Secure erase the device{% if device_number > 1 %}s{% endif %}
{: .d-inline-block}

IRREVERSIBLE DATA ERASE
{: .label .label-red .mx-2}

Before setting up encryption on a mass storage device, consider securely wiping it first. This consists of overwriting the entire device with a stream of zero bytes or random bytes, and is done for one or both of the following reasons

- Prevent recovery of previously stored data
- Prevent disclosure of usage patterns on the encrypted device

### Create the temporary encrypted container{% if device_number > 1 %}s{% endif %}
```
{%- for device in devices %}
$ cryptsetup open --type plain -d /dev/urandom {{ device.node }} to_be_wiped{{ device.id }}
{%- endfor %}
```

### Wipe the container{% if device_number > 1 %}s{% endif %} with zeros
```
{%- for device in devices %}
$ dd if=/dev/zero of=/dev/mapper/to_be_wiped{{ device.id }} status=progress
{%- endfor %}
```

### Close the temporary container{% if device_number > 1 %}s{% endif %}
```
{%- for device in devices %}
$ cryptsetup close to_be_wiped{{ device.id }}
{%- endfor %}
```
