{{ '' | registerAndUseStyle: 'jktheme.css' }}
{{ 'loadAll5' | fontawesome }}
{{ 'tooltip' | bootstrap5, '.hasTooltip' }}

{% if image %}
	{% assign span = 'col-5' %}
{% else %}
	{% assign span = 'col-6' %}
{% endif %}

<div id="jk-cart-module{{ mod_id }}" class="jk-cart-module card {{ class_sfx }}">
	<ul class="list-unstyled row card-body p-1 m-0">
		{% if image %}
		<!--Cart image-->
		<li class="col-2 text-center">
			<a href="{{ url_cart }}">
				<img alt="cart" src="{{ image }}" title="{{ image_title }}">
			</a>
		</li>
		{% endif %}
		<li class="{{ span }}">
			{% if products %}
			<!--List products-->
			<ol>
				{% for product in products %}
				<li>
					<a href="{{ product.url }}">
						{{ product.name }}
					</a>

					{% if product.variants %}
					<br>
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

					<br>
					{% if product.old_cost | costDisplay %}
					<!--old cost-->
					<del class="text-muted">{{ product.old_cost }}{{ currency.symbol }}</del>
					{% endif %}
					<!--cost-->
					<strong>{{ product.cost | costDisplay }}{{ currency.symbol }}</strong>
					<small>({{ product.quantity }})</small>
					<!--remove product-->
					<a href="javascript:;" data-click="remove-product" data-index="{{ product.index }}" class="hasTooltip" title="{{ '_' | jtext: 'MOD_JKASSA_CART_REMOVE' }}"><span class="fas fa-times text-danger" style="font-size:10px"></span></a>
				</li>
				{% endfor %}
			</ol>
			{% else %}
			{% if text_empty %}
			<!--Text empty cart-->
			<div class="alert alert-info mt-2">
				{{ text_empty }}
			</div>
			{% endif %}
			{% endif %}
		</li>
		<li class="{{ span }}">
			<!--Quantity-->
			<div class="form-text text-center">
				{% capture cart_quantity %}<strong>{{ quantity }}</strong>{% endcapture %}
				{{ 'sprintf' | jtext: 'MOD_JKASSA_CART_COUNT', cart_quantity }}
			</div>
			{% if products %}
			<!--Cart total-->
			<div class="form-text text-center">
				{% capture cart_total %}<strong>{{ total | costDisplay }}{{ currency.symbol }}</strong>{% endcapture %}
				{{ 'sprintf' | jtext: 'MOD_JKASSA_CART_AMOUNT', cart_total }}
			</div>
			<div class="form-text text-center">
				<!--URL cart-->
				<a class="btn btn-sm btn btn-primary mt-1" href="{{ url_cart }}">
					<i class="fas fa-shopping-cart"></i> {{ '_' | jtext: 'MOD_JKASSA_CART_YOUR_CART' }}
				</a>
				<!--URL order-->
				<a class="btn btn-sm btn-primary mt-1" href="{{ url_order }}">
					<i class="fas fa-arrow-right"></i> {{ '_' | jtext: 'MOD_JKASSA_CART_CART_ORDER' }}
				</a>
			</div>
			{% endif %}
		</li>
	</ul>
</div>
