<title>{{ shop_name }} - {{ '_' | jtext: 'FILES_JKTHEME_CASSIOPEIA_EMAIL_ORDER_CHANGED' }}</title>
{{ 'sprintf' | jtext: 'FILES_JKTHEME_CASSIOPEIA_EMAIL_HELLO', admin_name }}

{{ 'sprintf' | jtext: 'FILES_JKTHEME_CASSIOPEIA_EMAIL_ORDER_CHANGED_DESC', shop_name, pm_number }}
{{ '_' | jtext: 'COM_JKASSA_ORDER_STATE' }}: {{ order_status }}.

--
* {{ '_' | jtext: 'FILES_JKTHEME_CASSIOPEIA_EMAIL_FOOTER' }}