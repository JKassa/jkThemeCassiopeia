{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ '' | registerAndUseStyle: 'jktheme.css' }}
{{ '' | registerAndUseScript: 'jktheme.js' }}
{{ 'tooltip' | bootstrap5, '.hasTooltip' }}
{{ 'loadAll5' | fontawesome }}

{% if viewtmpl != 'component' %}
<!--Header-->
{% if heading %}
<h1 class="mb-3">
	{{ heading }}
	<small class="badge bg-secondary">{{ quantity }}</small>
</h1>
{% else %}
<h2 class="mb-3">
	{{ title }}
	<small class="badge bg-secondary">{{ quantity }}</small>
</h2>
{% endif %}
{% if pretext %}
<!--Pretext-->
<div>
	{{ pretext }}
</div>
{% endif %}
{% endif %}

{% if products %}
	{% assign col_md = tpl_params.p_in_row | default_value: 4 %}
	{% assign prod_height = tpl_params.prod_height | default_value: 282 %}
	{% capture prod_height_css %}.cards > li .over-wraper, .cards > li .over-wraper-long { height: {{ prod_height }}px } .cards > li:hover .over-wraper-long { min-height: {{ prod_height }}px }{% endcapture %}
	{{ prod_height_css | addStyleDeclaration }}
	{% capture img_style %}max-width: 100%; max-height: {{ tpl_params.img_height | default_value: 150 }}px;{% endcapture %}
	{% assign show_stock = tpl_params.prod_stock | default_value: 1 %}
	{% assign show_quantity = tpl_params.prod_quantity | default_value: 1 %}
