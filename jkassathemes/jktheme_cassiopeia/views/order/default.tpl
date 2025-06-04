{{ 'tab' | bootstrap5 }}
{% assign options = 'trigger' | arrayCombine: 'hover' %}
{{ 'popover' | bootstrap5, '.hasPopover', options }}
{{ 'tooltip' | bootstrap5, '.hasTooltip' }}

<!--Header-->
{% if heading %}
<h1>{{ heading }}</h1>
{% else %}
<h2>{{ title }}</h2>
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
{% else %}

{% capture access_note %}
	{% if access_form %}
	<!--You do not have access-->
	<div class="alert alert-warning">
		<h4>{{ '_' | jtext: 'JGLOBAL_AUTH_ACCESS_GRANTED' }}</h4>
		{{ '_' | jtext: 'COM_JKASSA_ORDER_FORM_ACCESS' }}
	</div>
	{% endif %}
{% endcapture %}

{% capture limit_note %}
	{% if limit_order %}
	<!--Minimum order amount-->
	<div class="alert alert-warning mt-2">
		{% capture limit_cost %}{{ limit_order | costDisplay }}{{ currency.symbol }}{% endcapture %}
		<h4>{{ 'sprintf' | jtext: 'COM_JKASSA_LIMIT_ORDER', limit_cost }}</h4>
		{{ '_' | jtext: 'COM_JKASSA_LIMIT_ORDER_NOTE' }}
	</div>
	{% endif %}
{% endcapture %}

<div class="row mb-3">
	<div class="col-sm-7">
		{% if user_guest %}
		<ul class="nav nav-pills nav-fill mb-3" id="order-tab" role="tablist">
			<li role="presentation" class="nav-item">
				<a href="#" class="nav-link active" aria-controls="new_user" role="tab" data-bs-toggle="tab" data-bs-target="#new_user">
					{{ '_' | jtext: 'COM_JKASSA_ORDER_NEW_USER' }}
				</a>
			</li>
			<li role="presentation" class="nav-item">
				<a href="#" class="nav-link" role="tab" aria-controls="client" data-bs-toggle="tab" data-bs-target="#client">
					{{ '_' | jtext: 'COM_JKASSA_ORDER_REGULAR_CLIENT' }}
				</a>
			</li>
		</ul>
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane fade show active" id="new_user">
				{{ access_note }}{{ limit_note }}
				<!--Order form-->
				{{ form }}
			</div>
			<div role="tabpanel" class="tab-pane fade" id="client">
				<!--Login form-->
				{{ login_form }}
			</div>
		</div>
		{% else %}
			{{ access_note }}{{ limit_note }}
			<!--Order form-->
			{{ form }}
		{% endif %}
	</div>
	<div class="col-sm-5">
		<!--Order-->
		{{ order }}
	</div>
</div>
{% endif %}

<!--Button: 'Continue Shopping'-->
<div class="text-center mb-3">
	<a class="btn btn-secondary btn-lg" href="{{ home_page }}">
		<span class="fas fa-chevron-right"></span>
		{{ '_' | jtext: 'COM_JKASSA_CART_CONTINUE_SHOPPING' }}
	</a>
</div>
