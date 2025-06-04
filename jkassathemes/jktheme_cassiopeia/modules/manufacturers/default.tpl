{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ '' | registerAndUseStyle: 'jktheme.css' }}

<div class="jkassa jk-manufacturers-module {{ class_sfx }}">
	{% if manufacturers %}
		{% capture block_height %}{% if block_height %}height: {{ block_height }}px;{% endif %}{% endcapture %}
		{% case layout %}
			{% when 'blocks' %}
				{% include 'modules/manufacturers/blocks' %}
			{% when 'carousel' %}
				{% include 'modules/manufacturers/carousel' %}
			{% else %}
				{% include 'modules/manufacturers/list' %}
		{% endcase %}
	{% else %}
	<div class="alert alert-info">
		{{ '_' | jtext: 'JGLOBAL_NO_MATCHING_RESULTS' }}
	</div>
	{% endif %}
</div>
