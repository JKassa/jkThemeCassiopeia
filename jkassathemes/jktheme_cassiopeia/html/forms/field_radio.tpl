<div class="row mb-3"{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
	<label class="col-sm-4 col-form-label" for="{{ field.name }}">
		{{ field.label }}{% if field.required %} <span class="text-danger">*</span>{% endif %}
	</label>
	<div class="col-sm-8">
		<span{% if field.tooltip %} class="hasPopover" title="{{ field.label }}" data-content="{{ field.tooltip }}" data-placement="top"{% endif %}>
			{% for val in field.values %}
			<div class="radio">
				<label>
					<input
						type="radio"
						name="{{ field.name }}"
						value="{{ val.value }}"
						{% if field.default == val.value %} checked{% endif %}
						{% if field.readonly %} disabled{% endif %}
						{% if field.required %} required{% endif %}
					>
					{{ val.text }}
				</label>
			</div>
			{% endfor %}
		</span>
	</div>
</div>