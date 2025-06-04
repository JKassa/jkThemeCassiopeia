<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<td style="font-weight: bold;">{{ '_' | jtext: 'COM_JKASSA_PAYMENT_METHOD' }}:</td>
		<td>{{ syst_name }}</td>
	</tr>
	<tr>
		<td style="font-weight: bold;">{{ '_' | jtext: 'COM_JKASSA_SHOP_ID' }}:</td>
		<td>{{ syst_id }}</td>
	</tr>
	<tr>
		<td style="font-weight: bold;">{{ '_' | jtext: 'COM_JKASSA_ORDER_NUMBER' }}:</td>
		<td>{{ pm_number }}</td>
	</tr>
	<tr>
		<td style="font-weight: bold;">{{ '_' | jtext: 'COM_JKASSA_ORDER_ID' }}:</td>
		<td>{{ order_id }}</td>
	</tr>
	<tr>
		<td style="font-weight: bold;">{{ '_' | jtext: 'COM_JKASSA_ORDER_TOTALL' }}:</td>
		<td>{{ pm_in_total | costDisplay }}{{ currency.symbol }}</td>
	</tr>
	<tr>
		<td style="font-weight: bold;">{{ '_' | jtext: 'COM_JKASSA_ORDER_CREATED' }}:</td>
		<td>{{ 'date' | jhtml: created, 'd F Y H:i' }}</td>
	</tr>
	<tr>
		<td style="font-weight: bold;">{{ '_' | jtext: 'COM_JKASSA_ORDER_DESC' }}:</td>
		<td>{{ pm_desc }}</td>
	</tr>
	<tr>
		<td style="font-weight: bold;">{{ '_' | jtext: 'COM_JKASSA_ORDER_STATE' }}:</td>
		<td>
			{{ order_status }}
			{% if description %}
			<br>
			<small><em>* {{ description }}</em></small>
			{% endif %}
		</td>
	</tr>
	{% if syst_extra %}
	{% for extra in syst_extra %}
	<tr>
		<td style="font-weight: bold;">{{ extra.name }}</td>
		<td>{{ extra.value }}</td>
	</tr>
	{% endfor %}
	{% endif %}
</table>