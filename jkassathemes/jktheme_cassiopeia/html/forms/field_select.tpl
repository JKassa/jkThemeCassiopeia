<div class="row mb-3"{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
	<label class="col-sm-4 col-form-label" for="{{ field.name }}">
		{{ field.label }}{% if field.required %} <span class="text-danger">*</span>{% endif %}
	</label>
	<div class="col-sm-8">
		<span{% if field.tooltip %} class="hasPopover" title="{{ field.label }}" data-content="{{ field.tooltip }}" data-placement="top"{% endif %}>
			<select
				name="{{ field.name }}"
				id="{{ field.name }}"
				class="form-select"
				{% if field.required %} required{% endif %}
				{% if field.readonly %} disabled{% endif %}
				{% if field.onchange %} onchange="{{ field.onchange }}"{% endif %}
			>
				{% for val in field.values %}
				<option value="{{ val.value }}"{% if field.default == val.value %} selected{% endif %}>{{ val.text }}</option>
				{% endfor %}
			</select>
		</span>
	</div>
</div>