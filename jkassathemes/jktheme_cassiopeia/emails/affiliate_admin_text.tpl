<title>{{ shop_name }} - {{ '_' | jtext: 'FILES_JKTHEME_CASSIOPEIA_EMAIL_AFFILIATE_PAYMENT_COMMISSIONS' }}</title>
{{ 'sprintf' | jtext: 'FILES_JKTHEME_CASSIOPEIA_EMAIL_HELLO', admin_name }}.
{% assign sum_cy = sum | append: currency.symbol %}
{{ 'sprintf' | jtext: 'FILES_JKTHEME_CASSIOPEIA_EMAIL_AFFILIATE_COMMISSION_AVAILABLE', user_name, sum_cy }}

--
* {{ '_' | jtext: 'FILES_JKTHEME_CASSIOPEIA_EMAIL_FOOTER' }}