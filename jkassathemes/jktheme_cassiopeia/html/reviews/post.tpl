<div id="reviewPost{{ review_id }}" class="d-flex">
	<!--Img-->
	<div class="flex-shrink-0">
		<img src="{{ user_img }}" class="me-3 rounded-circle" alt="{{ user_name }}" style="width: 64px; height: 64px;">
	</div>
	<!--Body-->
	<div class="flex-grow-1 ms-3">
		<!--Name / Rating / Date-->
		<h5 class="mt-0">
			{{ user_name }}
			{% if rating %}
			<span class="review-stars-small">
				<span class="review-star-small review-star-{{ rating }}"></span>
			</span>
			{% endif %}
			<small class="float-end text-muted">
				<span class="far fa-clock"></span> {{ date }}
			</small>
		</h5>
		<!--Review-->
		{% if message %}
		<div class="alert alert-info">
			{{ message }}
		</div>
		{% endif %}
		<p>{{ review }}</p>
		{% if dignity %}
		<p><strong>{{ '_' | jtext: 'COM_JKASSA_REVIEWS_DIGNITY' }}:</strong> {{ dignity }}</p>
		{% endif %}
		{% if shortcomings %}
		<p><strong>{{ '_' | jtext: 'COM_JKASSA_REVIEWS_SHORTCOMINGS' }}:</strong> {{ shortcomings }}</p>
		{% endif %}
		<!--Toolbar-->
		<div class="row">
			<div class="col-md-6">
				{% if parent == 0 and access_reply != 1 %}
				<a href="#" data-click="show-reply" data-id="{{ review_id }}" class="btn btn-link">
					<span class="fas fa-share-alt"></span>
					{{ '_' | jtext: 'COM_JKASSA_REVIEWS_REPLY' }}
				</a>
				{% endif %}
			</div>
			<div class="col-md-6 text-end">
				<!--Rating-->
				{% if parent == 0 %}
				<a href="#" data-click="reviews-rating" data-rating="1" data-id="{{ review_id }}" class="btn btn-link hasTooltip" title="{{ '_' | jtext: 'COM_JKASSA_REVIEWS_HELPFUL' }}">
					<span class="fas fa-thumbs-up text-success"></span>
				</a>
				<span id="reviewRating{{ review_id }}" class="label label-default">{{ review_rating }}</span>
				<a href="#" data-click="reviews-rating" data-rating="-1" data-id="{{ review_id }}" class="btn btn-link hasTooltip" title="{{ '_' | jtext: 'COM_JKASSA_REVIEWS_NOT_HELPFUL' }}">
					<span class="fas fa-thumbs-down text-danger"></span>
				</a>
				{% endif %}
				{% if access_report != 1 %}
				<!--Report-->
				<a href="#" data-click="show-report" data-id="{{ review_id }}" class="btn btn-link hasTooltip" title="{{ '_' | jtext: 'COM_JKASSA_REVIEWS_REPORT_TITLE' }}">
					<span class="fas fa-exclamation-triangle text-warning"></span>
				</a>
				{% endif %}
			</div>
		</div>
		{% if parent == 0 and access_reply != 1 %}
		<!--Reply form-->
		<div class="review-popup" id="reviewReplyBlock{{ review_id }}" style="display: none">
			<form id="reviewReplyForm{{ review_id }}">
				<div class="row">
					<label for="reviewReplyReview">{{ '_' | jtext: 'MESSAGE' }}</label>
					<textarea class="form-control" id="reviewReview" name="reviewReview"></textarea>
				</div>
				<div class="row">
					<label for="reviewReplyName">{{ '_' | jtext: 'COM_JKASSA_YOUR_NAME' }}</label>
					{% if reply_name %}{% assign readonly_name = ' readonly' %}{% endif %}
					<input type="text" class="form-control" id="reviewReplyName" name="reviewName" value="{{ reply_name }}"{{ readonly_name }}>
				</div>
				<div class="row">
					<label for="reviewReplyEmail">{{ '_' | jtext: 'COM_JKASSA_YOUR_EMAIL' }}</label>
					{% if reply_email %}{% assign readonly_email = ' readonly' %}{% endif %}
					<input type="email" class="form-control" id="reviewReplyEmail" name="reviewEmail" value="{{ reply_email }}"{{ readonly_email }}>
				</div>
				<a href="#" class="btn btn-primary mt-2" data-click="send-reply" data-id="{{ review_id }}" data-toadd="> .media-body">
					{{ '_' | jtext: 'JSUBMIT' }}
				</a>
				<input type="hidden" name="productID" value="{{ product_id }}">
			</form>
		</div>
		{% endif %}
		{% if access_report != 1 %}
		<!--Report form-->
		<div class="review-popup report-block" id="reviewReportBlock{{ review_id }}" style="display: none">
			<form id="reviewReportForm{{ review_id }}">
				<div class="row">
					<label for="reviewReport">{{ '_' | jtext: 'MESSAGE' }}</label>
					<textarea class="form-control" id="reviewReport" name="reviewReport"></textarea>
				</div>
				<div class="row">
				<label for="reviewReportName">{{ '_' | jtext: 'COM_JKASSA_YOUR_NAME' }}</label>
					{% if reply_name %}{% assign readonly_name = ' readonly' %}{% endif %}
					<input type="text" class="form-control" id="reviewReportName" name="reviewName" value="{{ reply_name }}"{{ readonly_name }}>
				</div>
				<div class="row">
					<label for="reviewReportEmail">{{ '_' | jtext: 'COM_JKASSA_YOUR_EMAIL' }}</label>
					{% if reply_email %}{% assign readonly_email = ' readonly' %}{% endif %}
					<input type="email" class="form-control" id="reviewReportEmail" name="reviewEmail" value="{{ reply_email }}"{{ readonly_email }}>
				</div>
				<a href="#" class="btn btn-primary mt-2" data-click="send-report" data-id="{{ review_id }}">
					{{ '_' | jtext: 'JSUBMIT' }}
				</a>
				<input type="hidden" name="productID" value="{{ product_id }}">
			</form>
		</div>
		{% endif %}
		<!--Children-->
		{% if children %}
		  {{ children }}
		{% endif %}
	</div>
</div>