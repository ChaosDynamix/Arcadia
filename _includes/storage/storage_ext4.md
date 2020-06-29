{% assign step_command = scenario.ext4.commands | where: "page", page.title | first %}

## Setup the filesystems

#### EXT4

### Format the {{ txt.include.filesystem_ctx }}

```
{{ step_command.format -}}
```

### Mount the {{ txt.include.filesystem_ctx }}

```
{{ step_command.mount -}}
```

{% if step_command.has_swap %}
### Setup the Swap

```
{{ step_command.swap -}}
```
{%- endif %}
