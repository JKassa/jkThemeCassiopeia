{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ '' | registerAndUseStyle: 'jktheme.css' }}
{{ '' | registerAndUseScript: 'jktheme.js' }}

{% capture width_form %}{% if width_form %}width: {{ width_form }}px; margin: auto{% endif %}{% endcapture %}

<form action="{{ form_action }}" name="modSearchForm{{ autocomplete_id }}" id="modSearchForm{{ autocomplete_id }}" method="get" class="{{ class_sfx }}" style="{{ width_form }}">
	<div class="input-group">
		<div class="form-floating w-100">
			<input type="search" name="searchword" id="searchword{{ autocomplete_id }}" maxlength="{{ maxlength }}" class="form-control py-2 rounded-pill" placeholder="{{ '_' | jtext: 'MOD_JKASSA_SEARCH_PLACEHOLDER' }}">
			<label for="searchword{{ autocomplete_id }}">{{ '_' | jtext: 'MOD_JKASSA_SEARCH_PLACEHOLDER' }}</label>
			<button type="submit" class="btn rounded-pill border-0 position-absolute top-0 mt-2 end-0 me-2" title="{{ '_' | jtext: 'MOD_JKASSA_SEARCH_SEARCHBUTTON' }}">
				<i class="fas fa-search"></i>
			</button>
		</div>
	</div>
	<div id="jk-search-autocomplete{{ autocomplete_id }}"></div>
	<input type="hidden" name="view" value="search" />
	<input type="hidden" name="option" value="com_jkassa" />
</form>
