## Install the sound server
{: .d-inline-block .mt-2}

PULSEAUDIO
{: .label label-blue}

This section assume that your sound card is working and dont need additional firmware package.

```
$ pacman -S pulseaudio pulseaudio-alsa pavucontrol {% if page.parent == "Xfce4" %}xfce4-pulseaudio-plugin{% endif %}
```
