{% if products %}
<ul class="list-unstyled">
	{% for product in products %}
	<li>
		<!--Name-->
		<a href="{{ product.url }}" data-click="select-product" data-id="{{ product.id }}">
			{{ product.name }}
		</a>
		{% if product.present %}
		<!--present-->
		+
		<a href="{{ product.present.url }}" target="_blank">
			{{ product.present.name }}
		</a>
		{% endif %}
		{% if product.files %}
		<!--files-->
		<small class="text-muted hasTooltip" title="<strong>{{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}:</strong><br>{{ product.files | join: '<br>' }}">
			<span class="fas fa-download"></span>
		</small>
		{% endif %}
		
		{% if product.introtext %}
		<div class="mt-1" style="font-size: 11px; line-height: 14px">
			{{ product.introtext | truncateDesc: 100 }}
		</div>
		{% endif %}

		{% if product.sku %}
		<!--SKU (code)-->
		<div class="text-muted small text-end mt-1">
			{{ '_' | jtext: 'MOD_JKASSA_WISHLIST_SKU' }}: {{ product.sku }}
		</div>
		{% endif %}

		{% if product.variants %}
		<!--Variants-->
		<div class="small mt-2">
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
		</div>
		{% endif %}
		
		<!--Cost-->
		{% if product.cost %}
		<div class="mt-1">
			{% if product.old_cost %}
			<del class="text-muted">{{ product.old_cost }}{{ currency.symbol }}</del>
			{% endif %}
			<span class="cost">
				<span>{{ product.cost | costDisplay }}</span>{{ currency.symbol }}
			</span>
		</div>
		{% endif %}
		
		{% if show_stock %}
		<!--Stock-->
		<div class="text-muted mt-1 text-end">
			{% case product.stock %} 
				{% when 0 %}
					<!--Not available-->
					{{ '_' | jtext: 'COM_JKASSA_STOCK_0' }}
				{% when '-1' %}
					<!--Available-->
					{{ '_' | jtext: 'COM_JKASSA_STOCK_1' }}
				{% when '-2' %}
					<!--Under the order-->
					{{ '_' | jtext: 'COM_JKASSA_STOCK_2' }}
				{% else %}
					<!--Number-->
					{{ '_' | jtext: 'COM_JKASSA_STOCK' }}: {{ product.stock }}
			{% endcase %}
		</div>
		{% endif %}
		
		{% if show_votes %}
			{% comment %}
				Rating reviews JKassa or Plug-in voting (See: Plugin Manager: Plugins -> jkvotes).
			{% endcomment %}
			{% if reviews_included %}
			<!--Rating reviews-->
			<div class="text-end" title="{{ 'plural' | jtext: 'COM_JKASSA_REVIEWS_COUNT', product.rating_count }}">
				{% for i in (1..5) %}
				{% if product.rating >= i %}
				<span class="fas fa-star" style="color: #F2CD00"></span>
				{% else %}
				<span class="far fa-star" style="color: #CCCCCC"></span>
				{% endif %}
				{% endfor %}
			</div>
			{% else %}
				{% assign votes = product.id | jkcountervotes: product.rating, product.rating_count %}
				{% if votes %}
				<!--Voting-->
				<div class="text-end">
					{{ votes }}
				</div>
				{% endif %}
			{% endif %}
		{% endif %}
		
		{% if btns %}
			<!--Buttons-->
			{% assign mb = 0 %}
			{% include 'modules/wishlist/btns' %}
		{% endif %}
	</li>
	{% endfor %}
</ul>
{% else %}
<div class="alert alert-info">
	{{ text_empty }}
</div>
{% endif %}