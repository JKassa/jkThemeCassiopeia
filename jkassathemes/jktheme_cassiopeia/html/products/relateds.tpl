<div class="jk-relateds">
	<ul class="row list-unstyled">
		{% for related in relateds %}
		<li class="col-3">
			<div class="over-wraper">
				<div class="card over-wraper-long"> 
					<!--Product Image-->
					<div class="product-image text-center">
						<img {{ related.image | img_exists: '50x70' }} style="max-height: 70px;" alt="{{ related.alias }}" />
					</div>
					<div class="card-body p-2"> 
						<!--Name and URL of the product-->
						<h5>
							<a href="{{ related.url }}">
								{{ related.name }}
							</a>
						</h5>
						<!--SKU (code)-->
						<div class="text-muted small text-end mt-1">
							{{ '_' | jtext: 'COM_JKASSA_SKU' }}: {{ related.sku }}
						</div>
						<!--Price the product-->
						<div class="mt-2">
							{% if related.old_cost %} 
							<!--old cost--> 
							<del class="text-muted">{{ related.old_cost }}{{ currency.symbol }}</del> {% endif %} 
							<!--cost--> 
							<span class="cost">
								<span>{{ related.cost }}</span>{{ currency.symbol }}
							</span>
						</div>
						<!--Add to cart-->
						<div class="mt-2">
							<a href="#" class="btn btn-sm btn-info" data-click="to-cart" data-id="{{ related.id }}" title="{{ 'sprintf' | jtext: 'COM_JKASSA_TO_CART_TITLE', related.name }}">
								<span class="fas fa-plus"></span> {{ '_' | jtext: 'COM_JKASSA_ADD' }}
							</a>
						</div>
					</div>
				</div>
			</div>
		</li>
		{% endfor %}
	</ul>
</div>