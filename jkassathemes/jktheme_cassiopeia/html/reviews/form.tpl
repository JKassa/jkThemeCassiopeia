<form id="reviewForm">
    <div class="row mb-3">
		<div class="offset-sm-4 col-sm-8">
            <label for="reviewRatingStar1" class="review-star-big hasTooltip" title="{{ '_' | jtext: 'COM_JKASSA_REVIEWS_1' }}">
                <input type="radio" name="reviewRatingStar" id="reviewRatingStar1" value="1" style="display: none">
            </label>
            <label for="reviewRatingStar2" class="review-star-big hasTooltip" title="{{ '_' | jtext: 'COM_JKASSA_REVIEWS_2' }}">
                <input type="radio" name="reviewRatingStar" id="reviewRatingStar2" value="2" style="display: none">
            </label>
            <label for="reviewRatingStar3" class="review-star-big hasTooltip" title="{{ '_' | jtext: 'COM_JKASSA_REVIEWS_3' }}">
                <input type="radio" name="reviewRatingStar" id="reviewRatingStar3" value="3" style="display: none">
            </label>
            <label for="reviewRatingStar4" class="review-star-big hasTooltip" title="{{ '_' | jtext: 'COM_JKASSA_REVIEWS_4' }}">
                <input type="radio" name="reviewRatingStar" id="reviewRatingStar4" value="4" style="display: none">
            </label>
            <label for="reviewRatingStar5" class="review-star-big hasTooltip" title="{{ '_' | jtext: 'COM_JKASSA_REVIEWS_5' }}">
                <input type="radio" name="reviewRatingStar" id="reviewRatingStar5" value="5" style="display: none">
            </label>
		</div>
    </div>
    <div class="row mb-3">
        <label class="col-form-label col-sm-4" for="reviewDignity">
			{{ '_' | jtext: 'COM_JKASSA_REVIEWS_DIGNITY' }}
		</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" id="reviewDignity" name="reviewDignity">
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-form-label col-sm-4" for="reviewShortcomings">
			{{ '_' | jtext: 'COM_JKASSA_REVIEWS_SHORTCOMINGS' }}
		</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" id="reviewShortcomings" name="reviewShortcomings">
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-form-label col-sm-4" for="reviewReview">
			{{ '_' | jtext: 'COM_JKASSA_REVIEWS_REVIEW' }}
		</label>
        <div class="col-sm-6">
            <textarea id="reviewReview" class="form-control" name="reviewReview"></textarea>
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-form-label col-sm-4" for="reviewName">
			{{ '_' | jtext: 'COM_JKASSA_YOUR_NAME' }}
		</label>
        <div class="col-sm-6">
			{% if user_name %}{% assign readonly_name = ' readonly' %}{% endif %}
            <input type="text" class="form-control" id="reviewName" name="reviewName" value="{{ user_name }}"{{ readonly_name }}>
        </div>
    </div>
    <div class="row mb-3">
        <label class="col-form-label col-sm-4" for="reviewEmail">
			{{ '_' | jtext: 'COM_JKASSA_YOUR_EMAIL' }}
		</label>
        <div class="col-sm-6">
			{% if user_email %}{% assign readonly_email = ' readonly' %}{% endif %}
            <input type="email"class="form-control" id="reviewEmail" name="reviewEmail" value="{{ user_email }}"{{ readonly_email }}>
        </div>
    </div>
	<div class="row mb-3">
        <div class="offset-sm-4 col-sm-8">
			<div class="form-check">
				<input class="form-check-input" type="checkbox" id="reviewNotify" name="reviewNotify" checked>
				<label class="form-check-label" for="reviewNotify">
					{{ '_' | jtext: 'COM_JKASSA_REVIEWS_NOTIFY_ME' }}
				</label>
			</div>
		</div>
    </div>
    <div class="row mb-3">
        <div class="offset-sm-4 col-sm-8">
            <a href="#" class="btn btn-primary" data-click="send-review">
				<i class="fas fa-comment"></i>
				{{ '_' | jtext: 'COM_JKASSA_REVIEWS_SEND' }}
			</a>
		</div>
    </div>
	<input type="hidden" name="productID" value="{{ id }}">
</form>
