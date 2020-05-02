{% if scenario.has_fstab %}
## Edit the fstab

##### /etc/fstab
```
{{ scenario.fstab -}}
```
{% endif %}
