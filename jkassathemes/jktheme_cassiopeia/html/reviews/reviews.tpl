{% if reviews_access %}
	<div class="alert alert-warning">
		{{ 'sprintf' | jtext: 'COM_JKASSA_REVIEWS_AUTHORIZED_VIEW', login_url }}
	</div>
{% else %}

	<!--Reviews-->
	<div id="jkReviews">
		{% if reviews %}
			{{ reviews }}
		{% else %}
		<div class="alert alert-info alert-info" id="noPosts">
			{{ '_' | jtext: 'COM_JKASSA_REVIEWS_NO' }}
		</div>
		{% endif %}
	</div>

	{% if reviews_more %}
	<div class="text-center mt-3">
		<a href="#" class="btn btn-lg btn-link" data-click="more-reviews" data-id="{{ id }}" data-limitstart="0">
			<span class="fas fa-repeat"></span>
			{{ '_' | jtext: 'COM_JKASSA_MORE' }}
		</a>
	</div>
	{% endif %}

	<!--Form-->
	{% if reviews_access_form %}
	<div class="alert alert-warning">
		{{ 'sprintf' | jtext: 'COM_JKASSA_REVIEWS_AUTHORIZED_POST', login_url }}
	</div>
	{% else %}
	<div class="mt-3">
		{% include 'html/reviews/form' %}
	</div>
	{% endif %}
{% endif %}