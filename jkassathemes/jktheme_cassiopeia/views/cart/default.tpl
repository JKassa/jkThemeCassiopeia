{{ 'tooltip' | bootstrap5, '.hasTooltip' }}

{% if viewtmpl != 'component' %}
<!--Header-->
{% if heading %}
<h1>{{ heading }} <small>({{ quantity }})</small></h1>
{% else %}
<h2>{{ title }} <small>({{ quantity }})</small></h2>
{% endif %}
{% if pretext %}
<!--Pretext-->
<div>
	{{ pretext }}
</div>
{% endif %}
{% endif %}

{% if cart_empty %}
<!--Cart empty-->
<div class="alert alert-info">
	<h4>{{ '_' | jtext: 'COM_JKASSA_CART_EMPTY_TITLE' }}!</h4>
	{% if user_guest %}
	{{ 'sprintf' | jtext: 'COM_JKASSA_CART_EMPTY_NOTE_GUEST', login_url }}
	{% else %}
	{{ '_' | jtext: 'COM_JKASSA_CART_EMPTY_NOTE' }}
	{% endif %}
</div>
{% endif %}

{% if products %}
{% if limit_order %}
<!--Minimum order amount-->
<div class="alert alert-warning">
	{% capture limit_cost %}{{ limit_order | costDisplay }}{{ currency.symbol }}{% endcapture %}
	<h4>{{ 'sprintf' | jtext: 'COM_JKASSA_LIMIT_ORDER', limit_cost  }}</h4>
	{{ '_' | jtext: 'COM_JKASSA_LIMIT_ORDER_NOTE' }}
</div>
{% endif %}

<div class="row navbar navbar-dark bg-dark jk-table-head mb-0">
	<div class="container-fluid">
		<div class="col-6 col-sm-7 text-center">
			<span class="navbar-text">{{ '_' | jtext: 'COM_JKASSA_GRID_TITLE' }}</span>
		</div>
		<div class="col-6 col-sm-3 text-center">
			<span class="navbar-text">{{ '_' | jtext: 'COM_JKASSA_QUANTITY' }}</span>
		</div>
		<div class="col-6 col-sm-2 text-center">
			<span class="navbar-text">{{ '_' | jtext: 'COM_JKASSA_COST' }}</span>
		</div>
	</div>
</div>

