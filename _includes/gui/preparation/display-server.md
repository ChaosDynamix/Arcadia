{%- assign include_section = site.data.nav.include.sections | where: "title", "display-server" | first %}

## Install a display server

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
