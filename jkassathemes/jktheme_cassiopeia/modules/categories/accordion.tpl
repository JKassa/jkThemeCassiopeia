{% for category in categories %}

	{% capture headingId %}headingSlider-{{ category.id }}{% endcapture %}
	{% capture collapseId %}collapseSlider-{{ category.id }}{% endcapture %}
	{% capture selector %}mjkcategories-accordion-{{ category.parent_id }}{% endcapture %}
	{% assign expanded = 'false' %}

	{% if category.active or category.active_parent %}
		{% assign expanded = 'true' %}
		{% assign active = ' show' %}
	{% else %}
		{% assign expanded = '' %}
		{% assign active = '' %}
	{% endif %}
 
<div class="accordion-item">
	<h2 class="accordion-header" id="{{ headingId }}">
		<button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#{{ collapseId }}" aria-expanded="{{ expanded }}" aria-controls="{{ collapseId }}">
			{{ category.title }}
			{% if category.qty_products %}
			<small class="ms-1">
				<i class="badge bg-secondary rounded-pill ">{{ category.qty_products }}</i>
			</small>
			{% endif %}
		</button>
	</h2>
	<div id="{{ collapseId }}" class="accordion-collapse collapse{{ active }}" aria-labelledby="{{ headingId }}" data-bs-parent="#{{ selector }}">
		<div class="accordion-body">
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
			<div style="clear: both;"></div>
			<p class="readmore" style="text-align: right;">
				<a href="{{ category.url }}" class="btn btn-sm btn btn-primary" data-placement="left" title="{{ 'sprintf' | jtext: 'MOD_JKASSA_CATEGORIES_GO_TITLE', category.title }}">
					<span class="fas fa-arrow-right"></span>
					{{ '_' | jtext: 'MOD_JKASSA_CATEGORIES_GO' }}
				</a>
			</p>
		</div>
		
		{% if category.children %}
		{% capture parent %}mjkcategories-accordion-{{ category.id }}{% endcapture %}
		<div class="accordion" id="{{ parent }}">
			{% assign assigns = 'categories,start' | arrayCombine: category.children, start %}
			{{ assigns | layoutRender: 'modules/categories', 'accordion' }}
		</div>
		{% endif %}
		
	</div>
</div>
{% endfor %}
