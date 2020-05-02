{% if scenario.has_crypttab %}
## Edit the crypttab

##### /etc/crypttab
```
{{ scenario.crypttab -}}
```
{% endif %}
