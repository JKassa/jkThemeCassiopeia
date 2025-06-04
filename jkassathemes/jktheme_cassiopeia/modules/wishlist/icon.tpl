{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ '' | registerAndUseStyle: 'jktheme.css' }}
{{ 'popover' | bootstrap5 }}
{{ 'loadAll5' | fontawesome }}

{% comment %}
	HTML code for the popover window.
{% endcomment %}
{% capture popover_html %}
<div class="row">
	<div class="col-12">
		{% if products %}
		<ul class="list-unstyled">
			{% for product in products %}
			<li>
				<a href="{{ product.url }}" data-click="select-product" data-id="{{ product.id }}">
					{{ product.name }}
				</a>
				<!--remove product-->
				<a href="javascript:;" data-click="remove-wishlist" data-index="{{ product.index }}" title="{{ '_' | jtext: 'MOD_JKASSA_WISHLIST_REMOVE' }}">
					<span class="fas fa-times text-danger" style="font-size:10px"></span>
				</a>
			</li>
			{% endfor %}
		</ul>
		{% else %}
		<p class="text-muted">
			<em>
				{{ text_empty }}
			</em>
		</p>
		{% endif %}
	</div>
</div>
{% if products %}
<!--URLs: Go to wish list & Remove from wishlist-->
<div class="card-footer text-center" style="margin: 0 -12px -8px;">
	<a href="{{ url_wishlist }}" class="btn btn-sm btn btn-primary">
		<i class="fas fa-chevron-right"></i>
		{{ '_' | jtext: 'JLIB_HTML_VIEW_ALL' }}
	</a>
	<a href="#" class="btn btn-sm btn-danger" data-click="remove-wishlist-all">
		<i class="fas fa-trash"></i>
		{{ '_' | jtext: 'JSEARCH_FILTER_CLEAR' }}
	</a>
</div>
{% endif %}
{% endcapture %}

<div class="jk-wishlist-popover">
	<button type="button" class="btn btn-sm btn-primary position-relative bg-transparent border-0" id="jk-wishlist-popover" data-bs-toggle="popover">
		<i class="fas fa-heart fa-2x"></i>
		<span class="badge position-absolute top-0 translate-middle border border-light rounded-circle {% if products %}bg-info{% else %}bg-secondary{% endif %}">
			{{ quantity }}
		</span>
	</button>
</div>
<div id="jk-wishlist-popover-content" style="display: none;">
	{{ popover_html }}
</div>
<script type="text/javascript">
	$(document).ready(function () {
		"use strict";
		var options = {
			html: true,
			placement: 'bottom',
			container: 'body',
			sanitize: false,
			title: "{{ '_' | jtext: 'MOD_JKASSA_WISHLIST_YOUR_WISHLIST' }}",
			content: $('#jk-wishlist-popover-content').html()
		}
		var wishlistPopover = document.getElementById('jk-wishlist-popover');
		var popover = new bootstrap.Popover(wishlistPopover, options);

		$(document).mouseup(function (e) {
			var container = $('.jk-wishlist-popover');

			if (container.has(e.target).length === 0) {
				$('.jk-wishlist-popover button').popover('hide');
			}
		});
	});
</script>
