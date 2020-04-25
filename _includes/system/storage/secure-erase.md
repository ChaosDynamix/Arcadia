{% assign dev_letters = "a,b,c,d,e" | split: "," %}

## Secure erase the device{% if include.dev_number > 1 %}s{% endif %}
{: .d-inline-block}

IRREVERSIBLE DATA ERASE
{: .label .label-red .mx-2}

Before setting up encryption on a mass storage device, consider securely wiping it first. This consists of overwriting the entire device with a stream of zero bytes or random bytes, and is done for one or both of the following reasons

- Prevent recovery of previously stored data
- Prevent disclosure of usage patterns on the encrypted device

### Create the temporary encrypted container{% if include.dev_number > 1 %}s{% endif %}
```
{%- for letter in dev_letters %}
  {%- if forloop.first and include.dev_number < 2 %}
$ cryptsetup open --type plain -d /dev/urandom /dev/sd{{ letter }} to_be_wiped  
  {%- else %}
$ cryptsetup open --type plain -d /dev/urandom /dev/sd{{ letter }} to_be_wiped{{ forloop.index }}
  {%- endif %}
  {%- if forloop.index == include.dev_number %}
    {%- break %}
  {%- endif %}
{%- endfor %}
```

### Wipe the container{% if include.dev_number > 1 %}s{% endif %} with zeros
```
{%- for letter in dev_letters %}
  {%- if forloop.first and include.dev_number < 2 %}
$ dd if=/dev/zero of=/dev/mapper/to_be_wiped status=progress
  {%- else %}
$ dd if=/dev/zero of=/dev/mapper/to_be_wiped{{ forloop.index }} status=progress
  {%- endif %}
  {%- if forloop.index == include.dev_number %}
    {%- break %}
  {%- endif %}
{%- endfor %}
```

### Close the temporary container{% if include.dev_number > 1 %}s{% endif %}
```
{%- for letter in dev_letters %}
  {%- if forloop.first and include.dev_number < 2 %}
$ cryptsetup close to_be_wiped
  {%- else %}
$ cryptsetup close to_be_wiped{{ forloop.index }}
  {%- endif %}
  {%- if forloop.index == include.dev_number %}
    {%- break %}
  {%- endif %}
{%- endfor %}
```
