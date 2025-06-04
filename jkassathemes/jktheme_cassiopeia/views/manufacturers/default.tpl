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

<!--List items-->
{% if items %}
<form action="{{ form_action }}" method="post" name="manufacturersForm" id="manufacturersForm">
	<div style="height: 31px;">
		<div class="row float-end">
			<div class="col-auto">
				<span class="form-text">
					{{ '_' | jtext: 'JGLOBAL_DISPLAY_NUM' }}
				</span>
			</div>
			<div class="col-auto">
				<select onchange="this.form.submit()" name="limit" title="{{ '_' | jtext: 'JSHOW' }}" class="form-select form-select-sm" style="width: auto;">
					{% for limit in limits %}
					<option value="{{ limit.value }}"{{ limit.selected }}>{{ limit.title }}</option>
					{% endfor %}
				</select>
			</div>
		</div>
	</div>
	{% for item in items %}
	<div class="d-flex align-items-center">
		<a class="flex-shrink-0 img-thumbnail" href="{{ item.url }}">
			<img {{ item.thumbnail | img_exists: '35x35' }} alt="{{ item.alias }}" />
		</a>
		<div class="flex-grow-1 ms-3">
			<h5 class="mt-0">
				<a href="{{ item.url }}">
					{{ item.name }}
				</a>
				&nbsp;
				<small class="text-muted">
					({{ 'plural' | jtext: 'COM_JKASSA_PRODUCTS_QUANTITY', item.products_quantity }})
				</small>
			</h5>
			
			{% comment %}
				Joomla events (fields).
			{% endcomment %}
			{{ item.event.afterDisplayTitle }}
			
			{{ item.introtext }}
		</div>
	</div>
	{% endfor %}

	{% comment %}
		Pages links (pagination).
		See: html/pagination
	{% endcomment %}
	{{ pagesLinks }}
</form>
{% else %}
<div class="alert alert-warning">
	{{ no_items }}
</div>
{% endif %}

{% if posttext %}
<!--Posttext-->
<div class="mt-3">
	{{ posttext }}
</div>
{% endif %}
