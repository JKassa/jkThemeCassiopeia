{% for category in categories %}
<li class="level_{{ category.level }}{% if category.active %} active{% endif %}">
	<a href="{{ category.url }}" class="text-decoration-none position-relative">
		{{ category.title }}
		{% if category.qty_products %}
		<small>
			<span class="badge rounded-pill bg-secondary">
				{{ category.qty_products }}
			</span>
		</small>
		{% endif %}
	</a>
	{% if category.image %}
	<a href="{{ category.url }}">
		<img src="{{ category.image }}" alt="{{ category.alias }}" style="display: block; max-height: 50px; max-width: 50px;" />
	</a>
	{% endif %}
	{% if category.description %}
	<p style="font-size: 10px; line-height: 10px;">
		{{ category.description | truncateDesc: 100 }}
	</p>
	{% endif %}
	{% if category.children %}
	<ul class="list-unstyled ">
		{% assign assigns = 'categories' | arrayCombine: category.children %}
		{{ assigns | layoutRender: 'modules/categories', 'list' }}
	</ul>
	{% endif %}
</li>
{% endfor %}