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

<!-- Link -->
<p class="text-center">
	<strong>{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_LINK' }}:</strong><br>
	<code>{{ link }}</code>
</p>

<!--Widgets-->
<div class="row cards mb-3">
	{% if aff_income %}
	<div class="col-md-4">
		<div class="card text-center">
			<h3>
				{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_TRANSACTIONS' }}
				<span class="badge">{{ aff_items | size }}</span>
			</h3>
			<p>
				{% for inc in aff_income %}
				{{ inc.sum }}{{ inc.currency }}<br>
				{% endfor %}
			</p>
		</div>
	</div>
	{% endif %}
	{% if user_cash %}
	<div class="col-md-4">
		<div class="card text-center">
			<h3>
				{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_TO_PAYMENT' }}
			</h3>
			<p>
				{% for cash in user_cash %}
				{% if cash.available %}
				{{ cash.sum }}{{ cash.currency }}<br>
				{% else %}
				<small class="text-muted">({{ cash.sum }}{{ cash.currency }})</small><br>
				{% endif %}
				{% endfor %}
			</p>
		</div>
	</div>
	{% endif %}
	{% if pay_total %}
	<div class="col-md-4">
		<div class="card text-center">
			<h3>
				{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_PAYMENTS' }}
				<span class="badge">{{ pay_items | size }}</span>
			</h3>
			<p>
				{% for total in pay_total %}
				{{ total.sum }}{{ total.currency }}<br>
				{% endfor %}
			</p>
		</div>
	</div>
	{% endif %}
</div>

{{ 'startAccordion' | bootstrap5: 'affiliateAccordian' }}
{% if aff_items %}
<!--Transactions-->
{% assign title = '_' | jtext: 'COM_JKASSA_AFFILIATE_TRANSACTIONS' %}
{{ 'addSlide' | bootstrap5: 'affiliateAccordian', title, 'transactions' }}
<table class="table table-striped">
	<thead>
		<tr>
			<th>{{ '_' | jtext: 'JDATE' }}</th>
			<th>{{ '_' | jtext: 'JGLOBAL_DESCRIPTION' }}</th>
			<th>{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_INCOME' }}</th>
		</tr>
	</thead>
	<tbody>
		{% for aff in aff_items %}
		<tr>
			<td>{{ 'date' | jhtml: aff.modified, 'DATE_FORMAT_LC2' }}</td>
			<td>
				{% if aff.type == 1 %}
					{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_TYPE_1' }}
				{% else %}
					{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_TYPE_2' }}
				{% endif %}
			</td>
			<td>{{ aff.sum }}{{ aff.currency }}</td>
		</tr>
		{% endfor %}
	
</table>
{{ 'endSlide' | bootstrap5 }}
{% endif %}
{% if user_cash %}
<!--Withdrawal of funds-->
{% assign title = '_' | jtext: 'COM_JKASSA_AFFILIATE_WITHDRAWAL' %}
{{ 'addSlide' | bootstrap5: 'affiliateAccordian', title, 'withdrawal' }}
<p>
	<strong>{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_ON_YOUR_ACCOUNT' }}:</strong>
	{% for cash in user_cash %}
	<span class="label label-default">{{ cash.sum }}{{ cash.currency }}</span>
	{% endfor %}
	<br>
	<strong>{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_AVAILABLE' }}:</strong>
	{% if cash_available %}
	{% for cash in cash_available %}
	<span class="label label-success">{{ cash.sum }}{{ cash.currency }}</span>
	{% endfor %}
	{% else %}
	<span class="label label-default">0</span>
	{% endif %}
</p>
{% capture access_note %}
	{% if access_form %}
	<!--You do not have access-->
	<div class="alert alert-warning">
		<h4>{{ '_' | jtext: 'JGLOBAL_AUTH_ACCESS_GRANTED'  }}</h4>
		{{ '_' | jtext: 'COM_JKASSA_ORDER_FORM_ACCESS' }}
	</div>
	{% endif %}
{% endcapture %}
{{ access_note }}
<!--Paydata-->
{% if paydata %}
<ul class="list-unstyled">
	<li>
		<strong>{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_OUTPUT' }}:</strong> {{ paydata.name }}
	</li>
	{% for field in paydata.fields %}
	<li>
		{{ 'sprintf' | jtext: 'COM_JKASSA_STRONG_FIELDS', field.label, field.value }}
	</li>
	{% endfor %}
</ul>
<a href="javascript:;" onClick="jQuery('#jkAffiliateFormDiv').show(); jQuery(this).hide();" class="btn btn-info">
	{{ '_' | jtext: 'JGLOBAL_EDIT' }}
</a>
{% else %}
<div class="alert alert-info">
	{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_NO_OUTPUT' }}
</div>
<a href="javascript:;" onClick="jQuery('#jkAffiliateFormDiv').show(); jQuery(this).hide();" class="btn btn-info">
	{{ '_' | jtext: 'COM_JKASSA_ADD' }}
</a>
{% endif %}
<!--Form-->
<div id="jkAffiliateFormDiv" style="display: none">
	{{ form }}
</div>
{{ 'endSlide' | bootstrap5 }}
{% endif %}
{% if pay_items %}
<!--Payments-->
{% assign title = '_' | jtext: 'COM_JKASSA_AFFILIATE_PAYMENTS' %}
{{ 'addSlide' | bootstrap5: 'affiliateAccordian', title, 'payments' }}
<table class="table table-striped">
	<thead>
		<tr>
			<th>{{ '_' | jtext: 'JDATE' }}</th>
			<th>{{ '_' | jtext: 'COM_JKASSA_COMMENT' }}</th>
			<th>{{ '_' | jtext: 'COM_JKASSA_SUM' }}</th>
		</tr>
	</thead>
	<tbody>
		{% for pay in pay_items %}
		<tr>
			<td>{{ 'date' | jhtml: pay.date, 'DATE_FORMAT_LC2' }}</td>
			<td>{{ pay.comment }}</td>
			<td>{{ pay.sum }}{{ pay.currency }}</td>
		</tr>
		{% endfor %}
	
</table>
{{ 'endSlide' | bootstrap5 }}
{% endif %}
{% if banners %}
<!--Banners-->
{% assign title_slide = '_' | jtext: 'COM_JKASSA_AFFILIATE_BANNERS' %}
{{ 'addSlide' | bootstrap5: 'affiliateAccordian', title_slide, 'banners' }}
<p>{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_BANNERS_DESC'  }}</p>
{% for banner in banners %}
<h4>{{ banner.title }}</h4>
<div>{{ banner.code }}</div>
<div>
	<textarea class="form-control">{{ banner.code }}</textarea>
</div>
{% endfor %}
{{ 'endSlide' | bootstrap5 }}
{% endif %}
{{ 'endAccordion' | bootstrap5 }}

{% if posttext %}
<!--Posttext-->
<div>
	{{ posttext }}
</div>
{% endif %}