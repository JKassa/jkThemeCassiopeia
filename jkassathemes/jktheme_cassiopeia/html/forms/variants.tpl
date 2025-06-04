{% for variant in variants %}
<div class="form-inline">
	<label class="my-1 me-2">{{ variant.name }}</label>

	{% case variant.type %} 

	{% when 'select' %}
	<!--Drop-down list-->
	<select data-select="variant-select" name="variant-{{ product }}-{{ variant.id }}" class="form-select form-select-sm my-1 me-sm-2">
		{% for attribute in variant.attributes %}
		<option value="{{ attribute.value }}" data-attr-title="{{ attribute.title }}"{% if attribute.default %} selected{% endif %}>
			{{ attribute.value }}
		</option>
		{% endfor %}
	</select>

	{% when 'radio' %}
	<!--Group switches-->
	{% for attribute in variant.attributes %}
	<label class="variant-radio-value my-1 me-sm-1">
		<input type="radio" class="me-sm-1" data-checked="variant-radio" data-attr-title="{{ attribute.title }}" name="variant-{{ product }}-{{ variant.id }}" value="{{ attribute.value }}"{% if attribute.default %} checked{% endif %}>
		<span>{{ attribute.value }}</span>
	</label>
	{% endfor %}

	{% when 'color' %}
	<!--Сolor switches-->
	{% for attribute in variant.attributes %}
	<label class="minicolors-swatch my-1 me-sm-1{% if attribute.default %} main{% endif %}" title="{{ attribute.title }}">
		<input type="radio" data-checked="variant-color" data-attr-title="{{ attribute.title }}" name="variant-{{ product }}-{{ variant.id }}" value="{{ attribute.value }}"{% if attribute.default %} checked{% endif %}>
		<span style="background-color: {{ attribute.value }};"></span>
	</label>
	{% endfor %}

	{% when 'texture' %}
	<!--Texture switches-->
	{% for attribute in variant.attributes %}
	<label class="minicolors-swatch my-1 me-sm-1{% if attribute.default %} main{% endif %}" title="{{ attribute.title }}">
		<input type="radio" data-checked="variant-texture" data-attr-title="{{ attribute.title }}" name="variant-{{ product }}-{{ variant.id }}" value="{{ attribute.value }}"{% if attribute.default %} checked{% endif %}>
		<img src="{{ attribute.img }}" alt="{{ attribute.alt }}">
	</label>
	{% endfor %}

	{% endcase %}

	{% if variant.tooltip %}
	<!--Tooltip-->
	<span class="hasPopover" title="{{ variant.name }}" data-content="{{ variant.tooltip }}" data-placement="top">
		<span class="fas fa-question-circle"></span>
	</span>
	{% endif %}
</div>
{% endfor %}

{% if user_variants %}
<!--Reset variants-->
<a href="#" data-click="variant-reset" data-id="{{ product }}" class="small" title="{{ '_' | jtext: 'COM_JKASSA_RESET_VARIANTS_TITLE' }}">
	<span class="fas fa-sync"></span>
	{{ '_' | jtext: 'COM_JKASSA_RESET_VARIANTS' }}
</a>
{% endif %}