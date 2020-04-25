{% assign profile = include.profile %}

## Setup the Keyfile for the container{% if profile.plural %}s{% endif %}

### Create the keys directory
```
$ mkdir -m 700 /etc/luks-keys
```

### Generate the key{% if profile.plural %}s{% endif %}
```
{{ profile.command.generate -}}
```

### Change the permissions
```
{{ profile.command.chmod -}}
```

### Add the key{% if profile.plural %}s{% endif %} in the container{% if profile.plural %}s{% endif %}
```
{{ profile.command.add -}}
```

{% if profile.plural %}
### Add entries to the initramfs crypttab

##### /etc/crypttab.initramfs
```
{{ profile.command.crypttab -}}
```
{% endif %}
