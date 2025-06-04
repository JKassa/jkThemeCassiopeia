<div class="text-center jk-cheaper carousel slide" id="cheaperCarousel" data-bs-ride="carousel">
	<!-- Carousel items -->
	<div class="carousel-inner" role="listbox">
		{% for together in cheaper %}
		{% for cheap in together.cheaper %}
		<div class="carousel-item{% if cheap.active %} active{% endif %}">
			<ul class="row list-unstyled">
				<li class="col-3">
					<!--Product Image-->
					<div>
						<img {{ together.image | img_exists: '50x70' }} style="max-height: 30%" alt="{{ together.alias }}" />
					</div>
					<!--Name product-->
					<h6>
						{{ together.name }}
					</h6>
					<!--Price product-->
					<div class="mt-1">
						{% if together.old_cost %}
						<!--old cost-->
						<del class="text-muted">
							{{ together.old_cost | costDisplay }}{{ currency.symbol }}
						</del>
						{% endif %}
						<!--cost-->
						<span class="cost">
							<span>{{ together.cost | costDisplay }}</span>{{ currency.symbol }}
						</span>
					</div>
				</li>
				<li class="col-1 plass">
					+
				</li>
				<li class="col-3">
					<!--Product Image-->
					<div>
						<img {{ cheap.image | img_exists: '50x70' }} style="max-height: 30%" alt="{{ cheap.alias }}" />
					</div>
					<!--Name and URL product-->
					<h6>
						<a href="{{ cheap.url }}">
							{{ cheap.name }}
						</a>
					</h6>
					<!--SKU (code)-->
					<div class="text-muted mt-1">
						<small>
							{{ '_' | jtext: 'COM_JKASSA_SKU' }}: {{ cheap.sku }}
						</small>
					</div>
					<!--Price product-->
					<div class="mt-1">
						<!--old cost-->
						<del class="text-muted">
							{{ cheap.old_cost | costDisplay }}{{ currency.symbol }}
						</del>
						<!--cost-->
						<strong class="text-info">
							{{ cheap.cost | costDisplay }}{{ currency.symbol }}
						</strong>
					</div>
				</li>
				<li class="col-1 equally">
					=
				</li>
				<li class="col-4">
					<!--old price-->
					<del class="text-muted">
						{{ cheap.old_price | costDisplay }}{{ currency.symbol }}
					</del>
					<br>
					<!--new price-->
					<span class="lead text-info">
						{{ cheap.new_price | costDisplay }}{{ currency.symbol }}
					</span>
					<br>
					<!--discount-->
					<div class="discount">
						{{ '_' | jtext: 'COM_JKASSA_DISCOUNT' }} {{ cheap.difference | costDisplay }}{{ currency.symbol }}
						{% if cheap.percent %}
						<small>({{ cheap.discount }}%)</small>
						{% endif %}
					</div>
					<!--Add to cart-->
					<div class="mt-2">
						<a href="#" data-click="to-cart" data-id="{{ cheap.id }}" class="btn btn-info btn-sm" title="{{ 'sprintf' | jtext: 'COM_JKASSA_TO_CART_TITLE', cheap.name }}">
							<span class="fas fa-shopping-cart"></span>
							{{ '_' | jtext: 'COM_JKASSA_TO_CART' }}
						</a>
					</div>
				</li>
			</ul>
		</div>
		{% endfor %}
		{% endfor %}
	</div>
	<!-- Carousel nav -->
	<a class="carousel-control carousel-control-prev" href="#cheaperCarousel" role="button" data-slide="prev">
		&lsaquo;
		<span class="visually-hidden">Previous</span>
	</a>
	<a class="carousel-control carousel-control-next" href="#cheaperCarousel" role="button" data-slide="next">
		&rsaquo;
    	<span class="visually-hidden">Next</span>
	</a>
</div>