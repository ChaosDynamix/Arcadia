{% case scenario.lvm.template %}
  {% when "luks-lvm" %}
{% include system/storage/lvm/luks-lvm.md step=include.step %}
  {% when "lvm-luks" %}
{% include system/storage/lvm/lvm-luks.md %}
{% endcase %}
