{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ '' | registerAndUseStyle: 'jktheme.css' }}
{{ '' | registerAndUseScript: 'jktheme.js' }}
{{ 'loadAll5' | fontawesome }}

{% if viewtmpl != 'component' %}
	{% if heading %}
	<!--Heading-->
	<h1>{{ heading }}</h1>
	{% endif %}

	{% if title %}
	<!--Title-->
	<h2>
		{{ title }}
		<small>({{ total }})</small>
	</h2>
	{% endif %}

	{% if pretext %}
	<!--Pretext-->
	<div>
	  {{ pretext }}
	</div>
	{% endif %}
{% endif %}

{% if reviews_access %}
<div class="alert alert-warning">
	{{ 'sprintf' | jtext: 'COM_JKASSA_REVIEWS_AUTHORIZED_VIEW', login_url }}
</div>
{% else %}
	{% if reviews %}
		{% if viewtmpl != 'component' %}
		<!--Filters-->
		<form action="{{ form_action }}" method="post" name="reviewsForm" id="reviewsForm" class="mt-4">
			<div class="align-items-center mb-3">
				<!--Sort by-->
				<i class="fa fa-filter" aria-hidden="true" title="{{ '_' | jtext: 'COM_JKASSA_SORT_TITLE' }}"></i>
				<select onchange="this.form.submit()" name="filter_order" class="form-select form-select-sm" style="width: auto;">
					{% for sort in sorting %}
					<option value="{{ sort.value }}"{{ sort.selected }}>{{ sort.title }}</option>
					{% endfor %}
				</select>
				<!--Limit-->
				<div class="float-end">
					{{ '_' | jtext: 'JGLOBAL_DISPLAY_NUM' }}
					<select onchange="this.form.submit()" name="limit" title="{{ '_' | jtext: 'JSHOW' }}" class="form-select form-select-sm" style="width: auto;">
						{% for limit in limits %}
						<option value="{{ limit.value }}"{{ limit.selected }}>{{ limit.title }}</option>
						{% endfor %}
					</select>
				</div>
			</div>
		</form>
		{% endif %}

		<!--Reviews-->
		{% for review in reviews %}
		<div class="card mb-3">
			<div class="card-header">
				<div class="d-flex align-items-center">
					<a href="{{ review.product_url }}" class="flex-shrink-0 img-thumbnail" target="_top">
						<img alt="{{ review.product_alias }}" src="{{ review.product_image }}">
					</a>
					<div class="flex-grow-1 ms-3">
						<h4>
							<a href="{{ review.product_url }}" target="_top">
								{{ review.product_name }}
							</a>
						</h4>
						<!--Rating reviews-->
						<div>
							{% assign rating = review.product_rating %}
							{% assign rating_count = review.product_rating_count %}
							{% include 'html/reviews/rating' %}
						</div>
					</div>
				</div>
			</div>
			<div class="card-body">
				{% assign review_id     = review.id %}
				{% assign user_img      = review.user_img %}
				{% assign user_name     = review.user_name %}
				{% assign rating        = review.rating %}
				{% assign date     	    = review.date %}
				{% assign dignity       = review.dignity %}
				{% assign shortcomings  = review.shortcomings %}
				{% assign parent        = review.parent %}
				{% assign review_rating = review.review_rating %}
				{% assign children      = review.children %}
				{% assign product_id    = review.product_id %}
				{% assign review        = review.review %}
				{% include 'html/reviews/post' %}
			</div>
		</div>
		{% endfor %}
	{% else %}
		<div class="alert alert-info">
			{{ '_' | jtext: 'COM_JKASSA_REVIEWS_COUNT_0' }}
		</div>
	{% endif %}
{% endif %}

{% if posttext %}
<!--Posttext-->
<div>
  {{ posttext }}
</div>
{% endif %}

{% comment %}
	Pages links (pagination).
	See: html/pagination
{% endcomment %}
{{ pagesLinks }}
