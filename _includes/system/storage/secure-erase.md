{% assign profile = include.profile %}

## Secure erase the device{% if profile.plural %}s{% endif %}
{: .d-inline-block}

IRREVERSIBLE DATA ERASE
{: .label .label-red .mx-2}

Before setting up encryption on a mass storage device, consider securely wiping it first. This consists of overwriting the entire device with a stream of zero bytes or random bytes, and is done for one or both of the following reasons

- Prevent recovery of previously stored data
- Prevent disclosure of usage patterns on the encrypted device

### Create the temporary encrypted container{% if profile.plural %}s{% endif %}
```
{{ profile.command.create -}}
```

### Wipe the container{% if profile.plural %}s{% endif %} with zeros
```
{{ profile.command.wipe -}}
```

### Close the temporary container{% if profile.plural %}s{% endif %}
```
{{ profile.command.close -}}
```
