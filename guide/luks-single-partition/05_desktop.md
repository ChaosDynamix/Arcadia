---
title	  : !!str Desktop
parent	  : !!str Luks on single partition
nav_order : !!int 5
permalink : !!str /luks-single-partition/desktop
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% include display/display_driver.md %}
---
{% include display/display_server.md %}
---
{% include sound/sound_server.md %}
---
{% include desktop/desktop_bspwm.md %}
---
{% include desktop/desktop_status-bar.md %}
