{% assign step = scenario.steps | where: "id", include.step | first %}
{% assign config = scenario.filesystem.configs | where: "step_id", step.id | first %}

## Setup the {{ step.filesystem_ctx }}

### Format the {{ step.filesystem_ctx }}

```
{{ config.format_cmd -}}
```

### Mount the {{ step.filesystem_ctx }}

```
{{ config.mount_cmd -}}
```

{% if config.has_swap %}
### Setup the Swap

```
{{ config.swap_cmd -}}
```
{% endif %}
