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

<!--Profile-->
{{ profile }}

<!--Nav-->
<ul class="list-group mb-4">
	{% if guest %}
	<li class="list-group-item">
		<a href="{{ login_url }}" data-bs-toggle="modal" data-bs-target="#jk-modal_login">
			{{ '_' | jtext: 'JLOGIN' }}
		</a>
	</li>
	{% endif %}
	{% if allow_registration %}
	<li class="list-group-item">
		<a href="{{ registration_route }}">
			{{ '_' | jtext: 'JREGISTER' }}
		</a>
	</li>
	{% endif %}
	<li class="list-group-item">
		<a href="{{ cart_url }}" data-bs-toggle="modal" data-bs-target="#jk-modal_cart">
			{{ '_' | jtext: 'COM_JKASSA_YOUR_CART' }}
			<span class="badge bg-secondary badge-pill float-end">{{ cart_quantity }}</span>
		</a>
	</li>
	<li class="list-group-item">
		<a href="{{ viewed_url }}" data-bs-toggle="modal" data-bs-target="#jk-modal_viewed">
			{{ '_' | jtext: 'COM_JKASSA_VIEWED' }}
			<span class="badge bg-secondary badge-pill float-end">{{ viewed_quantity }}</span>
		</a>
	</li>
	<li class="list-group-item">
		<a href="{{ wishlist_url }}" data-bs-toggle="modal" data-bs-target="#jk-modal_wishlist">
			{{ '_' | jtext: 'COM_JKASSA_YOUR_WISHLIST' }}
			<span class="badge bg-secondary badge-pill float-end">{{ wishlist_quantity }}</span>
		</a>
	</li>
	<li class="list-group-item">
		<a href="{{ compare_url }}" data-bs-toggle="modal" data-bs-target="#jk-modal_compare">
			{{ '_' | jtext: 'COM_JKASSA_COMPARE_PRODUCTS' }}
			<span class="badge bg-secondary badge-pill float-end">{{ compare_quantity }}</span>
		</a>
	</li>
	{% if guest != 1 %}
	<li class="list-group-item">
		<a href="{{ orders_url }}" data-bs-toggle="modal" data-bs-target="#jk-modal_orders">
			{{ '_' | jtext: 'COM_JKASSA_YOUR_ORDERS' }}
			<span class="badge bg-secondary badge-pill float-end">{{ orders_quantity }}</span>
		</a>
	</li>
	{% endif %}
    {% if guest != 1 %}
    <li class="list-group-item">
        <a href="{{ reviews_url }}" data-bs-toggle="modal" data-bs-target="#jk-modal_reviews">
            {{ '_' | jtext: 'COM_JKASSA_YOUR_REVIEWS' }}
            <span class="badge bg-secondary badge-pill float-end">{{ reviews_quantity }}</span>
        </a>
    </li>
    {% endif %}
	{% if affiliate %}
	<li class="list-group-item">
		<a href="{{ affiliate_route }}">
			{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_PROGRAM' }}
		</a>
	</li>
	{% endif %}
</ul>

{% if posttext %}
<!--Posttext-->
<div>
	{{ posttext }}
</div>
{% endif %}

{% if guest %}
	{% comment %}
		Madal body for Login.
	{% endcomment %}
	{% assign modal_title = '_' | jtext: 'COM_JKASSA_ACCOUNT_LOGIN' %}
	{% assign options = 'title,url,bodyHeight' | arrayCombine: modal_title, login_url, 80 %}
	{{ 'renderModal' | bootstrap5: 'jk-modal_login', options }}
{% endif %}

{% comment %}
	Madal body for Cart.
{% endcomment %}
{% capture title_cart %}{{ '_' | jtext: 'COM_JKASSA_YOUR_CART' }} <span class="badge bg-secondary">{{ cart_quantity }}</span>{% endcapture %}
{% assign options = 'title,url,bodyHeight' | arrayCombine: title_cart, cart_url, 80 %}
{{ 'renderModal' | bootstrap5: 'jk-modal_cart', options }}

{% comment %}
	Madal body for Viewed.
{% endcomment %}
{% capture title_viewed %}{{ '_' | jtext: 'COM_JKASSA_VIEWED' }} <span class="badge bg-secondary">{{ viewed_quantity }}</span>{% endcapture %}
{% assign options = 'title,url,bodyHeight' | arrayCombine: title_viewed, viewed_url, 80 %}
{{ 'renderModal' | bootstrap5: 'jk-modal_viewed', options }}

{% comment %}
	Madal body for Wishlist.
{% endcomment %}
{% capture title_wishlist %}{{ '_' | jtext: 'COM_JKASSA_YOUR_WISHLIST' }} <span class="badge bg-secondary">{{ wishlist_quantity }}</span>{% endcapture %}
{% assign options = 'title,url,bodyHeight' | arrayCombine: title_wishlist, wishlist_url, 80 %}
{{ 'renderModal' | bootstrap5: 'jk-modal_wishlist', options }}

{% comment %}
	Madal body for Compare.
{% endcomment %}
{% capture title_compare %}{{ '_' | jtext: 'COM_JKASSA_COMPARE_PRODUCTS' }} <span class="badge bg-secondary">{{ compare_quantity }}</span>{% endcapture %}
{% assign options = 'title,url,bodyHeight' | arrayCombine: title_compare, compare_url, 80 %}
{{ 'renderModal' | bootstrap5: 'jk-modal_compare', options }}

{% comment %}
	Madal body for Orders.
{% endcomment %}
{% capture title_orders %}{{ '_' | jtext: 'COM_JKASSA_YOUR_ORDERS' }} <span class="badge bg-secondary">{{ orders_quantity }}</span>{% endcapture %}
{% assign options = 'title,url,bodyHeight' | arrayCombine: title_orders, orders_url, 80 %}
{{ 'renderModal' | bootstrap5: 'jk-modal_orders', options }}

{% comment %}
	Madal body for reviews.
{% endcomment %}
{% capture title_reviews %}{{ '_' | jtext: 'COM_JKASSA_YOUR_REVIEWS' }} <span class="badge bg-secondary">{{ reviews_quantity }}</span>{% endcapture %}
{% assign options = 'title,url,bodyHeight' | arrayCombine: title_reviews, reviews_url, 80 %}
{{ 'renderModal' | bootstrap5: 'jk-modal_reviews', options }}
