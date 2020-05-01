{% if site.data.template[scenario.template].has_fstab %}
## Edit the fstab

##### /etc/fstab
```
{{ site.data.template[scenario.template].fstab -}}
```
{% endif %}
