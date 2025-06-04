{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ '' | registerAndUseStyle: 'jktheme.css' }}
{{ 'popover' | bootstrap5 }}
{{ 'loadAll5' | fontawesome }}

{% comment %}
	HTML code for the popover window.
{% endcomment %}
{% capture popover_html %}
<div class="row {{ class_sfx }}">
	{% if image %}
	<!--Image-->
	<div class="col-3">
		<a href="{{ url_cart }}">
			<img alt="cart" src="{{ image }}" title="{{ image_title }}">
		</a>
	</div>
	{% endif %}
	<div class="{% if image %}col-9{% else %}col-12{% endif %}">
		{% if products %}
		<!--Quantity-->
		<p class="text-center">
			{% capture cart_quantity %}<strong>{{ quantity }}</strong>{% endcapture %}
			{{ 'sprintf' | jtext: 'MOD_JKASSA_CART_COUNT', cart_quantity }}
		</p>
		<!--List products-->
		<ul class="list-unstyled">
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
				{% if product.old_cost %}
				<!--old cost-->
				<del>{{ product.old_cost | costDisplay }}{{ currency.symbol }}</del>
				{% endif %}
				<!--cost-->
				<strong>{{ product.cost | costDisplay }}{{ currency.symbol }}</strong>
				<small>({{ product.quantity }})</small>
				<!--remove product-->
				<a href="#" data-click="remove-product" data-index="{{ product.index }}" title="{{ '_' | jtext: 'MOD_JKASSA_CART_REMOVE' }}">
					<span class="fas fa-times text-danger"></span>
				</a>
			</li>
			{% endfor %}
		</ul>
		<!--Cart total-->
		<p class="text-center">
			{% capture cart_total %}<strong>{{ total | costDisplay }}{{ currency.symbol }}</strong>{% endcapture %}
			{{ 'sprintf' | jtext: 'MOD_JKASSA_CART_AMOUNT', cart_total }}
		</p>
		{% else %}
		<p class="text-muted">
			<em>
				{% if text_empty %}
					{{ text_empty }}
				{% else %}
					{% capture cart_quantity %}<strong>{{ quantity }}</strong>{% endcapture %}
					{{ 'sprintf' | jtext: 'MOD_JKASSA_CART_COUNT', cart_quantity }}
				{% endif %}
			</em>
		</p>
		{% endif %}
	</div>
</div>
{% if products %}
<!--URLs Go to order & Go to cart-->
<div class="card-footer text-center" style="margin: 0 -12px -8px;">
	<a class="btn btn-sm btn-primary" href="{{ url_order }}">
		<i class="fas fa-chevron-right"></i>
		{{ '_' | jtext: 'MOD_JKASSA_CART_ORDER' }}
	</a>
	<a class="btn btn-sm btn-primary" href="{{ url_cart }}">
		<i class="fas fa-shopping-cart"></i>
		{{ '_' | jtext: 'MOD_JKASSA_CART_CART' }}
	</a>
</div>
{% endif %}
{% endcapture %}

<div  id="jk-cart-module{{ mod_id }}" class="jk-cart-module">
	<div class="jk-cart-popover">
		<button type="button" class="btn btn-sm btn-primary position-relative bg-transparent border-0" id="jk-cart-popover" data-bs-toggle="popover">
			<i class="fas fa-shopping-cart fa-2x"></i>
			<span class="badge position-absolute top-0 translate-middle border border-light rounded-circle {% if products %}bg-info{% else %}bg-secondary{% endif %}">
				{{ quantity }}
			</span>
		</button>
	</div>
	<div id="jk-cart-popover-content" style="display: none;">
		{{ popover_html }}
	</div>
	<script type="text/javascript">
		$(document).ready(function () {
			"use strict";
			var options = {
				html: true,
				placement: 'bottom',
				container: 'body',
				sanitize: false,
				title: '{{ image_title }}',
				content: $('#jk-cart-popover-content').html()
			}
			var cartPopover = document.getElementById('jk-cart-popover');
			var popover = new bootstrap.Popover(cartPopover, options);

			$(document).mouseup(function (e) {
			var container = $('.jk-cart-popover');

			if (container.has(e.target).length === 0) {
				$('.jk-cart-popover button').popover('hide');
			}
		});
		});
	</script>
</div>
