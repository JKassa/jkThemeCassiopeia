{% for currency in currencies %}
<option value="{{ currency.id }}"{% if currency.active %} selected{% endif %}>
	{{ currency.title }} ({{ currency.symbol }})
</option>
{% endfor %}
