{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ 'tooltip' | bootstrap5, '.hasTooltip' }}
{{ '' | registerAndUseStyle: 'jktheme.css' }}
{{ '' | registerAndUseScript: 'jktheme.js' }}

<div class="row">
	<div class="col-4 product-image">
		<img {{ image | img_exists: '104x150' }} alt="{{ alias }}" class="img-fluid" />
		{% if present %}
		<!--Share (Product as a present)-->
		<div class="share hasTooltip" title="{{ 'tooltipText' | jhtml: present.name, present.desc }}">
			<div class="sharetitle">
				{{ '_' | jtext: 'COM_JKASSA_GIFT' }}
			</div>
			<div class="sharedesc">
				<a href="{{ present.url }}">
					<img {{ present.image | img_exists: '50x50' }} alt="{{ present.name }}">
				</a>
			</div>
		</div>
		{% endif %}
	</div>
	<div class="col-8">
		<h4>
			<a href="{{ url }}" target="_top">
				{{ name }}
			</a>
			{% if files %}
			<!--Files-->
			<small class="text-muted hasTooltip" title="<strong>{{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}:</strong><br>{{ files | join: '<br>' }}" data-placement="right">
				<i class="fas fa-download"></i>
			</small>
			{% endif %}
		</h4>

		<!--SKU (code)-->
		<div class="text-muted small mt-1">
			{{ '_' | jtext: 'COM_JKASSA_SKU' }}: {{ sku }}
		</div>

		{% if variants %}
		<div class="mt-2">
			{% for variant in variants %}
			{{ variant.name }}:
			{% case variant.type %}
			{% when 'radio' %}
			<span class="variant-radio-value">
				{{ variant.text }}
			</span>
			{% when 'color' %}
			<span class="minicolors-swatch">
				<span style="background-color: {{ variant.value }};" title="{{ variant.text }}"></span>
			</span>
			{% when 'texture' %}
			<span class="minicolors-swatch">
				<img src="{{ variant.img }}" alt="{{ variant.alt }}" title="{{ variant.text }}">
			</span>
			{% when 'select' %}
			<span>
				{{ variant.text }}
			</span>
			{% endcase %}
			{% endfor %}
		</div>
		{% endif %}

		<!--Cost-->
		<div class="mt-2">
			<!--old cost-->
			{% if old_cost %}
			<del class="text-muted">{{ old_cost }}{{ currency.symbol }}</del>
			{% endif %}
			<!--cost-->
			<span class="lead">{{ cost }}</span>{{ currency.symbol }}
			{% if vat %}
			<span class="text-muted small">
				({{ 'sprintf' | jtext: 'COM_JKASSA_VAT_INCL', vat }})
			</span>
			{% endif %}
		</div>
	</div>
</div>

<hr>

<form action="{{ form_action }}" method="post" id="waitingList">
	<fieldset>
		{% for field in fields %}
			{% case field.type %}
				{% when 'firstname' %}
					{% include 'html/forms/field_text' %}
				{% when 'email' %}
					{% include 'html/forms/field_email' %}
			{% endcase %}
		{% endfor %}
	</fieldset>
	<div class="row">
		<div class="col-sm-offset-3 col-sm-9">
			<input type="submit" data-click="waitinglist-form" class="btn btn-info mt-1" value="{{ '_' | jtext: 'JSUBMIT' }}">
		</div>
	</div>
</form>

<div class="alert alert-success" id="waitingListAlert" style="display:none">
	<h4>{{ '_' | jtext: 'COM_JKASSA_WAITINGLIST_N_1' }}</h4>
	{{ '_' | jtext: 'COM_JKASSA_WAITINGLIST_N_2' }}
</div>