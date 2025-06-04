<div class="d-grid gap-2 mx-auto">
	<div class="btn-group mt-1 mb-0">
		{% if readmore %}
		<!--More-->
		<a class="btn btn-primary btn-sm" href="{{ product.url }}" data-click="select-product" data-id="{{ product.id }}">
			<i class="fas fa-arrow-circle-right"></i>
			{% if btns == 1 %}{{ '_' | jtext: 'JGLOBAL_DESCRIPTION' }}{% endif %}
		</a>
		{% endif %}
		{% if to_cart %}
		<!--Add to cart-->
		{% if product.cart_disabled %}
		<span class="btn btn-sm btn-secondary" title="{{ product.cart_title }}">
			<i class="fas fa-shopping-cart"></i>
			{% if btns == 1 %}{{ '_' | jtext: 'COM_JKASSA_TO_CART' }}{% endif %}
		</span>
		{% else %}
		<a href="#" data-click="to-cart" data-id="{{ product.id }}" data-json="{{ mod_id }}" class="btn btn-sm btn-primary" title="{{ product.cart_title }}">
			<i class="fas fa-shopping-cart"></i>
			{% if btns == 1 %}{{ '_' | jtext: 'COM_JKASSA_TO_CART' }}{% endif %}
		</a>
		{% endif %}
		{% endif %}
		{% if to_compare %}
		<!--Add to compare-->
		{% if product.compare_disabled %}
		<span class="btn btn-sm btn btn-secondary" title="{{ 'sprintf' | jtext: 'COM_JKASSA_COMPARE_ALREADY_ADDED', product.name }}">
			<span class="fas fa-random"></span>
			{% if btns == 1 %}{{ '_' | jtext: 'COM_JKASSA_COMPARE_ADD' }}{% endif %}
		</span>
		{% else %}
		<a href="#" data-click="to-compare" data-id="{{ product.id }}" data-json="{{ mod_id }}" class="btn btn-sm btn btn-primary" title="{{ 'sprintf' | jtext: 'COM_JKASSA_COMPARE_ADD_TITLE', product.name}}">
			<span class="fas fa-random"></span>
			{% if btns == 1 %}{{ '_' | jtext: 'COM_JKASSA_COMPARE_ADD' }}{% endif %}
		</a>
		{% endif %}
		{% endif %}
		{% if remove %}
		<!--Remove-->
		<a href="javascript:;" class="btn btn-sm btn-danger" data-click="remove-wishlist" data-index="{{ product.index }}" title="{{ '_' | jtext: 'MOD_JKASSA_WISHLIST_REMOVE' }}">
			<i class="fas fa-trash-alt"></i>
			{% if btns == 1 %}{{ '_' | jtext: 'JGLOBAL_FIELD_REMOVE' }}{% endif %}
		</a>
		{% endif %}
	</div>
</div>
