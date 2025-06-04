{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ '' | registerAndUseStyle: 'jktheme.css' }}

<div class="jkassa jk-wishlist-module {{ class_sfx }}">
	{% capture block_height %}{% if block_height %}height: {{ block_height }}px;{% endif %}{% endcapture %}
	{% capture img_block_height %}{% if img_height %}height: {{ img_height | plus: 8 }}px;{% endif %}{% endcapture %}
	{% capture img_height %}{% if img_height %}max-width: 100%; max-height: {{ img_height }}px;{% endif %}{% endcapture %}
	{% assign btns = 0 | plus: readmore, to_cart, to_compare, remove %}
	{% case layout %}
		{% when 'blocks' %}
			{% include 'modules/wishlist/blocks' %}
		{% when 'icon' %}
			{% include 'modules/wishlist/icon' %}
		{% else %}
			{% include 'modules/wishlist/list' %}
	{% endcase %}
</div>
