<title>{{ shop_name }} - {{ '_' | jtext: 'COM_JKASSA_ORDER_STATUS_2' }}</title>
{{ 'sprintf' | jtext: 'FILES_JKTHEME_CASSIOPEIA_EMAIL_HELLO', admin_name }}.

{{ 'sprintf' | jtext: 'FILES_JKTHEME_CASSIOPEIA_EMAIL_NEW_ORDER', shop_name }}

{{ '_' | jtext: 'COM_JKASSA_ORDER_DATA' }}
{{ '_' | jtext: 'COM_JKASSA_PAYMENT_METHOD' }}: {{ syst_name }}
{{ '_' | jtext: 'COM_JKASSA_SHOP_ID' }}: {{ syst_id }}
{{ '_' | jtext: 'COM_JKASSA_ORDER_NUMBER' }}: {{ pm_number }}
{{ '_' | jtext: 'COM_JKASSA_ORDER_ID' }}: {{ order_id }}
{{ '_' | jtext: 'COM_JKASSA_ORDER_TOTALL' }}: {{ pm_in_total | costDisplay }}{{ currency.symbol }}
{{ '_' | jtext: 'COM_JKASSA_ORDER_CREATED' }}: {{ 'date' | jhtml: created, 'd F Y H:i' }}
{{ '_' | jtext: 'COM_JKASSA_ORDER_DESC' }}: {{ pm_desc }}
{{ '_' | jtext: 'COM_JKASSA_ORDER_STATE' }}: {{ order_status }}

{{ '_' | jtext: 'COM_JKASSA_DATA_BUYER' }}
{{ '_' | jtext: 'COM_JKASSA_DATA_BUYER_NAME' }}: {{ user_name }}
{{ '_' | jtext: 'JGLOBAL_EMAIL' }}: {{ user_email }}

{{ '_' | jtext: 'FILES_JKTHEME_CASSIOPEIA_EMAIL_NEW_ORDER_DESC_1' }}
{{ '_' | jtext: 'FILES_JKTHEME_CASSIOPEIA_EMAIL_NEW_ORDER_DESC_2' }}
{{ order_pending }}

--
* {{ '_' | jtext: 'FILES_JKTHEME_CASSIOPEIA_EMAIL_FOOTER' }}