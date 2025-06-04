<table cellpadding="0" cellspacing="0" border="0" width="100%">
	{% if user_name %}
	<tr>
		<td style="font-weight: bold;">{{ '_' | jtext: 'COM_JKASSA_DATA_BUYER_NAME' }}:</td>
		<td>{{ user_name }}</td>
	</tr>
	{% endif %}
	{% if user_email %}
	<tr>
		<td style="font-weight: bold;">{{ '_' | jtext: 'JGLOBAL_EMAIL' }}:</td>
		<td>{{ user_email }}</td>
	</tr>
	{% endif %}
	{% if user_data %}
	{% for user in user_data %}
	<tr>
		<td style="font-weight: bold;">{{ user.name }}</td>
		<td>{{ user.value }}</td>
	</tr>
	{% endfor %}
	{% endif %}
	{% if custom_fields %}
	{% for field in custom_fields %}
	<tr>
		<td style="font-weight: bold;">{{ field.name }}</td>
		<td>{{ field.value }}</td>
	</tr>
	{% endfor %}
	{% endif %}
</table>