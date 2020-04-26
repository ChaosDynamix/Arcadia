{%- assign scenario_title = site.data.system.storage.secure-erase.map[page.parent_uuid] %}
{%- assign scenario = site.data.system.storage.secure-erase.scenario[scenario_title] %}

## Secure erase the device{% if scenario.plural %}s{% endif %}
{: .d-inline-block}

IRREVERSIBLE DATA ERASE
{: .label .label-red .mx-2}

Before setting up encryption on a mass storage device, consider securely wiping it first. This consists of overwriting the entire device with a stream of zero bytes or random bytes, and is done for one or both of the following reasons

- Prevent recovery of previously stored data
- Prevent disclosure of usage patterns on the encrypted device

### Create the temporary encrypted container{% if scenario.plural %}s{% endif %}
```
{%- for dev in scenario.devices %}
$ cryptsetup open --type plain -d /dev/urandom {{ dev.node }} {{ dev.mapper }}
{%- endfor %}
```

### Wipe the container{% if scenario.plural %}s{% endif %} with zeros
```
{%- for dev in scenario.devices %}
$ dd if=/dev/zero of=/dev/mapper/{{ dev.mapper }} status=progress
{%- endfor %}
```

### Close the temporary container{% if scenario.plural %}s{% endif %}
```
{%- for dev in scenario.devices %}
$ cryptsetup close {{ dev.mapper }}
{%- endfor %}
```
