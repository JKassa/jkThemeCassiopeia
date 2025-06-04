<ul class="list-unstyled">
	{% for manufacturer in manufacturers %}
	<li class="d-flex align-items-center mb-2">
		{% if manufacturer.thumbnail %}
		<div class="flex-shrink-0">
			<img src="{{ manufacturer.thumbnail }}" alt="{{ manufacturer.alias }}">
		</div>
		{% endif %}
		<div class="flex-grow-1 ms-3">
			<h5>
				<a href="{{ manufacturer.url }}">
					{{ manufacturer.name }}
				</a>
				{% if products %}
				<small class="float-end text-muted mt-2">
					{{ 'plural' | jtext: 'MOD_JKASSA_MANUFACTURERS_PRODUCTS_QUANTITY', manufacturer.products_quantity }}
				</small>
				{% endif %}
			</h5>
			{% if manufacturer.introtext %}
			<div>
				{{ manufacturer.introtext | truncateDesc: 100 }}
			</div>
			{% endif %}
			{% if readmore %}
			<a class="btn btn-link btn-sm" href="{{ manufacturer.url }}">
				{{ '_' | jtext: 'JGLOBAL_READ_MORE' }} <i class="fas fa-arrow-right"></i>
			</a>
			{% endif %}
		</div>
	</li>
	{% endfor %}
</ul>

{% if all_url %}
<div class="d-grid gap-2">
	<a class="btn btn-primary" href="{{ all_url }}" title="{{ '_' | jtext: 'MOD_JKASSA_MANUFACTURERS_ALL_CATEGORIES_TITLE' }}">
		{{ '_' | jtext: 'MOD_JKASSA_MANUFACTURERS_ALL_CATEGORIES' }}
	</a>
</div>
{% endif %}
