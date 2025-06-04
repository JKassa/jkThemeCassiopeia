{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ '' | registerAndUseStyle: 'jktheme.css' }}
{{ 'loadAll5' | fontawesome }}

{% if reviews %}
<ul class="list-unstyled">
	{% for review in reviews %}
	<li class="d-flex align-items-center">
		{% if show_avatar %}
		<div class="flex-shrink-0">
			<img src="{{ review.user_img }}" alt="{{ review.user_name }}" class="rounded-circle">
		</div>
		{% endif %}
		<div class="flex-grow-1 ms-3">
			<h5>
				{{ review.user_name }} - <a href="{{ review.product_url }}">{{ review.product_name }}</a>
				{% if show_date %}
				<small class="float-end text-muted mt-2">
					<i class="far fa-clock"></i> {{ review.date }}
				</small>
				{% endif %}
			</h5>
			<p>{{ review.review }}</p>
		</div>
	</li>
	{% endfor %}
</ul>
{% else %}
<!--No reviews yet-->
<div class="alert alert-info">
	{{ '_' | jtext: 'MOD_JKASSA_REVIEWS_NO' }}
</div>
{% endif %}
