{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ '' | registerAndUseStyle: 'jktheme.css' }}
{{ 'loadAll5' | fontawesome }}

{% assign htag = 'h1' %}

{% if heading %}
<!--Header-->
<h1>{{ heading }}</h1>
{% assign htag = 'h2' %}
{% endif %}

{% if pretext %}
<!--Pretext-->
<div>
	{{ pretext }}
</div>
{% endif %}

<!--Print-->
{% if print_screen == 0 %}
<div class="position-relative">
	<div class="position-absolute top-0 end-0">
		{{ print_icon }}
	</div>
</div>
{% else %}
<div class="btn btn-primary no-print" style="position: fixed; right: 10px; top: 10px">
	{{ print_screen }}
</div>
{% endif %}

<div class="text-center">
	{% if print_screen == 0 %}
	<i class="{{ image }} fa-7x"></i>
	{% endif %}
	<{{ htag }}>{{ order_status }}</{{ htag }}>
	<p>{{ description }}</p>

	{% if print_screen == 0 and action == 'pending' %}
	<a href="{{ update_url }}" class="button btn btn-lg btn-warning">
		{{ '_' | jtext: 'COM_JKASSA_UPDATE_STATUS' }}
	</a>
	{% endif %}

	<hr />

	<h3>
		{{ 'sprintf' | jtext: 'COM_JKASSA_RESULT_NUMBER', pm_number }}
	</h3>
</div>

{% if note %}
<div class="alert alert-warning">
	{{ note }}
</div>
{% endif %}

{% if print_screen == 0 %}
<!--Order-->
{% assign options = 'active' | arrayCombine: 'data_products' %}
{{ 'startAccordion' | bootstrap5: 'resultAccordian', options }}
	<!--Information about order-->
	{% assign title = '_' | jtext: 'COM_JKASSA_YOUR_PURCHASES' %}
	{{ 'addSlide' | bootstrap5: 'resultAccordian', title, 'data_products' }}
		{% include 'views/result/products' %}
	{{ 'endSlide' | bootstrap5 }}
	<!--Order data-->
	{% assign title = '_' | jtext: 'COM_JKASSA_ORDER_DATA' %}
	{{ 'addSlide' | bootstrap5: 'resultAccordian', title, 'data_payment' }}
		{% include 'views/result/payment' %}
	{{ 'endSlide' | bootstrap5 }}
	<!--Data buyer-->
	{% assign title = '_' | jtext: 'COM_JKASSA_DATA_BUYER' %}
	{{ 'addSlide' | bootstrap5: 'resultAccordian', title, 'data_buyer' }}
		{% include 'views/result/buyer' %}
	{{ 'endSlide' | bootstrap5 }}
	{% if delivery %}
	<!--Data delivery-->
	{% assign title = '_' | jtext: 'COM_JKASSA_DATA_DELIVERY' %}
	{{ 'addSlide' | bootstrap5: 'resultAccordian', title, 'data_delivery' }}
		{% include 'views/result/delivery' %}
	{{ 'endSlide' | bootstrap5 }}
	{% endif %}
{{ 'endAccordion' | bootstrap5 }}

<!--Continue shopping-->
<p class="text-center mt-4">
	<a class="btn btn-secondary btn-lg" href="{{ home_page }}">
		<span class="fas fa-chevron-right"></span>
		{{ '_' | jtext: 'COM_JKASSA_CART_CONTINUE_SHOPPING' }}
	</a>
</p>
{% else %}
<!--Print-->
<h4>{{ '_' | jtext: 'COM_JKASSA_YOUR_PURCHASES' }}</h4>
{% include 'views/result/products' %}
<h4>{{ '_' | jtext: 'COM_JKASSA_ORDER_DATA' }}</h4>
{% include 'views/result/payment' %}
<h4>{{ '_' | jtext: 'COM_JKASSA_DATA_BUYER' }}</h4>
{% include 'views/result/buyer' %}
{% if delivery %}
<h4>{{ '_' | jtext: 'COM_JKASSA_DATA_DELIVERY' }}</h4>
{% include 'views/result/delivery' %}
{% endif %}
{% endif %}

{% if posttext %}
<!--Posttext-->
<div class="mt-1">
	{{ posttext }}
</div>
{% endif %}