{% for category in categories %}
<div class="btn-group btn-group-sm {{ trigger }} w-100 mb-2">
	<button type="button" class="btn btn-secondary dropdown-toggle text-start" data-bs-toggle="dropdown" aria-expanded="false">
		{{ category.title }}
		{% if category.qty_products %}
		<small>
			<span class="badge rounded-pill bg-secondary">
				{{ category.qty_products }}
			</span>
		</small>
		{% endif %}
	</button>
	{% if category.children %}
	<ul class="dropdown-menu">
		{% for children in category.children %}
		<li>
			<a class="dropdown-item" href="{{ children.url }}">
				{{ children.title }}
				{% if children.qty_products %}
				({{ children.qty_products }})
				{% endif %}
			</a>
		</li>
		{% endfor %}
	</ul>
	{% endif %}
</div>
{% endfor %}
