<div class="row">
	<div class="col-12">
		<div class="card p-0">
			<!--Header-->
			<div class="card-header">
				<span class="float-end">
					<a href="{{ cart_url }}">
						<span class="fas fa-pencil-alt"></span>
						{{ '_' | jtext: 'JACTION_EDIT' }}
					</a>
				</span>
				<h5 class="m-0">
					{{ '_' | jtext: 'COM_JKASSA_YOUR_ORDER' }}
				</h5>
			</div>
			<!--Products-->
			<div class="card-body pt-0 pb-0">
				{% for product in products %}
				<div class="row jk-table-body">
					<!--Product Image-->
					<div class="col-4 position-relative">
						{% if product.d_simple %}
						<ul class="stickers top-0">
							<li>
								<span class="product-label">
									{% assign options = 'decimals' | arrayCombine: 0 %}
									-{{ product.d_simple.value | costDisplay: options }}{% if product.d_simple.symbol == '%' %}{{ product.d_simple.symbol }}{% endif %}
								</span>
							</li>
						</ul>
						{% endif %}
						<a href="{{ product.url }}" target="_blank">
							<img {{ product.image | img_exists: '88x127' }} class="img-fluid" alt="{{ product.alias }}" />
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
						</h6>
						{% if product.sku %}
						<!--SKU (code)-->
						<div class="text-muted text-end small mt-2">
							{{ '_' | jtext: 'COM_JKASSA_SKU' }}: {{ product.sku }}
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
						{% endif %}
					</div>
					<!--Product price-->
					<div class="col-12">
						<div class="row">
							<div class="col-5 text-start">
								<!--cost-->
								{{ product.cost | costDisplay }}{{ currency.symbol }}
							</div>
							<div class="col-2 text-center text-nowrap">
								&times;{{ product.quantity }}
							</div>
							<div class="col-5 text-end">
								<!--Price-->
								{{ product.price | costDisplay }}{{ currency.symbol }}
							</div>
						</div>
					</div>
					{% if product.vat %}
					<div class="col-12">
						<div class="row">
							<div class="col-6 text-start">
								{{ 'sprintf' | jtext: 'COM_JKASSA_VAT_INCL', product.vat }}
							</div>
							<div class="col-6 text-end">
								{{ product.vat_cost }}{{ currency.symbol }}
							</div>
						</div>
					</div>
					{% endif %}
				</div>
				{% endfor %}
			</div>
			<!--Table footer-->
			<div class="card-footer">
				<div class="row text-end">
					<!-- Total price -->
					<div class="col-7 p-0"><strong>{{ '_' | jtext: 'COM_JKASSA_SUM' }}:</strong></div>
					<div class="col-5 cost"><span>{{ total | costDisplay }}</span>{{ currency.symbol }}</div>
					{% if discounts.sav %}
					<!--Discount sav-->
					<div class="col-7 p-0"><strong>{{ discounts.sav.name }}:</strong></div>
					<div class="col-5">
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
					<div class="col-7 p-0"><strong>{{ discounts.sum.name }}:</strong></div>
					<div class="col-5">
						-{{ discounts.sum.difference | costDisplay }}{{ currency.symbol }}
						{% if discounts.sum.percent %}
						<em>({{ discounts.sum.discount }}%)</em>
						{% endif %}
						{% if discounts.sum.desc %}
						<span class="fas fa-info-circle hasTooltip" title="{{ discounts.sum.desc }}"></span>
						{% endif %}
					</div>
					{% endif %}
					{% if delivery_cost %}
					<!--Delivery cost-->
					<div class="col-7 p-0"><strong>{{ '_' | jtext: 'COM_JKASSA_ORDER_DELIVERY' }}:</strong></div>
					<div class="col-5">
						{% if delivery_tariff %}
							{{ '_' | jtext: 'COM_JKASSA_TARIFF' }}
						{% else %}
							{% if delivery_cost == 0.00 %}
								{{ '_' | jtext: 'COM_JKASSA_FREE' }}
							{% else %}
								{{ delivery_cost | costDisplay }}{{ currency.symbol }}
							{% endif %}
						{% endif %}
					</div>
					{% endif %}
					{% if sum_vat %}
					<!--Sum of VAT-->
					<div class="col-7 p-0"><strong>{{ '_' | jtext: 'COM_JKASSA_VAT' }}:</strong></div>
					<div class="col-5">
						{{ sum_vat | costDisplay }}{{ currency.symbol }}
					</div>
					{% endif %}
					{% if taxes %}
					<!--Taxes-->
					{% for tax in taxes %}
					<div class="col-7 p-0"><strong>{{ tax.name }}:</strong></div>
					<div class="col-5">
						{{ tax.tax }}%
						{% if tax.description %}
						<span class="fas fa-info-circle hasTooltip" title="{{ tax.description }}"></span>
						{% endif %}
					</div>
					{% endfor %}
					{% endif %}
					<!--In total price-->
					<div class="col-12 mt-2">
						<span class="lead text-info" style="border-top:1px solid #dddddd">
							{{ in_total | costDisplay }}{{ currency.symbol }}
						</span>
					</div>
					{% if coupon %}
					<!--Coupons code-->
					<div class="col-12">
						<a data-click="code-toggle" href="#">
							<span class="fas fa-gift"></span>
							{{ '_' | jtext: 'COM_JKASSA_ORDER_CODE_USE' }}
						</a>
						<div id="code-toggle" class="input-group mt-1" style="display: none">
							<input type="text" id="coupons_code" placeholder="{{ '_' | jtext: 'COM_JKASSA_ORDER_CODE_ENTER' }}" class="form-control" value="{{ coupon.value }}">
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
						<div class="alert alert-danger mt-1" id="coupons_note">
							{{ coupon.note }}
						</div>
						{% endif %}
						<script type="text/javascript">
							jQuery('[data-click=code-toggle]').click(function(event) {
								event.preventDefault();
								jQuery('#code-toggle').slideToggle();
								jQuery('#coupons_note').remove();
							});
						</script>
					</div>
					{% endif %}
				</div>
			</div>
		</div>
	</div>
</div>