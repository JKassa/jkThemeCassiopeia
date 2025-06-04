<div class="jk_alert_dialog">
	<div class="jk_alert_header">
		{{ header }}
	</div>
	<div class="jk_alert_body">
		<div class="row">
			<!--Image-->
			<div class="col-12 col-sm-3">
				<img src="{{ image }}" alt="{{ alias }}" class="img-fluid" />
			</div>
			<div class="col-12 col-sm-9">
				<!--Name-->
				<a href="{{ url }}">
					{{ name }}
				</a>
				{% if sku %}
				<!--SKU (code)-->
				<div class="text-muted small text-end mt-1">
					{{ '_' | jtext: 'COM_JKASSA_SKU' }}: {{ sku }}
				</div>
				{% endif %}
				{% if variants %}
				<!--Variants-->
				<div class="small mt-1">
					{% for variant in variants %}
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
				<div class="mt-1">
					{% if old_cost %}
					<del class="text-muted">{{ old_cost | costDisplay }}{{ currency.symbol }}</del>
					{% endif %}
					<span class="cost">
						<span>{{ cost | costDisplay }}</span>{{ currency.symbol }}
					</span>
					<br>
					{% if quantity %}
					<small class="text-muted">{{ '_' | jtext: 'COM_JKASSA_QUANTITY' }}: {{ quantity }}</small>
					{% endif %}
				</div>
			</div>
		</div>
	</div>
	<div class="jk_alert_footer">
		<a href="#" data-click="close-alert" class="btn btn-primary btn-sm btn-block" title="{{ '_' | jtext: 'COM_JKASSA_CART_CONTINUE_SHOPPING' }}">
			<i class="fas fa-arrow-circle-left"></i>
			{{ '_' | jtext: 'COM_JKASSA_CART_CONTINUE_SHOPPING' }}
		</a>
		{% if event == 'to_cart' %}
		<a href="{{ url_order }}" class="btn btn-info btn-sm btn-block" title="{{ '_' | jtext: 'COM_JKASSA_CHECKOUT' }}">
			<i class="fas fa-shopping-cart"></i>
			{{ '_' | jtext: 'COM_JKASSA_CHECKOUT' }}
		</a>
		{% endif %}
		{% if event == 'to_wishlist' %}
		<a href="{{ url_wishlist }}" class="btn btn-info btn-sm btn-block" title="{{ '_' | jtext: 'COM_JKASSA_YOUR_WISHLIST' }}">
			<i class="fas fa-heart"></i>
			{{ '_' | jtext: 'COM_JKASSA_YOUR_WISHLIST' }}
		</a>
		{% endif %}
		{% if event == 'to_compare' %}
		<a href="{{ url_compare }}" class="btn btn-info btn-sm btn-block" title="{{ '_' | jtext: 'COM_JKASSA_COMPARE_LIST' }}">
			<i class="fas fa-random"></i>
			{{ '_' | jtext: 'COM_JKASSA_COMPARE_LIST' }}
		</a>
		{% endif %}
	</div>
</div>