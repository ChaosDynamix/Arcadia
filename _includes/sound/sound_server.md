## Install pulseaudio sound server

This section assume that your sound card is working and dont need additional firmware package.

```
$ pacman -S pulseaudio pulseaudio-alsa pavucontrol {% if page.parent == "Xfce4" %}xfce4-pulseaudio-plugin{% endif %}
```