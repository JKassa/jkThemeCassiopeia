{{ '' | registerAndUseStyle: 'jktheme.css' }}
{{ 'loadAll5' | fontawesome }}

{% if image %}
	{% assign span = 'col-9' %}
{% else %}
	{% assign span = 'col-12' %}
{% endif %}

<div id="jk-cart-module{{ mod_id }}" class="jk-cart-module row mb-2 {{ class_sfx }}">
	{% if image %}
	<div class="col-3 text-center">
		<a href="{{ url_cart }}">
			<img alt="cart" src="{{ image }}" title="{{ image_title }}">
		</a>
	</div>
	{% endif %}
	<div class="{{ span }}" style="white-space: nowrap;">
		{% if products %}
		<div class="form-text text-center">
			{{ 'plural' | jtext: 'MOD_JKASSA_CART_QUANTITY', quantity }}
			- {{ total | costDisplay }}{{ currency.symbol }}
		</div>
		<div class="form-text text-center">
			<a href="{{ url_cart }}" class="btn btn-outline-secondary btn-sm">
				<i class="fas fa-shopping-cart"></i> {{ '_' | jtext: 'MOD_JKASSA_CART_YOUR_CART' }}
			</a>
		</div>
		{% else %}
		<div class="form-text text-center">
			{{ 'plural' | jtext: 'MOD_JKASSA_CART_QUANTITY', quantity }}
		</div>
		{% endif %}
	</div>
</div>
