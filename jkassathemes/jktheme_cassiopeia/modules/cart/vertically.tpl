{{ '' | registerAndUseStyle: 'jktheme.css' }}
{{ 'loadAll5' | fontawesome }}
{{ 'tooltip' | bootstrap5, '.hasTooltip' }}

<div id="jk-cart-module{{ mod_id }}" class="jk-cart-module row {{ class_sfx }}">
	<div class="col-12">
		<div class="card p-0">
			{% if image %}
			<!--Cart image-->
			<div class="card-header text-center">
				<a href="{{ url_cart }}">
					<img alt="cart" src="{{ image }}" title="{{ image_title }}">
				</a>
			</div>
			{% endif %}
			<div class="card-body pt-0 pb-0">
				{% if products %}
				<!--Products-->
				{% for product in products %}
				<div class="row jk-table-body">
					<!--Product Image-->
					<div class="col-4">
						{% if product.discount %}
						<ul class="stickers">
							<li>
								<span class="product-label">-{{ product.discount }}</span>
							</li>
						</ul>
						{% endif %}
						<a href="{{ product.url }}" target="_blank">
							<img {{ product.image | img_exists: '88x127' }} alt="{{ product.alias }}" class="img-fluid" />
						</a>
					</div>
					<!--Product Information-->
					<div class="col-8">
						<!--Name-->
						<h6 class="card-subtitle mt-1">
							<a href="{{ product.url }}" target="_blank">
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
								<i class="fas fa-download"></i>
							</small>
							{% endif %}
							<!--remove product-->
							<a href="javascript:;" data-click="remove-product" data-index="{{ product.index }}" class="hasTooltip" title="{{ '_' | jtext: 'MOD_JKASSA_CART_REMOVE' }}"><i class="fas fa-times text-danger" style="font-size:10px"></i></a>
						</h6>
						{% if product.sku %}
						<!--SKU (code)-->
						<div class="text-muted text-end small mt-2">
							{{ '_' | jtext: 'MOD_JKASSA_CART_SKU' }}: {{ product.sku }}
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
						{% if product.old_cost %}
						<!--Old cost-->
						<div class="mt-2">
							<del class="text-muted">{{ product.old_cost | costDisplay }}{{ currency.symbol }}</del>
						</div>
						{% endif %}
					</div>
					<!--Product price-->
					<div class="col-12">
						<div class="row small">
							<div class="col-5 text-start">
								<!--cost-->
								{{ product.cost | costDisplay }}{{ currency.symbol }}
							</div>
							<div class="col-2 text-center" style="white-space: nowrap;">
								&times;{{ product.quantity }}
							</div>
							<div class="col-5 text-end">
								<!--Price-->
								{{ product.price | costDisplay }}{{ currency.symbol }}
							</div>
						</div>
					</div>
				</div>
				{% endfor %}
				{% else %}
				<!--Text empty cart-->
				<p class="mt-2">
					{% if text_empty %}
						{{ text_empty }}
					{% else %}
						{{ '_' | jtext: 'MOD_JKASSA_CART_YOUR_CART_EMPTY' }}
					{% endif %}
				</p>
				{% endif %}
			</div>
			{% if products %}
			<div class="card-footer text-center">
				<!-- Total price -->
				<p>
					{% capture cart_total %}<strong>{{ total | costDisplay }}{{ currency.symbol }}</strong>{% endcapture %}
					{{ 'sprintf' | jtext: 'MOD_JKASSA_CART_AMOUNT', cart_total }}
				</p>
				<!--URL order & cart-->
				<a class="btn btn-sm btn-primary" href="{{ url_order }}">
					<i class="fas fa-arrow-right"></i> {{ '_' | jtext: 'MOD_JKASSA_CART_ORDER' }}
				</a>
				<a class="btn btn-sm btn btn-primary" href="{{ url_cart }}">
					<i class="fas fa-shopping-cart"></i> {{ '_' | jtext: 'MOD_JKASSA_CART_CART' }}
				</a>
			</div>
			{% endif %}
		</div>
	</div>
</div>
