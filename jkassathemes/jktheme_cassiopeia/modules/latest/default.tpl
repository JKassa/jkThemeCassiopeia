{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ '' | registerAndUseStyle: 'jktheme.css' }}
{{ '' | registerAndUseScript: 'jktheme.js' }}

<div class="jkassa jk-latest-module {{ class_sfx }}">
	{% if products %}
		{% capture block_height %}{% if block_height %}height: {{ block_height }}px;{% endif %}{% endcapture %}
		{% capture img_block_height %}{% if img_height %}height: {{ img_height | plus: 8 }}px;{% endif %}{% endcapture %}
		{% capture img_height %}{% if img_height %}max-width: 100%; max-height: {{ img_height }}px;{% endif %}{% endcapture %}
		{% assign btns = 0 | plus: readmore, to_cart, to_wishlist, to_compare %}
		{% case layout %}
			{% when 'blocks' %}
				{% include 'modules/latest/blocks' %}
			{% when 'carousel' %}
				{% include 'modules/latest/carousel' %}
			{% else %}
				{% include 'modules/latest/list' %}
		{% endcase %}
	{% else %}
	<div class="alert alert-info">
		{{ '_' | jtext: 'JGLOBAL_NO_MATCHING_RESULTS' }}
	</div>
	{% endif %}
</div>
