{{ 'loadAll5' | fontawesome }}

<!--Header-->
{% if heading %}
<h1>{{ heading }}</h1>
{% else %}
<h2>{{ title }}</h2>
{% endif %}

{% if pretext %}
<!--Pretext-->
<div>
	{{ pretext }}
</div>
{% endif %}

<form action="{{ form_action }}" name="searchForm" id="searchForm" method="get">
    <!--Search field-->
	<div class="input-group mt-3">
		<input type="text" name="searchword" maxlength="{{ maxlength }}" value="{{ origkeyword }}" class="form-control" />
		<div class="input-group-append">
			<button type="submit" class="btn btn-outline-secondary">
				<span class="fas fa-search"></span>
				{{ '_' | jtext: 'JGLOBAL_LOOKING_FOR' }}
			</button>
		</div>
	</div>
	
	{% if search_phrases %}
    <!--Filter search-->
	<div class="mt-3">
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" value="all" id="searchphraseall" name="searchphrase"{% if searchphrase == 'all' %} checked="checked"{% endif %}>
			<label class="form-check-label" id="searchphraseall-lbl" for="searchphraseall">
				{{ '_' | jtext: 'COM_JKASSA_ALL_WORDS' }}
			</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" value="any" id="searchphraseany" name="searchphrase"{% if searchphrase == 'any' %} checked="checked"{% endif %}>
			<label class="form-check-label" id="searchphraseany-lbl" for="searchphraseany">
				{{ '_' | jtext: 'COM_JKASSA_ANY_WORDS' }}
			</label>
		</div>
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="radio" value="exact" id="searchphraseexact" name="searchphrase"{% if searchphrase == 'exact' %} checked="checked"{% endif %}>
			<label class="form-check-label" id="searchphraseexact-lbl" for="searchphraseexact">
				{{ '_' | jtext: 'COM_JKASSA_EXACT_PHRASE' }}
			</label>
		</div>
	</div>
    {% endif %}
	
    {% if searchareas %}
	<div class="mt-2">
		{% for areas in searchareas %}
		<div class="form-check form-check-inline">
			<input class="form-check-input" type="checkbox" name="areas[]" value="{{ areas.value }}" id="area-{{ areas.value }}"{% if areas.checked %} checked="checked"{% endif %} />
			<label for="area-{{ areas.value }}" class="form-check-label">
				{{ areas.text }}
			</label>
		</div>
		{% endfor %}
	</div>
    {% endif %}

	{% if total %}
	<!--Total poducts-->
	<span class="form-text text-muted">
		{{ 'plural' | jtext: 'COM_JKASSA_SEARCH_KEYWORD_N_RESULTS', total }}
	</span>
	{% endif %}

	<input type="hidden" name="view" value="search" />
	<input type="hidden" name="option" value="com_jkassa" />
</form>

{% if posttext %}
<!--Posttext-->
<div class="mt-3">
	{{ posttext }}
</div>
{% endif %}