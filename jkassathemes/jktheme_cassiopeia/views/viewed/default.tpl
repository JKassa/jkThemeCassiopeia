{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ '' | registerAndUseStyle: 'jktheme.css' }}
{{ '' | registerAndUseScript: 'jktheme.js' }}

{% if viewtmpl != 'component' %}
<!--Header-->
{% if heading %}
<h1 class="mb-3">
	{{ heading }}
	<small class="badge bg-secondary">{{ quantity }}</small>
</h1>
{% else %}
<h2 class="mb-3">
	{{ title }}
	<small class="badge bg-secondary">{{ quantity }}</small>
</h2>
{% endif %}
{% if pretext %}
<!--Pretext-->
<div>
	{{ pretext }}
</div>
{% endif %}
{% endif %}

<!--Products-->
{% if products %}
	{% assign col_md = tpl_params.p_in_row | default_value: 4 %}
	{% assign prod_height = tpl_params.prod_height | default_value: 282 %}
	{% capture prod_height_css %}.cards > li .over-wraper, .cards > li .over-wraper-long { height: {{ prod_height }}px } .cards > li:hover .over-wraper-long { min-height: {{ prod_height }}px }{% endcapture %}
	{{ prod_height_css | addStyleDeclaration }}
	{% capture img_style %}max-width: 100%; max-height: {{ tpl_params.img_height | default_value: 150 }}px;{% endcapture %}
	{% assign show_stock = tpl_params.prod_stock | default_value: 1 %}
	{% assign show_quantity = tpl_params.prod_quantity | default_value: 1 %}
	{% include 'html/products/block' %}
{% else %}
<div class="alert alert-warning">
	{{ '_' | jtext: 'COM_JKASSA_ACCOUNT_VIEWED_NO_PRODUCTS' }}
</div>
{% endif %}

{% if posttext %}
<!--Posttext-->
<div>
	{{ posttext }}
</div>
{% endif %}