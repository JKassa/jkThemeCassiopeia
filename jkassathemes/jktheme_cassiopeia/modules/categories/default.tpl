{{ '' | registerAndUseStyle: 'jktheme.css' }}

{% case layout %}
	{% when 'accordion' %}
		{% capture parent %}mjkcategories-accordion-{{ categories[0].parent_id }}{% endcapture %}
	<div class="accordion {{ class_sfx }}" id="{{ parent }}">
		{% include 'modules/categories/accordion' %}
	</div>
    {% when 'dropdown' %}
		{{ 'dropdown' | bootstrap5: '.dropdown' }}
	<div class="{{ class_sfx }}">
		{% include 'modules/categories/dropdown' %}
	</div>
    {% else %}
	<ul class="list-unstyled {{ class_sfx }}">
		{% include 'modules/categories/list' %}
	</ul>
{% endcase %}
