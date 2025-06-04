{% assign col_md = tpl_params.f_in_row | default_value: 4 %}
{% assign prod_height = tpl_params.f_prod_height | default_value: 282 %}
{% capture prod_height_css %}.cards > li .over-wraper, .cards > li .over-wraper-long { height: {{ prod_height }}px } .cards > li:hover .over-wraper-long { min-height: {{ prod_height }}px }{% endcapture %}
{{ prod_height_css | addStyleDeclaration }}
{% capture img_style %}max-width: 100%; max-height: {{ tpl_params.f_img_height | default_value: 150 }}px;{% endcapture %}
{% assign show_stock = tpl_params.f_prod_stock | default_value: 1 %}
{% assign show_quantity = tpl_params.f_prod_quantity | default_value: 1 %}
{% assign show_view = tpl_params.f_prod_view | default_value: 1 %}
{% include 'html/products/block' %}