<!--Products-->
<div class="block-products">
	<ul class="cards list-unstyled row">
		{% for product in products %}
		<li class="col-12 col-sm-6 col-md-{{ col_md }} position-relative">
			{% if product.stickers %}
			<!-- Stickers -->
			<ul class="stickers">
				{% if product.new %}
				<li>
					<span class="product-label product-label_new">NEW</span>
				</li>
				{% endif %}
				{% if product.hit %}
				<li>
					<span class="product-label product-label_hit">HIT</span>
				</li>
				{% endif %}
				{% if product.discount %}
				<li>
					{% if product.discount_image %}
					<img {{ product.discount_image | img_exists: '30x30' }} alt="{{ product.discount }}" title="{{ product.discount_desc }} - {{ product.discount }}">
					{% else %}
					<span class="product-label" title="{{ product.discount_desc }} - {{ product.discount }}">-{{ product.discount }}</span>
					{% endif %}
				</li>
				{% endif %}
			</ul>
			{% endif %}
			<div class="over-wraper">
				<div class="card over-wraper-long">
					<div class="product-image">
						{% if product.manufacturer %}
						<!--Manufacturer name and miniature-->
						<div class="position-absolute top-0 end-0">
							<img {{ product.manufacturer.thumbnail | img_exists: '30x30' }} class="manufacturer hasTooltip" alt="{{ product.manufacturer.alias }}" title="{{ product.manufacturer.name }}">
						</div>
						{% endif %}

						<!--Product Image-->
						<div class="text-center">
							{% assign jkmedialist = product.image | jkmedialist: product.images, '', img_style, product.url %}
							{% if jkmedialist %}
								{{ jkmedialist }}
							{% else %}
							<a href="{{ product.url }}" target="_top">
								<img {{ product.image | img_exists: '104x150' }} alt="{{ product.alias }}" style="{{ img_style }}" />
							</a>
							{% endif %}
						</div>

						{% if product.present %}
						<!--Share (Product as a present)-->
						<div class="share hasTooltip" title="{{ 'tooltipText' | jhtml: product.present.name, product.present.desc }}">
							<div class="sharetitle">
								{{ '_' | jtext: 'COM_JKASSA_GIFT' }}
							</div>
							<div class="sharedesc">
								<a href="{{ product.present.url }}">
									<img {{ product.present.image | img_exists: '50x50' }} alt="{{ product.present.name }}">
								</a>
							</div>
						</div>
						{% endif %}
					</div>

					<div class="card-body p-2">
						<!--Name and URL of the product-->
						<h5 class="card-title">
							<a href="{{ product.url }}" target="_top">
								{{ product.name }}
							</a>
							{% if product.files %}
							<!--Files-->
							<small class="text-muted hasTooltip" title="<strong>{{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}:</strong><br>{{ product.files | join: '<br>' }}">
								<i class="fas fa-download fa-xs"></i>
							</small>
							{% endif %}
						</h5>

						<!--Price product-->
						<div class="mt-2">
							{% if product.old_cost %}
							<!--old cost-->
							<del class="text-muted">{{ product.old_cost }}</del>
							{% endif %}
							<!--cost-->
							<span class="cost">
								<span>{{ product.cost | costDisplay }}</span>{{ currency.symbol }}
							</span>
							{% if product.vat %}
							<!--vat-->
							<span class="text-muted small">
								({{ 'sprintf' | jtext: 'COM_JKASSA_VAT_INCL', product.vat }})
							</span>
							{% endif %}
						</div>

						{% if show_stock %}
						<!--Stock-->
						<div class="text-muted text-end">
							<small>
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
							</small>
						</div>
						{% endif %}

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

						{% if product.variants %}
						<!--Variants product-->
						<div class="mt-2" id="variant-{{ product.index }}">
							{% for variant in product.variants %}
								{{ variant.name }}:
								{% case variant.type %}
									{% when 'radio' %}
									<span class="variant-radio-value">
										{{ variant.value }}
									</span>
									{% when 'color' %}
									<span class="minicolors-swatch">
										<span style="background-color: {{ variant.value }}" title="{{ variant.title }}"></span>
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
								<input type="hidden" data-attr-title="{{ variant.title }}" name="variant-{{ product.id }}-{{ variant.id }}" value="{{ variant.value }}">
								<br>
							{% endfor %}
						</div>
						{% endif %}

						{% if product.cart_disabled != 'false' and show_quantity %}
						<!--Quantity-->
						<div class="input-group qty-product mt-2 p-0">
							<div class="input-group-prepend">
								<a href="javascript:;" class="btn btn-primary btn-sm" type="button" data-click="qty-minus" data-id="{{ product.id }}" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">&minus;</a>
							</div>
							<input type="text" value="{{ product.limit }}" data-limit="{{ product.limit }}" data-maxlimit="{{ product.maxlimit }}" class="form-control form-control-sm text-center" name="qty-product-{{ product.id }}" title="{{ '_' | jtext: 'COM_JKASSA_QTY_TITLE' }}" style="max-width: 50px;">
							<div class="input-group-append">
								<a href="javascript:;" class="btn btn-primary btn-sm" type="button" data-click="qty-plus" data-id="{{ product.id }}" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">+</a>
							</div>
						</div>
						{% endif %}

						<!--Buttons-->
						<div class="btn-group mt-2 w-100">
							<!--More-->
							<a href="{{ product.url }}" class="btn btn-sm btn-outline-secondary" title="{{ 'sprintf' | jtext: 'COM_JKASSA_READ_MORE', product.name }}" target="_top">
								<span class="fas fa-arrow-circle-right"></span>
							</a>
							<!--Add to cart-->
							{% if product.cart_disabled %}
							<span class="btn btn-sm btn-primary disabled" title="{{ product.cart_title }}">
								<span class="fas fa-shopping-cart"></span>
							</span>
							{% else %}
							<a href="#" data-click="to-cart-user" data-index="{{ product.index }}" data-id="{{ product.id }}" class="btn btn-primary btn-sm" title="{{ product.cart_title }}">
								<span class="fas fa-shopping-cart"></span>
							</a>
							{% endif %}
							<!--Add to compare-->
							{% if product.compare_disabled %}
							<span class="btn btn-sm btn btn-primary disabled" title="{{ 'sprintf' | jtext: 'COM_JKASSA_COMPARE_ALREADY_ADDED', product.name }}">
								<span class="fas fa-random"></span>
							</span>
							{% else %}
							<a href="#" data-click="to-compare-user" data-index="{{ product.index }}" data-id="{{ product.id }}" class="btn btn-sm btn btn-primary" title="{{ 'sprintf' | jtext: 'COM_JKASSA_COMPARE_ADD_TITLE', product.name}}">
								<span class="fas fa-random"></span>
							</a>
							{% endif %}
							<!--Remove from wishlist-->
							<a href="#" data-click="remove-wishlist" data-index="{{ product.index }}" class="btn btn-sm btn-danger" title="{{ '_' | jtext: 'COM_JKASSA_ACCOUNT_WISHLIST_REMOVE' }}">
								<span class="fas fa-times"></span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</li>
		{% endfor %}
	</ul>
</div>
<!--Remove from wishlist (all)-->
<div class="text-center mb-2">
	<a href="#" class="btn btn-danger" data-click="remove-wishlist-all">
		<span class="fas fa-trash"></span>
		{{ '_' | jtext: 'COM_JKASSA_CLEAR_ALL' }}
	</a>
</div>
{% else %}
<div class="alert alert-warning">
	{{ '_' | jtext: 'COM_JKASSA_ACCOUNT_WISHLIST_EMPTY' }}
</div>
{% endif %}

{% if viewtmpl != 'component' and posttext %}
<!--Posttext-->
<div>
	{{ posttext }}
</div>
{% endif %}