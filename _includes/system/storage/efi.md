{%- assign profile = include.profile %}

## Setup the EFI partition{% if profile.plural %}s{% endif %}
{: .d-inline-block}

UEFI
{: .label .label-blue .ml-2}

### Format the partition{% if profile.plural %}s{% endif %}
{: .mt-0}

```
{{ profile.command.format -}}
```

### Mount the partition{% if profile.plural %}s{% endif %}

```
{{ profile.command.mount -}}
```
