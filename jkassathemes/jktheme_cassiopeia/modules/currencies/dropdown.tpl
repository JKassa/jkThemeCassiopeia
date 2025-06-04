{% for currency in currencies %}
{% if currency.id == active_id %}
<button class="btn btn-primary dropdown-toggle {{ class_sfx }}" type="button" id="dropdownCurrencies" data-bs-toggle="dropdown" aria-expanded="false">
	<img src="{{ currency.image }}" alt="{{ currency.code }}" title="{{ currency.title }}" />
	{{ currency.title }} <small>({{ currency.symbol }})</small>
</button>
{% endif %}
{% endfor %}
<ul class="dropdown-menu" aria-labelledby="dropdownCurrencies">
	{% for currency in currencies %}
	{% if currency.id != active_id %}
	<li>
		<a href="{{ currency.url }}" class="dropdown-item">
			<img src="{{ currency.image }}" alt="{{ currency.code }}" title="{{ currency.title }}" />
			{{ currency.title }} <small>({{ currency.symbol }})</small>
		</a>
	</li>
	{% endif %}
	{% endfor %}
</ul>
