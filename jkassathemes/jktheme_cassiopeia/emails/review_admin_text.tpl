<title>{{ shop_name }} - {{ '_' | jtext: 'FILES_JKTHEME_CASSIOPEIA_EMAIL_NEW_REVIEW' }}</title>
{{ 'sprintf' | jtext: 'FILES_JKTHEME_CASSIOPEIA_EMAIL_HELLO', admin_name }}

{{ 'sprintf' | jtext: 'FILES_JKTHEME_CASSIOPEIA_EMAIL_NEW_REVIEW_DESC', shop_name, product_url, '', product_name }}

{{ '_' | jtext: 'COM_JKASSA_DATA_BUYER_NAME' }}: {{ user_name }}
{{ '_' | jtext: 'JGLOBAL_EMAIL' }}: {{ user_email }}
IP: {{ user_ip }}

{{ '_' | jtext: 'COM_JKASSA_REVIEWS_REVIEW' }}:
{{ review }}

{{ '_' | jtext: 'COM_JKASSA_SHOW_SHOP' }}: {{ product_url }}

-- {{ '_' | jtext: 'FILES_JKTHEME_CASSIOPEIA_EMAIL_MODERATION' }} --
{% if moderation %}{{ '_' | jtext: 'JGLOBAL_FIELD_PUBLISH_UP_LABEL' }}: {{ review_publish }}{% endif %}
{{ '_' | jtext: 'JACTION_DELETE' }}: {{ review_delete }}

--
* {{ '_' | jtext: 'FILES_JKTHEME_CASSIOPEIA_EMAIL_FOOTER' }}