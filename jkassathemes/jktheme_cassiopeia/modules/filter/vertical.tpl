{{ '' | registerAndUseStyle: 'jktheme.css' }}
{{ 'tooltip' | bootstrap5, '.hasTooltip' }}

<form action="{{ action }}" method="post" id="mod_jkassa_filter_form" class="vertical-filters">
	{% if filter_cost %}
	<!--Filter cost-->
	<div class="jk-filter">
		<h5>
			{{ 'sprintf' | jtext: 'MOD_JKASSA_FILTER_COST', symbol }}
		</h5>
		<!--Slider-->
		{% if slider %}
		<div class="jk-slider-filter">
			<div id="jk_slider_filter"></div>
		</div>
		<script type="text/javascript">
			// slide fix conflict with mootools
			if (typeof jQuery != 'undefined' && typeof MooTools != 'undefined' ) {
				Element.implement({
					slide: function(how, mode){
						return this;
					}
				});
			}
		</script>
		{% endif %}
		<!--Costs-->
		<div class="row">
			<div class="col-6">
				<div class="input-group">
					<div class="input-group-prepend">
						<span class="input-group-text">
							{{ '_' | jtext: 'MOD_JKASSA_FILTER_ON' }}
						</span>
					</div>
					<input type="text" id="min_cost" name="min_cost" placeholder="{{ min_default }}" class="form-control" value="{{ min_cost }}" />
				</div>
			</div>
			<div class="col-6">
				<div class="input-group">
					<input type="text" id="max_cost" name="max_cost" placeholder="{{ max_default }}" class="form-control" value="{{ max_cost }}" />
					<div class="input-group-append">
						<span class="input-group-text">
							{{ '_' | jtext: 'MOD_JKASSA_FILTER_TO' }}
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	{% endif %}

	{% if manufacturers %}
	<!--Filter manufacturers-->
	<div class="jk-filter">
		<h5>
			{{ '_' | jtext: 'MOD_JKASSA_FILTER_MANUFACTURERS' }}
		</h5>
		{% for manufacturer in manufacturers %}
		<div class="checkbox">
			<label>
				<input
					id="manufacturer_{{ manufacturer.id }}"
					type="checkbox"
					name="manufacturer[]"
					value="{{ manufacturer.id }}"
					{% if manufacturer.checked %}checked{% endif %}
				/>
				{% if manufacturer.thumbnail %}
				<img src="{{ manufacturer.thumbnail }}" alt="{{ manufacturer.alias }}" style="max-height: 50px; max-width: 50px;" />
				{% endif %}
				{{ manufacturer.name }}
				{% if manufacturer.products %}
				<small class="text-muted">
					({{ manufacturer.products }})
				</small>
				{% endif %}
			</label>
		</div>
		{% endfor %}
	</div>
	{% endif %}

	{% if attributes %}
	<!--Filter attributes-->
	{% for attribute in attributes %}
	<div class="jk-filter">
		<h5>
			{{ attribute.name }}
			{% if attribute.tooltip %}
			<small class="hasTooltip" title="{{ attribute.tooltip }}">
				<span class="fas fa-info-circle"></span>
			</small>
			{% endif %}
		</h5>
		{% for value in attribute.values %}
		<div class="checkbox">
			<label>
				<input
					id="attribute_{{ attribute.id }}_{{ value.key }}"
					type="checkbox"
					name="attribute[{{ attribute.id }}][]"
					value="{{ value.val }}"
					{% if value.checked %}checked{% endif %}
					{% if value.disabled %}disabled{% endif %}
				/>
				{% if value.disabled %}<small class="text-muted">{% endif %}
				{{ value.val }} {{ attribute.prefix }}
				{% if value.disabled %}</small>{% endif %}
				{% if value.count %}
				<small class="text-muted">
					({{ value.count }})
				</small>
				{% endif %}
			</label>
		</div>
		{% endfor %}
	</div>
	{% endfor %}
	{% endif %}

	{% if show_ok or show_reset %}
	<!--Buttons-->
	<div class="mt-2 float-end">
		{% if show_ok %}
		<button type="button" class="btn btn-sm btn-primary" data-click="submit-filter">
			<span class="fas fa-check"></span>
			{{ '_' | jtext: 'MOD_JKASSA_FILTER_OK' }}
		</button>
		{% endif %}
		{% if show_reset %}
		<button type="button" class="btn btn-primary btn-sm" data-click="reset-filter">
			<span class="fas fa-sync"></span>
			{{ '_' | jtext: 'MOD_JKASSA_FILTER_RESET' }}
		</button>
	{% endif %}
	</div>
	{% endif %}
</form>
