{% if viewtmpl != 'component' %}
<!--Header-->
{% if heading %}
<h1>{{ heading }}</h1>
{% else %}
<h2>{{ title }}</h2>
{% endif %}
{% if pretext %}
<!--Pretext-->
<div>
	{{ pretext }}
</div>
{% endif %}
{% endif %}

{% if categories %}
<!--Categories-->
<div class="list-unstyled" style="margin-left:0">
	{% for category in categories %}
	<div class="card mb-1">
		<div class="card-body">
			<button type="button" class="btn-close float-end" data-click="remove-compare-category" data-indexes="{{ category.indexes }}" title="{{ '_' | jtext: 'COM_JKASSA_COMPARE_DELETE_TITLE' }}" aria-label="Close"></button>
			<h4 class="card-title">
				{{ category.title }}
				<small>({{ 'plural' | jtext: 'COM_JKASSA_PRODUCTS_QUANTITY', category.products_total }})</small>
			</h4>
			<ul class="list-unstyled">
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
			</ul>
			<hr>
			{% if category.products_total == 1 %}
			<div class="alert alert-info">
				{{ '_' | jtext: 'COM_JKASSA_COMPARE_NOT_ENOUGH' }}
			</div>
			{% else %}
			<a href="{{ category.url }}" class="btn btn-primary">
				<span class="fas fa-random"></span>
				{{ '_' | jtext: 'COM_JKASSA_COMPARE_COMPARE' }}
			</a>
			{% endif %}
		</div>
	</div>
	{% endfor %}
</div>
{% endif %}

{% if products %}
{% if products.products_total == 1 %}
<div class="alert alert-info">
	{{ '_' | jtext: 'COM_JKASSA_COMPARE_NOT_ENOUGH' }}
</div>
{% else %}
{% assign width_table = 80 | divided_by: products.products_total %}
<!--Products-->
<div class="table-responsive">
	<table class="table table-hover table-striped" id="jkCompare">
		<thead>
			<tr>
				<th width="20%">
					<div class="btn-group">
						<a href="#" data-click="compare-all" class="btn btn-secondary btn-sm active" title="{{ '_' | jtext: 'COM_JKASSA_COMPARE_SHOW_ALL_TITLE' }}">
							{{ '_' | jtext: 'JALL' }}
						</a>
						<a href="#" data-click="compare-diff" class="btn btn-secondary btn-sm" title="{{ '_' | jtext: 'COM_JKASSA_COMPARE_SHOW_DIFF_TITLE' }}">
							{{ '_' | jtext: 'COM_JKASSA_COMPARE_SHOW_DIFF' }}
						</a>
					</div>
				</th>
				{% for product in products.products %}
				<th style="vertical-align:top;width:{{ width_table }}%;white-space:normal;">
					<!--Remove from compare-->
					<button type="button" class="btn-close float-end" data-click="remove-compare" data-id="{{ product.index }}" title="{{ '_' | jtext: 'COM_JKASSA_COMPARE_DELETE_TITLE' }}" aria-label="Close"></button>
					<!--Product Image-->
					<div class="text-center">
						<a href="{{ product.url }}" target="_top">
							<img {{ product.image | img_exists: '104x150' }} alt="{{ product.alias }}" />
						</a>
					</div>
					<!--Name and URL of the product-->
					<h4>
						<a href="{{ product.url }}" target="_top">
							{{ product.name }}
						</a>
					</h4>
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
					</div>
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
					<!--Buttons-->
					<div class="btn-group mt-2 w-100">
						<!--Add to cart-->
						{% if product.cart_disabled %}
						<span class="btn btn-primary btn-sm disabled" title="{{ product.cart_title }}">
							<span class="fas fa-shopping-cart"></span>
						</span>
						{% else %}
						<a href="#" data-click="to-cart-user" data-index="{{ product.index }}" data-id="{{ product.id }}" class="btn btn-primary btn-sm" title="{{ product.cart_title }}">
							<span class="fas fa-shopping-cart"></span>
						</a>
						{% endif %}
						<!--Add to Wish List-->
						{% if product.wishlist_disabled %}
						<span class="btn btn-sm btn-danger disabled" title="{{ 'sprintf' | jtext: 'COM_JKASSA_ALREADY_WISHLIST', product.name }}">
							<span class="fas fa-heart"></span>
						</span>
						{% else %}
						<a href="#" data-click="to-wishlist-user" data-index="{{ product.index }}" data-id="{{ product.id }}" class="btn btn-sm btn-danger" title="{{ 'sprintf' | jtext: 'COM_JKASSA_TO_WISHLIST_TITLE', product.name }}">
							<span class="fas fa-heart"></span>
						</a>
						{% endif %}
					</div>
				</th>
				{% endfor %}
			</tr>
		</thead>
		<tbody>
			{% for row in attrib_row %}
			{{ row }}
			{% endfor %}
		
	</table>
</div>
{% endif %}

<p class="text-center">
	<a href="{{ link_url }}" class="btn btn-primary">
		<i class="fas fa-arrow-circle-left"></i>
		{{ '_' | jtext: 'COM_JKASSA_COMPARE_LIST' }}
	</a>
</p>
{% endif %}

{% if no_compare %}
<!--No products to compare-->
<div class="alert alert-warning">
	{{ '_' | jtext: 'COM_JKASSA_COMPARE_NO_PRODUCTS' }}
</div>
{% endif %}

{% if viewtmpl != 'component' and posttext %}
<!--Posttext-->
<div>
	{{ posttext }}
</div>
{% endif %}