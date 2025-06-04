<div class="d-grid gap-2 mx-auto">
	<div class="btn-group mt-1 mb-{{ mb }}">
		{% if readmore %}
		<!--More-->
		<a class="btn btn-primary btn-sm" href="{{ product.url }}" data-click="select-product" data-id="{{ product.id }}">
			<i class="fas fa-arrow-circle-right"></i>
			<span class="visually-hidden">
				{% if btns == 1 %}{{ '_' | jtext: 'JGLOBAL_DESCRIPTION' }}{% endif %}
			</span>
		</a>
		{% endif %}
		{% if to_cart %}
		<!--Add to cart-->
		{% if product.cart_disabled %}
		<span class="btn btn-sm btn-secondary" title="{{ product.cart_title }}">
			<i class="fas fa-shopping-cart"></i>
			<span class="visually-hidden">
				{% if btns == 1 %}{{ '_' | jtext: 'COM_JKASSA_TO_CART' }}{% endif %}
			</span>
		</span>
		{% else %}
		<a href="#" data-click="to-cart" data-id="{{ product.id }}" data-json="{{ mod_id }}" class="btn btn-sm btn-primary" title="{{ product.cart_title }}">
			<i class="fas fa-shopping-cart"></i>
			<span class="visually-hidden">
				{% if btns == 1 %}{{ '_' | jtext: 'COM_JKASSA_TO_CART' }}{% endif %}
			</span>
		</a>
		{% endif %}
		{% endif %}
		{% if to_wishlist %}
		<!--Add to Wish List-->
		{% if product.wishlist_disabled %}
		<span class="btn btn-sm btn-secondary" title="{{ 'sprintf' | jtext: 'COM_JKASSA_ALREADY_WISHLIST', product.name }}">
			<i class="fas fa-heart"></i>
			<span class="visually-hidden">
				{% if btns == 1 %}{{ '_' | jtext: 'COM_JKASSA_TO_WISHLIST' }}{% endif %}
			</span>
		</span>
		{% else %}
		<a href="#" data-click="to-wishlist" data-id="{{ product.id }}" data-json="{{ mod_id }}" class="btn btn-sm btn-danger" title="{{ 'sprintf' | jtext: 'COM_JKASSA_TO_WISHLIST_TITLE', product.name }}">
			<i class="fas fa-heart"></i>
			<span class="visually-hidden">
				{% if btns == 1 %}{{ '_' | jtext: 'COM_JKASSA_TO_WISHLIST' }}{% endif %}
			</span>
		</a>
		{% endif %}
		{% endif %}
		{% if to_compare %}
		<!--Add to compare-->
		{% if product.compare_disabled %}
		<span class="btn btn-sm btn btn-secondary" title="{{ 'sprintf' | jtext: 'COM_JKASSA_COMPARE_ALREADY_ADDED', product.name }}">
			<i class="fas fa-random"></i>
			<span class="visually-hidden">
				{% if btns == 1 %}{{ '_' | jtext: 'COM_JKASSA_COMPARE_ADD' }}{% endif %}
			</span>
		</span>
		{% else %}
		<a href="#" data-click="to-compare" data-id="{{ product.id }}" data-json="{{ mod_id }}" class="btn btn-sm btn btn-primary" title="{{ 'sprintf' | jtext: 'COM_JKASSA_COMPARE_ADD_TITLE', product.name}}">
			<i class="fas fa-random"></i>
			<span class="visually-hidden">
				{% if btns == 1 %}{{ '_' | jtext: 'COM_JKASSA_COMPARE_ADD' }}{% endif %}
			</span>
		</a>
		{% endif %}
		{% endif %}
	</div>
</div>
