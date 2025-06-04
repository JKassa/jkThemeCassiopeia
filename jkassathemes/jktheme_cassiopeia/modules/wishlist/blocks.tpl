{% if products %}
<ul class="row list-unstyled">
	{% for product in products %}
	<li class="col-12 col-sm-6 col-md-3">
		<div class="card mb-3">
			<div style="{{ block_height }}">
				<div class="card-body p-2">
					<div style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap">
						<a href="{{ product.url }}" data-click="select-product" data-id="{{ product.id }}" title="{{ product.name }}">
							{{ product.name }}
						</a>
					</div>
					{% if product.introtext %}
					<div class="mt-1" style="font-size: 11px; line-height: 14px">
						{{ product.introtext | truncateDesc: 35 }}
					</div>
					{% endif %}
					{% if product.cost and product.old_cost %}
					<del class="text-muted">{{ product.old_cost | costDisplay }}{{ currency.symbol }}</del>
					{% endif %}
				</div>
			</div>
			<div class="card-body p-2">
				{% if product.cost %}
				<div class="mt-1">
					<span class="cost">
						<span>{{ product.cost | costDisplay }}</span>{{ currency.symbol }}
					</span>
				</div>
				{% endif %}
				{% if show_stock %}
				<!--Stock-->
				<div class="text-muted mt-1 text-end small">
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
				{% endif %}
				{% if show_votes %}
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
				{% endif %}
				{% if btns %}
					<!--Buttons-->
					{% include 'modules/wishlist/btns' %}
				{% endif %}
			</div>
		</div>
	</li>
	{% endfor %}
</ul>
{% else %}
<div class="alert alert-info">
	{{ text_empty }}
</div>
{% endif %}
