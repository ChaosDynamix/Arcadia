{% assign step_elements = scenario.ext4.elements | where: "page", page.title %}
{% assign root = step_elements | where: "label", "ROOT" | first %}
{% assign swap = step_elements | where: "label", "SWAP" | first %}
{% assign dir_elements = step_elements | where: "has_dir", true %}

## Setup the {{ txt.include.filesystem_ctx }}

| Node               | Label               | Mountpoint               |
| :----------------- | :------------------ | :----------------------- |
{%- for element in step_elements %}
| {{ element.node }} | {{ element.label }} | {{ element.mountpoint }} |
{%- endfor %}

### Format the {{ txt.include.filesystem_ctx }}

```
{%- for element in step_elements %}
  {%- unless element.label == "SWAP" %}
$ mkfs.ext4 -L {{ element.label }} {{ element.node }}
  {%- endunless %}
{%- endfor %}
```

### Mount the {{ txt.include.filesystem_ctx }}

```
{%- unless root == nil %}
$ mount {{ root.node }} {{ root.mountpoint }}
{%- endunless %}
{%- unless dir_elements.size == 0 %}
  {%- unless page.title == "Configuration" %}
$ mkdir /mnt/{% if dir_elements.size > 1 %}{ {{- dir_elements | map: "dir" | join: "," -}} }{% else %}{{ dir_elements[0].dir }}{% endif %}
  {%- endunless %}
  {%- for element in dir_elements %}
$ mount {{ element.node }} {{ element.mountpoint }}
  {%- endfor %}
{%- endunless %}
```

{%- unless swap == nil %}
### Setup the Swap

```
$ mkswap -L {{ swap.label }} {{ swap.node }}
$ swapon {{ swap.node }}
```
{%- endunless %}
