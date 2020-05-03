{% if scenario.has_raid %}
  {% case scenario.raid.level %}
    {% when 1 %}
{% include system/storage/raid/raid1.md %}
    {% when 0 %}
{% include system/storage/raid/raid0.md %}
  {% endcase %}
{% endif %}
