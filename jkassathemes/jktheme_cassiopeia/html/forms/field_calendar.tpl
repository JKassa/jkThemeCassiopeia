<div class="row mb-3"{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
	<label class="col-sm-4 col-form-label" for="{{ field.name }}">
		{{ field.label }}{% if field.required %} <span class="text-danger">*</span>{% endif %}
	</label>
	<div class="col-sm-8 hasPopover"{% if field.tooltip %} title="{{ field.label }}" data-content="{{ field.tooltip }}" data-placement="top"{% endif %}>
		{% if field.required %}
			{% assign options = 'required' | arrayCombine: '' %}
			{{ 'calendar' | jhtml: field.default, field.name, field.name, field.filter, options }}
		{% else %}
			{{ 'calendar' | jhtml: field.default, field.name, field.name, field.filter }}
		{% endif %}
	</div>
</div>
<script type="text/javascript">
	jQuery('.field-calendar input').addClass('form-control');
	jQuery('.field-calendar .input-append').addClass('input-group');
	jQuery('.field-calendar .input-append').removeClass('input-append');
	jQuery('.field-calendar button').wrap('<div class="input-group-append"></div>');
	jQuery('.field-calendar .icon-calendar').addClass('fas fa-calendar-alt');
</script>