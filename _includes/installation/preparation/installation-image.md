{% assign installation_image_pages = library_collection.docs | where: "category", "installation image" %}

## Download Arch Linux official ISO

{% for installation_image_page in installation_image_pages %}

### [{{ installation_image_page.title }}]({{ installation_image_page.url | absolute_url | append: include.query }})

{{ installation_image_page.description }}

{% endfor %}
