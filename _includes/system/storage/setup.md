{% assign profile = site.data.lvm.profile[scenario.lvm.template] %}
{% assign step = profile.setup.steps | where: "id", include.step | first %}

## Setup the {{ step.context }}

### Formating

```
{{ step.format -}}
```

### Mounting

```
{{ step.mount -}}
```

{% if step.has_swap %}
### Swap
```
{{ step.swap -}}
```
{% endif %}