{% for product in products %}
<div class="row jk-table-body pt-2">
	<!--Product image-->
	<div class="col-6 col-sm-2">
		<div class="product-image">
			{% if product.d_simple %}
			<ul class="stickers">
				<li>
					<span class="product-label">
						{% assign options = 'decimals' | arrayCombine: 0 %}
						-{{ product.d_simple.value | costDisplay: options }}{% if product.d_simple.symbol == '%' %}{{ product.d_simple.symbol }}{% endif %}
					</span>
				</li>
			</ul>
			{% endif %}
			<!--Product Image-->
			<div class="text-center">
				<a href="{{ product.url }}" target="_blank">
					<img {{ product.image | img_exists: '88x127' }} alt="{{ product.alias }}" class="img-fluid" />
				</a>
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
	</div>
	
	<!--Product information-->
	<div class="col-12 col-sm-6">
		<!--Name-->
		<h5>
			<a href="{{ product.url }}" target="_blank">
				{{ product.name }}
			</a>
			{% if product.files %}
			<!--Files-->
			<small class="text-muted hasTooltip" title="<strong>{{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}:</strong><br>{{ product.files | join: '<br>' }}">
				<i class="fas fa-download"></i>
			</small>
			{% endif %}
		</h5>
		{% if product.sku %}
		<!--SKU (code)-->
		<div class="text-muted text-end">
			<small>
				{{ '_' | jtext: 'COM_JKASSA_SKU' }}: {{ product.sku }}
			</small>
		</div>
		{% endif %}
		{% if product.variants %}
		<!--Variants product-->
		<div class="mt-2">
			{% for variant in product.variants %}
			<strong>{{ variant.name }}:</strong>
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
			<br>
			{% endfor %}
		</div>
		{% endif %}
		<!--Cost-->
		<div class="mt-2">
			{% if product.old_cost %}
			<!--old cost-->
			<del class="text-muted">{{ product.old_cost | costDisplay }}{{ currency.symbol }}</del>
			{% endif %}
			<!--cost-->
			{{ product.cost | costDisplay }}{{ currency.symbol }}
			{% if product.d_coupon %}
			<!--Promotional code-->
			<br>
			<span class="text-danger small">
				<strong>{{ product.d_coupon.name }}</strong>:
				-{{ product.d_coupon.difference | costDisplay }}{{ currency.symbol }}
				{% if product.d_coupon.symbol == '%' %}
				<em>({{ product.d_coupon.value }}%)</em>
				{% endif %}
				{% if product.d_coupon.desc %}
				<span class="fas fa-info-circle hasTooltip" title="{{ product.d_coupon.desc }}"></span>
				{% endif %}
			</span>
			{% endif %}
		</div>
	</div>
	
	<!--Quantity-->
	<div class="col-6 col-sm-2 text-center">
		<div class="input-group qty-product mt-2 p-0 col-4 col-sm-10" style="margin: auto !important">
			<div class="input-group-prepend">
				<a href="javascript:;" class="btn btn-primary btn-sm" data-click="qty-minus-cart" data-id="{{ product.index }}" class="btn btn-primary" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">&minus;</a>
			</div>
			<input type="text" value="{{ product.quantity }}" data-id="{{ product.index }}" data-limit="{{ product.limit }}" data-maxlimit="{{ product.maxlimit }}" class="form-control form-control-sm text-center" name="qty-product-cart-{{ product.index }}" title="{{ '_' | jtext: 'COM_JKASSA_QTY_TITLE' }}">
			<div class="input-group-append">
				<a href="javascript:;" class="btn btn-primary btn-sm" data-click="qty-plus-cart" data-id="{{ product.index }}" class="btn btn-primary" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">+</a>
			</div>
		</div>
	</div>

	<div class="col-6 col-sm-2 text-center">
		<!--Price-->
		<div class="cost text-info">
			<span>{{ product.price | costDisplay }}</span>{{ currency.symbol }}
		</div>
		{% if product.vat %}
		<!--vat-->
		<span class="text-muted small">
			({{ 'sprintf' | jtext: 'COM_JKASSA_VAT_INCL', product.vat }})
		</span>
		{% endif %}
		<!--Remove from Cart-->
		<div class="mt-2">
			<a href="#" data-click="remove-product" data-index="{{ product.index }}" class="btn btn-sm btn-danger" title="{{ '_' | jtext: 'COM_JKASSA_CART_DELETE_TITLE' }}">
				<span class="fas fa-times"></span>
				{{ '_' | jtext: 'JACTION_DELETE' }}
			</a>
		</div>
	</div>
</div>
{% endfor %}

