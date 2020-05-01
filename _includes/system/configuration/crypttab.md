{% if template.has_crypttab %}
## Edit the crypttab

##### /etc/crypttab
```
{{ site.data.template[scenario.template].crypttab -}}
```
{% endif %}
