<!--Name form-->
<h4>
	{{ name }}
</h4>

{% if pretext %}
<!--Pretext-->
<div>
	{{ pretext }}
</div>
{% endif %}

<form action="{{ form_action }}" method="post" id="jkOrderForm">
	{% if contacts_fields %}
	<!--Contacts fields-->
	<fieldset>
		<legend class="mb-3">{{ contacts_title }}</legend>
		{% for field in contacts_fields %}
			{% case field.type %}
				{% when 'firstname' %}
					{% include 'html/forms/field_text' %}
				{% when 'middlename' %}
					{% include 'html/forms/field_text' %}
				{% when 'lastname' %}
					{% include 'html/forms/field_text' %}
				{% when 'email' %}
					{% include 'html/forms/field_email' %}
				{% when 'phone' %}
					{% include 'html/forms/field_tel' %}
				{% when 'location' %}
					{% include 'html/forms/field_location' %}
				{% when 'address1' %}
					{% include 'html/forms/field_text' %}
				{% when 'address2' %}
					{% include 'html/forms/field_text' %}
				{% when 'postal_code' %}
					{% include 'html/forms/field_text' %}
				{% when 'website' %}
					{% include 'html/forms/field_url' %}
				{% when 'aboutme' %}
					{% include 'html/forms/field_textarea' %}
				{% when 'dob' %}
					{% include 'html/forms/field_calendar' %}
				{% when 'text' %}
					{% include 'html/forms/field_text' %}
				{% when 'textarea' %}
					{% include 'html/forms/field_textarea' %}
				{% when 'select' %}
					{% include 'html/forms/field_select' %}
				{% when 'radio' %}
					{% include 'html/forms/field_radio' %}
				{% when 'checkbox' %}
					{% include 'html/forms/field_checkbox' %}
				{% when 'mail' %}
					{% include 'html/forms/field_email' %}
				{% when 'tel' %}
					{% include 'html/forms/field_tel' %}
				{% when 'url' %}
					{% include 'html/forms/field_url' %}
				{% when 'calendar' %}
					{% include 'html/forms/field_calendar' %}
				{% when 'note' %}
					{% include 'html/forms/field_note' %}
				{% when 'html' %}
					{% include 'html/forms/field_html' %}
			{% endcase %}
		{% endfor %}
	</fieldset>
	{% endif %}

	{% if delivery_fields %}
	<!--Delivery fields-->
	<fieldset id="jk-order-delivery" class="mb-3">
		<legend class="mb-3">{{ delivery_title }}</legend>
		{% for delivery in delivery_fields %}
		<div class="radio"{% if delivery.showon %} data-showon='{{ delivery.showon }}'{% endif %}>
			<label class="card">
				<div class="card-body">
					<h5 class="card-title">
						<input
							type="radio"
							name="jk_delivery"
							id="{{ delivery.name }}"
							value="{{ delivery.name }}"
							{% if delivery.default %} checked{% endif %}
						>
						{{ delivery.label }}
					</h5>
					
					{% if delivery.logo %}
					<p class="card-text">
						<img src="{{ delivery.logo }}" class="img-thumbnail" alt="{{ delivery.name }}" style="max-width: 200px;" />
					</p>
					{% endif %}
					
					{% if delivery.cost != 0.00 %}
					<!--Cost of delivery-->
					<p class="card-text">
						{{ '_' | jtext: 'COM_JKASSA_COST_DELIVERY' }}:
						<strong>{{ delivery.cost | costDisplay }}{{ currency.symbol }}</strong>
					</p>
					{% endif %}
					
					{% if delivery.free != 0.00 %}
					<!--Free delivery-->
					<p class="card-text text-info">
						{{ '_' | jtext: 'COM_JKASSA_ORDER_FREE_DELIVERY' }}
						<strong>{{ delivery.free | costDisplay }}{{ currency.symbol }}</strong>
					</p>
					{% endif %}
					
					{% if delivery.tooltip %}
					<!--Description delivery-->
					<p class="card-text">
						{{ delivery.tooltip }}
					</p>
					{% endif %}

					{% if delivery_add_fields %}
						<!--Additional fields for delivery-->
						{% for field in delivery_add_fields %}
							{% if field.delivery == delivery.name %}
								{% case field.type %}
									{% when 'address1' %}
										{% include 'html/forms/field_text' %}
									{% when 'address2' %}
										{% include 'html/forms/field_text' %}
									{% when 'postal_code' %}
										{% include 'html/forms/field_text' %}
									{% when 'website' %}
										{% include 'html/forms/field_url' %}
									{% when 'aboutme' %}
										{% include 'html/forms/field_textarea' %}
									{% when 'dob' %}
										{% include 'html/forms/field_calendar' %}
									{% when 'text' %}
										{% include 'html/forms/field_text' %}
									{% when 'textarea' %}
										{% include 'html/forms/field_textarea' %}
									{% when 'select' %}
										{% include 'html/forms/field_select' %}
									{% when 'radio' %}
										{% include 'html/forms/field_radio' %}
									{% when 'checkbox' %}
										{% include 'html/forms/field_checkbox' %}
									{% when 'mail' %}
										{% include 'html/forms/field_email' %}
									{% when 'tel' %}
										{% include 'html/forms/field_tel' %}
									{% when 'url' %}
										{% include 'html/forms/field_url' %}
									{% when 'calendar' %}
										{% include 'html/forms/field_calendar' %}
									{% when 'note' %}
										{% include 'html/forms/field_note' %}
									{% when 'html' %}
										{% include 'html/forms/field_html' %}
								{% endcase %}
							{% endif %}
						{% endfor %}
					{% endif %}
				</div>
			</label>
		</div>
		{% endfor %}
	</fieldset>
	{% endif %}

	{% if payment_fields %}
	<!--Payment fields-->
	<fieldset id="jk-order-payment" class="mb-3">
		<legend class="mb-3">{{ payment_title }}</legend>
		{% for payment in payment_fields %}
		<div class="radio"{% if payment.showon %} data-showon='{{ payment.showon }}'{% endif %}>
			<label class="card">
				<div class="card-body">
					<h5 class="card-title">
						<input
							type="radio"
							name="jk_payment"
							id="{{ payment.name }}"
							value="{{ payment.name }}"
							{% if payment.default %} checked{% endif %}
						>
						{{ payment.label }}
					</h5>

					{% if payment.logo %}
					<p class="card-text">
						<img src="{{ payment.logo }}" class="img-thumbnail" alt="{{ payment.name }}" style="max-width: 200px;" />
					</p>
					{% endif %}
					
					{% if payment.tooltip %}
					<p class="card-text">
						{{ payment.tooltip }}
					</p>
					{% endif %}

					{% if payment_add_fields %}
						<!--Additional fields for payment-->
						{% for field in payment_add_fields %}
							{% if field.payment == payment.name %}
								{% case field.type %}
									{% when 'address1' %}
										{% include 'html/forms/field_text' %}
									{% when 'address2' %}
										{% include 'html/forms/field_text' %}
									{% when 'postal_code' %}
										{% include 'html/forms/field_text' %}
									{% when 'website' %}
										{% include 'html/forms/field_url' %}
									{% when 'aboutme' %}
										{% include 'html/forms/field_textarea' %}
									{% when 'dob' %}
										{% include 'html/forms/field_calendar' %}
									{% when 'text' %}
										{% include 'html/forms/field_text' %}
									{% when 'textarea' %}
										{% include 'html/forms/field_textarea' %}
									{% when 'select' %}
										{% include 'html/forms/field_select' %}
									{% when 'radio' %}
										{% include 'html/forms/field_radio' %}
									{% when 'checkbox' %}
										{% include 'html/forms/field_checkbox' %}
									{% when 'mail' %}
										{% include 'html/forms/field_email' %}
									{% when 'tel' %}
										{% include 'html/forms/field_tel' %}
									{% when 'url' %}
										{% include 'html/forms/field_url' %}
									{% when 'calendar' %}
										{% include 'html/forms/field_calendar' %}
									{% when 'note' %}
										{% include 'html/forms/field_note' %}
									{% when 'html' %}
										{% include 'html/forms/field_html' %}
								{% endcase %}
							{% endif %}
						{% endfor %}
					{% endif %}
				</div>
			</label>
		</div>
		{% endfor %}
	</fieldset>
	{% endif %}
	
	{% if privacy %}
	<!--Privacy Policy-->
	<fieldset class="mb-3">
		<legend class="mb-3">{{ privacy.legend }}</legend>
		<div class="alert alert-info">{{ privacy.note }}</div>
		<div class="row">
			<label class="col-sm-4" for="jk_privacy">
				{% if privacy.article %}
				{{ 'behavior.modal' | jhtml }}
				<a href="{{ privacy.article }}" data-bs-toggle="modal" data-bs-target="#jk-modal_privacy">
					{{ privacy.label }}
				</a>
				{% else %}
					{{ privacy.label }}
				{% endif %}
				<span class="text-danger">*</span>
			</label>
			<div class="col-sm-8">
				<fieldset id="jk_privacy" class="required hasTooltip" required="required" aria-required="true" title="{{ privacy.desc }}">
					<div class="form-check form-check-inline">
						<input id="jk_privacy0" name="jk_privacy" value="1" required="" aria-required="true" type="radio" class="form-check-input">
						<label for="jk_privacy0" class="form-check-label">{{ privacy.agree }}</label>
					</div>
					<div class="form-check form-check-inline">
						<input id="jk_privacy1" name="jk_privacy" value="0" checked="checked" required="" aria-required="true" type="radio" class="form-check-input">
						<label for="jk_privacy1" class="form-check-label">{{ '_' | jtext: 'JNO' }}</label>
					</div>
				</fieldset>
			</div>
		</div>
	</fieldset>
	{% endif %}

	{% if rules %}
	<!--Shop rules-->
	<div class="mb-3 form-check">
		<input type="checkbox" id="jk_rules" name="jk_rules" value="1" class="form-check-input">
		<label class="form-check-label" for="jk_rules">
			<a href="#" data-bs-toggle="modal" data-bs-target="#jk-modal_rules">
				{{ '_' | jtext: 'COM_JKASSA_ENABLEPROCESS' }}
			</a>
		</label>
	</div>
	{% endif %}

	{% if captcha %}
	<!--CAPTCHA-->
	<div class="mb-3">
		{{captcha}}
	</div>
	{% endif %}

	<button type="submit" data-click="order-form" class="btn btn-primary btn-lg mb-3">
		<span class="fas fa-check"></span>
		{{ '_' | jtext: 'COM_JKASSA_SEND_ORDER' }}
	</button>
