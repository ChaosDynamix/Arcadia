## Secure erase the device{% if scenario.devices.size > 1 %}s{% endif %}
{: .d-inline-block}

IRREVERSIBLE DATA ERASE
{: .label .label-red .mx-2}

Before setting up encryption on a mass storage device, consider securely wiping it first. This consists of overwriting the entire device with a stream of zero bytes or random bytes, and is done for one or both of the following reasons

- Prevent recovery of previously stored data
- Prevent disclosure of usage patterns on the encrypted device

### Create the temporary encrypted container{% if scenario.devices.size > 1 %}s{% endif %}
```
{%- for device in scenario.devices %}
$ cryptsetup open --type plain -d /dev/urandom {{ device.node }} to_be_wiped{{ forloop.index }}
{%- endfor %}
```

### Wipe the container{% if scenario.devices.size > 1 %}s{% endif %} with zeros
```
{%- for index in (1..scenario.devices.size) %}
$ dd if=/dev/zero of=/dev/mapper/to_be_wiped{{ index }} status=progress
{%- endfor %}
```

### Close the temporary container{% if scenario.devices.size > 1 %}s{% endif %}
```
{%- for index in (1..scenario.devices.size) %}
$ cryptsetup close to_be_wiped{{ index }}
{%- endfor %}
```
