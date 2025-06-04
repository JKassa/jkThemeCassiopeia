{{ '' | registerAndUseStyle: 'jktheme.css' }}

<div class="jk-compare-module {{ class_sfx }}">
	{% if image %}
	<!--Compare image-->
	<div class="text-center">
		<a href="{{ url_compare }}">
			<img alt="compare" src="{{ image }}" title="{{ image_title }}">
		</a>
	</div>
	{% endif %}

	{% if categories %}
	<!--Categories-->
	<div class="mt-2">
		{% for category in categories %}
		<div class="card mb-1">
			<div class="card-body">
				<button type="button" class="btn-close float-end" data-click="remove-compare-category" data-indexes="{{ category.indexes }}" title="{{ '_' | jtext: 'MOD_JKASSA_COMPARE_REMOVE' }}" aria-label="Close"></button>
				<h5 class="card-title">
					{{ category.title }}
					<small>({{ 'plural' | jtext: 'MOD_JKASSA_COMPARE_PRODUCTS_QUANTITY', category.products_total }})</small>
				</h5>
				<ol class="card-text">
					{% for product in category.products %}
					<li>
						<a href="{{ product.url }}" target="_top">{{ product.name }}</a>
						{% if product.variants %}
						<!--Variants product-->
						<small>
							{% for variant in product.variants %}
								{{ variant.name }}:
								{% case variant.type %}
									{% when 'radio' %}
									<span class="variant-radio-value">
										{{ variant.value }}
									</span>
									{% when 'color' %}
									<span class="minicolors-swatch">
										<span style="background-color: {{ variant.value }};" title="{{ variant.title }}"></span>
									</span>
									{% when 'texture' %}
									<span class="minicolors-swatch">
										<img src="{{ variant.img }}" alt="{{ variant.alt }}" title="{{ variant.title }}">
									</span>
									{% when 'select' %}
									<span>
										{{ variant.value }}
									</span>
								{% endcase %}
							{% endfor %}
						</small>
						{% endif %}
					</li>
					{% endfor %}
				</ol>
				<hr class="mt-1 m-b-5">
				{% if category.products_total == 1 %}
				<div class="alert alert-info">
					{{ '_' | jtext: 'MOD_JKASSA_COMPARE_NOT_ENOUGH' }}
				</div>
				{% else %}
				<a href="{{ category.url }}" class="btn btn-sm btn btn-primary">
					<span class="fas fa-random"></span>
					{{ '_' | jtext: 'MOD_JKASSA_COMPARE_COMPARE' }}
				</a>
				{% endif %}
			</div>
		</div>
		{% endfor %}
	</div>
	{% else %}
		{% if text_empty %}
		<!--Text empty compare-->
		<div class="alert alert-info mt-2">
			{{ text_empty }}
		</div>
		{% endif %}
	{% endif %}
</div>