{{ 'dropdown' | bootstrap5: '.dropdown' }}

{% comment %}
	Parameters of the category.
{% endcomment %}
{% assign span = tpl_params.cats_span | default_value: 6 %}
{% assign height = tpl_params.cats_height | default_value: 320 %}
{% assign img_height = tpl_params.cats_img_height | default_value: 213 %}
{% assign cats_desc_length = tpl_params.cats_desc_length | default_value: 0 %}

<!--List categories-->
<div class="row list-categories">
    {% for category in categories %}
    <div class="col-md-{{ span }} col-12">
		<div class="card p-2" style="height:{{ height }}px; position: relative;">
			<!--Title category and URL category-->
			<h4 class="card-title">
				<a href="{{ category.url }}">
					{{ category.title }}
				</a>
			</h4>
			<!--Image category-->
			<div class="text-center">
				<a href="{{ category.url }}">
					<img {{ category.image | img_exists: '321x213' }} style="max-width: 100%; max-height: {{ img_height }}px;"{% if category.image_alt != 'false' %} alt="{{ category.image_alt }}"{% endif %} />
				</a>
			</div>
			{% if category.desc and cats_desc_length %}
			<!--Description category-->
			<small class="card-text mt-1">
				{{ category.desc | truncateDesc: cats_desc_length }}
			</small>
			{% endif %}
			<div style="position:absolute; bottom:10px; left: 10px; right: 10px;">
				{% if category.children %}
				<!--Subcategories-->
				<div class="dropdown">
					<a href="#" class="btn btn-outline-secondary btn-sm dropdown-toggle" id="drop{{ category.id }}" data-bs-toggle="dropdown" aria-expanded="false">
						{{ '_' | jtext: 'JGLOBAL_SUBCATEGORIES' }}
					</a>
					<ul class="dropdown-menu" aria-labelledby="drop{{ category.id }}">
						{{ category.children }}
					</ul>
				</div>
				{% else %}
				<!--Products Quantity & Link to the category-->
				<a href="{{ category.url }}" class="btn btn-outline-secondary btn-sm" title="{{ '_' | jtext: 'COM_JKASSA_QTY' }}: {{ category.num }}">
					<span class="badge bg-secondary">{{ category.num }}</span>
					{{ '_' | jtext: 'COM_JKASSA_READ_MORE_CAT' }}
				</a>
				{% endif %}
			</div>
		</div>
    </div>
    {% endfor %}
</div>