<div class="row jk-table-footer">
	{% if sum_note %}
	<!--Discount sum note-->
	<div class="col-12">
		<div class="alert alert-info">
			{% capture sum_note_amount %}{{ sum_note.amount | costDisplay }}{{ currency.symbol }}{% endcapture %}
			{% capture sum_note_discount %}{{ sum_note.discount | costDisplay }}{{ sum_note.symbol }}{% endcapture %}
			{{ 'sprintf' | jtext: 'COM_JKASSA_CART_DISCOUNTS_SUM_NOTE', sum_note_amount, sum_note_discount }}
		</div>
	</div>
	{% endif %}
	{% if coupon %}
	<!--Coupons code-->
	<div class="col-12">
		<p class="text-muted">{{ '_' | jtext: 'COM_JKASSA_ORDER_CODE_TITLE' }}</p>
		<div class="input-group">
			<input type="text" id="coupons_code" class="form-control form-control-sm" placeholder="{{ '_' | jtext: 'COM_JKASSA_ORDER_CODE_ENTER' }}" value="{{ coupon.value }}">
			<div class="input-group-append">
				<a href="#" data-click="code-apply" class="btn btn-outline-secondary">
					{{ '_' | jtext: 'COM_JKASSA_APPLY' }}
				</a>
				<a href="#" data-click="code-clear" class="btn btn-outline-secondary" title="{{ '_' | jtext: 'JCLEAR' }}">
					<span class="fas fa-times"></span>
				</a>
			</div>
		</div>
		{% if coupon.note %}
		<div class="alert alert-danger mt-1">
			{{ coupon.note }}
		</div>
		{% endif %}
	</div>
	{% endif %}
	<div class="col-12 col-sm-6">
		{% if limit_order == 0 %}
		<!--Order url-->
		<button class="btn btn-primary" type="button" onClick="window.open('{{ order_url }}', '_top')">
			<span class="fas fa-check"></span>
			{{ '_' | jtext: 'COM_JKASSA_CHECKOUT' }}
		</button>
		{% endif %}
	</div>
	<div class="col-12 col-sm-6">
		<div class="row text-end">
			{% if discounts %}
			<!-- Total price -->
			<div class="col-7"><strong>{{ '_' | jtext: 'COM_JKASSA_SUM' }}:</strong></div>
			<div class="col-5 cost"><span>{{ total | costDisplay }}</span>{{ currency.symbol }}</div>
			{% endif %}
			{% if discounts.sav %}
			<!--Discount sav-->
			<div class="col-7 mt-2"><strong>{{ discounts.sav.name }}:</strong></div>
			<div class="col-5 mt-2">
				-{{ discounts.sav.difference | costDisplay }}{{ currency.symbol }}
				{% if discounts.sav.percent %}
				<em>({{ discounts.sav.discount }}%)</em>
				{% endif %}
				{% if discounts.sav.desc %}
				<span class="fas fa-info-circle hasTooltip" title="{{ discounts.sav.desc }}"></span>
				{% endif %}
			</div>
			{% endif %}
			{% if discounts.sum %}
			<!--Discount sum-->
			<div class="col-7 mt-2"><strong>{{ discounts.sum.name }}:</strong></div>
			<div class="col-5 mt-2">
				-{{ discounts.sum.difference | costDisplay }}{{ currency.symbol }}
				{% if discounts.sum.percent %}
				<em>({{ discounts.sum.discount }}%)</em>
				{% endif %}
				{% if discounts.sum.desc %}
				<span class="hasTooltip" title="{{ discounts.sum.desc }}">
					<i class="fas fa-info-circle"></i>
				</span>
				{% endif %}
			</div>
			{% endif %}
			{% if sum_vat %}
			<!--Sum of VAT-->
			<div class="col-7 mt-2"><strong>{{ '_' | jtext: 'COM_JKASSA_VAT' }}:</strong></div>
			<div class="col-5 mt-2">
				{{ sum_vat | costDisplay }}{{ currency.symbol }}
			</div>
			{% endif %}
			{% if taxes %}
			<!--Taxes-->
			{% for tax in taxes %}
			<div class="col-7 mt-2"><strong>{{ tax.name }}:</strong></div>
			<div class="col-5 mt-2">
				{{ tax.tax }}%
				{% if tax.description %}
				<span class="fas fa-info-circle hasTooltip" title="{{ tax.description }}"></span>
				{% endif %}
			</div>
			{% endfor %}
			{% endif %}
			<!--In total price-->
			<div class="col-12 pt-1 border-top mt-3">
				<span class="lead text-info">
					{{ in_total | costDisplay }}{{ currency.symbol }}
				</span>
			</div>
		</div>
	</div>
</div>

{% if cheaper %}
<!--Share: Together cheaper-->
<div class="mt-3">
	<h3>{{ '_' | jtext: 'COM_JKASSA_CART_TOGETHER_CHEAPER' }}</h3>
	{% include 'html/products/cheaper' %}
</div>
{% endif %}

{% if relateds %}
<!--Related products-->
<div class="mt-3">
	<h3>{{ '_' | jtext: 'COM_JKASSA_CART_ADD_TO_ORDER' }}</h3>
	{% include 'html/products/relateds' %}
</div>
{% endif %}
{% endif %}

{% if viewtmpl != 'component' %}
{% if posttext %}
<!--Posttext-->
<div>
	{{ posttext }}
</div>
{% endif %}

<!--Button: 'Continue Shopping'-->
<div class="text-center mt-2">
	<a class="btn btn-secondary btn-lg" href="{{ home_page }}">
		<span class="fas fa-chevron-right"></span>
		{{ '_' | jtext: 'COM_JKASSA_CART_CONTINUE_SHOPPING' }}
	</a>
</div>
{% endif %}
