<div class="row mb-3"{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
	<label class="col-sm-4 col-form-label" for="{{ field.name }}">
		{{ field.label }}{% if field.required %} <span class="text-danger">*</span>{% endif %}
	</label>
	<div class="col-sm-8">
		<textarea
			id="{{ field.name }}"
			name="{{ field.name }}"
			placeholder="{{ field.placeholder }}"
			{% if field.required %} required{% endif %}
			{% if field.readonly %} readonly{% endif %}
			{% if field.tooltip %} class="form-control hasPopover" title="{{ field.label }}" data-content="{{ field.tooltip }}" data-placement="top"{% else %} class="form-control"{% endif %}
		>{{ field.default }}</textarea>
	</div>
</div>