{% capture img_style %}max-width: 100%; max-height: {{ tpl_params.f_img_height | default_value: 150 }}px;{% endcapture %}
{% assign show_stock = tpl_params.f_prod_stock | default_value: 1 %}
{% assign show_quantity = tpl_params.f_prod_quantity | default_value: 1 %}
{% assign show_view = tpl_params.f_prod_view | default_value: 1 %}
{% include 'html/products/list' %}