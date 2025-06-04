<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<td style="font-weight: bold; width: 30%;">
			{{ '_' | jtext: 'COM_JKASSA_DELIVERY_METHOD'}}:
		</td>
		<td>{{ delivery.label }}</td>
	</tr>
	{% if delivery.tooltip %}
	<tr>
		<td style="font-weight: bold;">
			{{ '_' | jtext: 'COM_JKASSA_DELIVERY_DESC'}}:
		</td>
		<td>{{ delivery.tooltip }}</td>
	</tr>
	{% endif %}
	<tr>
		<td style="font-weight: bold;">
			{{ '_' | jtext: 'COM_JKASSA_DELIVERY_COST'}}:
		</td>
		<td>
			{% if delivery.tariff %}
				{{ '_' | jtext: 'COM_JKASSA_TARIFF' }}
			{% else %}
				{% if delivery.cost == 0 %}
					{{ '_' | jtext: 'COM_JKASSA_FREE'}}
				{% else %}
					{{ delivery.cost | costDisplay }}{{ currency.symbol }}
				{% endif %}
			{% endif %}
		</td>
	</tr>
	{% if delivery.free %}
	<tr>
		<td style="font-weight: bold;">
			{{ '_' | jtext: 'COM_JKASSA_DELIVERY_FREE'}}:
		</td>
		<td>{{ delivery.free | costDisplay }}{{ currency.symbol }}</td>
	</tr>
	{% endif %}
	{% if delivery_custom %}
		{% for custom in delivery_custom %}
		<tr>
			<td style="font-weight: bold;">{{ custom.name }}</td>
			<td>{{ custom.value }}</td>
		</tr>
		{% endfor %}
	{% endif %}
</table>
