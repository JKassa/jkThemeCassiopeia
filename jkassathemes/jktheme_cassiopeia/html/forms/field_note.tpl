{% case field.default %}
	{% when 'message' %}
		{% assign class = ' alert-success' %}
	{% when 'notice' %}
		{% assign class = ' alert-info' %}
    {% when 'warning' %}
		{% assign class = ' alert-warning' %}
	{% when 'error' %}
		{% assign class = ' alert-danger' %}
	{% else %}
		{% assign class = ' alert-dark' %}
{% endcase %}
<div class="mb-0"{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
	<div class="alert{{ class }}" role="alert">
		{% if field.label %}<h4>{{ field.label }}</h4>{% endif %}
		{{ field.tooltip }}
	</div>
</div>