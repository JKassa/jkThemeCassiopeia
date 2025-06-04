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
<div class="row {{ class_sfx }}">
	{% if image %}
	<!--Image-->
	<div class="col-3">
		<a href="{{ url_compare }}">
			<img alt="compare" src="{{ image }}" title="{{ image_title }}">
		</a>
	</div>
	{% endif %}
	<div class="{% if image %}col-9{% else %}col-12{% endif %}">
		{% if categories %}
		<!--Categories-->
		<ul class="list-unstyled">
			{% for category in categories %}
			<li>
				{% if category.products_total == 1 %}
				<span title="{{ '_' | jtext: 'MOD_JKASSA_COMPARE_NOT_ENOUGH' }}">
					{{ category.title }}
					<small>({{ category.products_total }})</small>
				</span>
				{% else %}
				<a href="{{ category.url }}" title="{{ '_' | jtext: 'MOD_JKASSA_COMPARE_COMPARE' }}">
					{{ category.title }}
					<small>({{ category.products_total }})</small>
				</a>
				{% endif %}
				<!--remove compare category-->
				<a href="javascript:;" data-click="remove-compare-category" data-indexes="{{ category.indexes }}" title="{{ '_' | jtext: 'MOD_JKASSA_COMPARE_REMOVE' }}">
					<span class="fas fa-times text-danger"></span>
				</a>
			</li>
			{% endfor %}
		</ul>
		{% else %}
		<p class="text-muted">
			<em>
				{% if text_empty %}
					{{ text_empty }}
				{% else %}
					{{ '_' | jtext: 'MOD_JKASSA_COMPARE_YOUR_COMPARE_EMPTY' }}
				{% endif %}
			</em>
		</p>
		{% endif %}
	</div>
</div>
{% if categories %}
<!--URL: Go to comparison-->
<div class="card-footer text-center" style="margin: 0 -12px -8px;">
	<a href="{{ url_compare }}" class="btn btn-sm btn-primary">
		<i class="fas fa-chevron-right"></i>
		{{ '_' | jtext: 'JLIB_HTML_VIEW_ALL' }}
	</a>
</div>
{% endif %}
{% endcapture %}

<div class="jk-compare-module">
	<div class="jk-compare-popover">
		<button type="button" class="btn btn-sm btn-primary position-relative bg-transparent border-0" id="jk-compare-popover" data-bs-toggle="popover">
			<i class="fas fa-chart-bar fa-2x"></i>
			<span class="badge position-absolute top-0 translate-middle border border-light rounded-circle {% if categories %}bg-info{% else %}bg-secondary{% endif %}">
				{{ quantity_products }}
			</span>
		</button>
	</div>
	<div id="jk-compare-popover-content" style="display: none;">
		{{ popover_html }}
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function () {
		"use strict";
		var options = {
			html: true,
			placement: 'bottom',
			container: 'body',
			sanitize: false,
			title: "{{ '_' | jtext: 'MOD_JKASSA_COMPARE_YOUR_COMPARE' }}",
			content: $('#jk-compare-popover-content').html()
		}
		var comparePopover = document.getElementById('jk-compare-popover');
		var popover = new bootstrap.Popover(comparePopover, options);

		$(document).mouseup(function (e) {
			var container = $('.jk-compare-popover');

			if (container.has(e.target).length === 0) {
				$('.jk-compare-popover button').popover('hide');
			}
		});
	});
</script>
