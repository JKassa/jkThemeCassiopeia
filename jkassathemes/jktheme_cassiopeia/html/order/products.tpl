<div class="table-responsive">
	<table class="table table-striped table-hove">
		<thead>
			<tr>
				<!--ID/Code-->
				<th width="1%" class="text-center text-nowrap hidden-phone">
					{{ '_' | jtext: 'COM_JKASSA_ID_SKU' }}
				</th>
				<!--Name-->
				<th>
					{{ '_' | jtext: 'COM_JKASSA_GRID_TITLE' }}
				</th>
				<!--Price (per 1 unit)-->
				<th class="text-center text-nowrap hidden-phone">
					{{ '_' | jtext: 'COM_JKASSA_PRICE_1' }}
				</th>
				<!--Count-->
				<th width="1%" class="text-nowrap">
					{{ '_' | jtext: 'COM_JKASSA_QUANTITY' }}
				</th>
				<!--Price-->
				<th>
					{{ '_' | jtext: 'COM_JKASSA_COST' }}
				</th>
			</tr>
		</thead>
		<tbody>
			<!--Products-->
			{% for product in products %}
			<tr>
				<!--ID/Code-->
				<td class="text-center hidden-phone">
					<small>{{ product.id }}</small>
					{% if product.id != product.sku %}
					<br />
					<small>{{ product.sku }}</small>
					{% endif %}
				</td>
				<!--Name-->
				<td>
					{% if product.image %}
					<div style="float: left; margin-right: 5px; min-width: 80px; text-align: center;">
						<img {{ product.image | img_exists: '80x80' }} alt="{{ product.alias }}" style="max-height: 80px; max-width: 80px;" />
					</div>
					{% endif %}
					<a href="{{ product.url }}" target="_blank" title="{{ '_' | jtext: 'COM_JKASSA_SHOW_SHOP' }}">
						{{ product.name }}
					</a>
					{% if product.present %}
					+ <a href="{{ product.present.url }}">{{ product.present.name }}</a>
					{% endif %}
					{% if product.variants %}
					<p>
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
					</p>
					{% endif %}
					{% if product.d_simple %}
					<!--Discount-->
					<br>
					<small>
						{{ product.d_simple.name }}:
						-{{ product.d_simple.difference | costDisplay }}{{ currency.symbol }}
						{% if product.d_simple.symbol == '%' %}
						<em>({{ product.d_simple.value }}%)</em>
						{% endif %}
					</small>
					{% endif %}
					{% if product.d_coupon %}
					<!--Promotional code-->
					<br>
					<small>
						{{ product.d_coupon.name }}:
						-{{ product.d_coupon.difference | costDisplay }}{{ currency.symbol }}
						{% if product.d_coupon.symbol == '%' %}
						<em>({{ product.d_coupon.value }}%)</em>
						{% endif %}
					</small>
					{% endif %}
					{% if product.attachment %}
					<fieldset>
						<legend style="font-size: 16px; line-height: 26px; margin-bottom: 10px;">
							{{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}
						</legend>
						<ul class="list-unstyled">
							{% for file in product.attachment %}
							<li>
								<span class="fas fa-download small"></span>
								<a href="javascript:;" onClick="{{ file.url }}" title="{{ '_' | jtext: 'COM_JKASSA_FILE_DOWNLOAD' }}">
									{{ file.name }}
								</a>
							</li>
							{% endfor %}
						</ul>
					</fieldset>
					{% endif %}
				</td>
				<!--Price (per 1 unit)-->
				<td class="text-center hidden-phone">
					{% if product.old_cost %}
					<!--Old cost-->
					<del>{{ product.old_cost | costDisplay }}{{ currency.symbol }}</del><br>
					{% endif %}
					{{ product.cost | costDisplay }}{{ currency.symbol }}
				</td>
				<!--Count-->
				<td class="text-center">
					{{ product.quantity }}
				</td>
				<!--Price-->
				<td class="text-center">
					{{ product.price | costDisplay }}{{ currency.symbol }}
					{% if product.vat %}
					<br>
					<!--vat-->
					<span class="text-muted small">
						({{ 'sprintf' | jtext: 'COM_JKASSA_VAT_INCL', product.vat }})
					</span>
					{% endif %}
				</td>
			</tr>
			{% endfor %}
		</tbody>
	</table>
</div>
<div class="table-responsive mt-2">
	<table class="table table-hover">
		<tbody>
			<!--Cost of products-->
			<tr>
				<td class="text-end" style="text-align: right">
					{{ '_' | jtext: 'COM_JKASSA_COST_PRODUCTS' }}:
				</td>
				<td>
					{{ pm_total | costDisplay }}{{ currency.symbol }}
				</td>
			</tr>
			{% if discounts %}

			<!--Discounts data-->
			{% for discount in discounts %}
			<tr>
				<td class="text-end" style="text-align: right">
					{{ discount.name }}:
				</td>
				<td>
					-{{ discount.difference | costDisplay }}{{ currency.symbol }}
					{% if discount.percent %}
					<em>({{ discount.discount }}%)</em>
					{% endif %}
				</td>
			</tr>
			{% endfor %}
			{% endif %}

			{% if delivery %}
			<!--Cost of delivery-->
			<tr>
				<td class="text-end" style="text-align: right">
					{{ '_' | jtext: 'COM_JKASSA_DELIVERY_CHARGES' }}:
				</td>
				<td>
					{% if delivery.tariff %}
						{{ '_' | jtext: 'COM_JKASSA_TARIFF' }}
					{% else %}
						{% if delivery.cost == 0 %}
							{{ '_' | jtext: 'COM_JKASSA_FREE'}}
						{% else %}
							{{ delivery.cost | costDisplay }}{{ currency.symbol }}
						{% endif %}
					{% endif %}
				</td>
			</tr>
			{% endif %}

			{% if sum_vat %}
			<!--Sum of VAT-->
			<tr>
				<td class="text-end" style="text-align: right">
					{{ '_' | jtext: 'COM_JKASSA_VAT' }}:
				</td>
				<td>
					{{ sum_vat | costDisplay }}{{ currency.symbol }}
				</td>
			</tr>
			{% endif %}

			{% if taxes %}
			<!--Taxes-->
			{% for tax in taxes %}
			<tr>
				<td class="text-end" style="text-align: right">
					{{ tax.name }}:
				</td>
				<td>
					{{ tax.tax }}%
					{% if tax.description %}
					<span class="fas fa-info-circle hasTooltip" title="{{ tax.description }}"></span>
					{% endif %}
				</td>
			</tr>
			{% endfor %}
			{% endif %}

			<!--Total-->
			<tr style="font-weight: bold;">
				<td class="text-end" style="text-align: right">
					{{ '_' | jtext: 'COM_JKASSA_TOTAL' }}:
				</td>
				<td>
					{{ pm_in_total | costDisplay }}{{ currency.symbol }}
				</td>
			</tr>
		</tbody>
	</table>
</div>
