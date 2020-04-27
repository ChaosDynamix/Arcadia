{%- assign include_section = site.data.nav.include.sections | where: "title", "installation-media" | first %}

## Prepare the USB flash device

<div class="tab-main">

  {%- for tab in include_section.tabs -%}
    {%- if forloop.first -%}
      <input class="tab-controller" type="radio" name="tab-controller-{{ include_section.title }}" id="tab-controller-{{ include_section.title }}-{{ forloop.index }}" checked />    
    {%- else -%}
      <input class="tab-controller" type="radio" name="tab-controller-{{ include_section.title }}" id="tab-controller-{{ include_section.title }}-{{ forloop.index }}" />
    {%- endif -%}
  {%- endfor -%}

  <nav class="tab-nav">
    {%- for tab in include_section.tabs -%}
      <label class="tab-nav__item tab-nav__item--{{ forloop.index }} text-delta" for="tab-controller-{{ include_section.title }}-{{ forloop.index }}">{{ tab.title }}</label>
    {%- endfor -%}
  </nav>

  {%- for tab in include_section.tabs -%}
    <div class="tab-content tab-content--{{ forloop.index }}">
      {%- capture tab_content %}
{% include {{ tab.include }} %}
      {%- endcapture -%}
{{ tab_content  | markdownify }}
    </div>
  {%- endfor -%}

</div>

### Boot the USB flash device

In order to boot on the USB device, we need to modify the firmware configuration with the firmware setup utility.

If asked during the boot (by pressing a key), you can temporarily select and boot on a device. Don't follow this procedure if you are in this scenario.

1. Turn on your computer
1. When asked, press the key to enter your firmware setup utility
1. Change the boot order and put your USB device in the first position
1. Save changes and reboot
1. Select `boot Arch Linux (X86_64)` or `Arch Linux archiso X86_64 UEFI CD`
