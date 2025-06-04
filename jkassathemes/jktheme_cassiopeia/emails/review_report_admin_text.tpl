<title>{{ shop_name }} - {{ '_' | jtext: 'FILES_JKTHEME_CASSIOPEIA_EMAIL_REVIEW_REPORT' }}</title>
{{ 'sprintf' | jtext: 'FILES_JKTHEME_CASSIOPEIA_EMAIL_HELLO', admin_name }}

{{ 'sprintf' | jtext: 'FILES_JKTHEME_CASSIOPEIA_EMAIL_REVIEW_REPORT_DESC', shop_name, product_name }}

{{ '_' | jtext: 'COM_JKASSA_DATA_BUYER_NAME' }}: {{ user_name }}
{{ '_' | jtext: 'JGLOBAL_EMAIL' }}: {{ user_email }}
IP: {{ user_ip }}

{{ '_' | jtext: 'MESSAGE' }}:
{{ review }}

{{ '_' | jtext: 'COM_JKASSA_SHOW_SHOP' }}: {{ product_url }}

--
* {{ '_' | jtext: 'FILES_JKTHEME_CASSIOPEIA_EMAIL_FOOTER' }}