</form>

{% if posttext %}
<!--Posttext-->
<div class="mt-3">
	{{ posttext }}
</div>
{% endif %}

{% if privacy.article %}
	<!--Madal body for Privacy-->
	{% capture footer_modal %}
	<button type="button" class="btn btn-primary" data-bs-dismiss="modal">
		{{ '_' | jtext: 'COM_JKASSA_CLOSE' }}
	</button>
	{% endcapture %}
	{% assign options = 'title,url,footer,bodyHeight' | arrayCombine: privacy.legend, privacy.article, footer_modal, 80 %}
	{{ 'renderModal' | bootstrap5: 'jk-modal_privacy', options }}
{% endif %}

{% if rules %}
	<!--Madal body for Rules-->
	{% capture footer_modal %}
	<button type="button" class="btn btn-primary" data-bs-dismiss="modal">
		{{ '_' | jtext: 'COM_JKASSA_CLOSE' }}
	</button>
	{% endcapture %}
	{% assign modal_title = '_' | jtext: 'COM_JKASSA_SHOP_RULES' %}
	{% assign options = 'title,footer,bodyHeight' | arrayCombine: modal_title, footer_modal, 70 %}
	{{ 'renderModal' | bootstrap5: 'jk-modal_rules', options, rules }}
{% endif %}
