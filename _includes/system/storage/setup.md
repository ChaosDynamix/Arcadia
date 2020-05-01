{% assign step = site.data.context.lvm[scenario.lvm.template].setup.steps | where: "id", include.step | first %}

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
