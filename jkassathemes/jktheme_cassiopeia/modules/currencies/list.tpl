{% for currency in currencies %}
<a class="list-group-item list-group-item-action{% if currency.active %} active{% endif %}" href="{{ currency.url }}">
	<img src="{{ currency.image }}" alt="{{ currency.code }}" title="{{ currency.title }}" />
	{{ currency.title }} <small>({{ currency.symbol }})</small>
</a>
{% endfor %}
