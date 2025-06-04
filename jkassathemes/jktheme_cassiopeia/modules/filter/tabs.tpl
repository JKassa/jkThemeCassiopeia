{{ '' | registerAndUseStyle: 'jktheme.css' }}
{{ 'tooltip' | bootstrap5, '.hasTooltip' }}
{{ 'tab' | bootstrap5 }}

<form action="{{ action }}" method="post" id="mod_jkassa_filter_form">
	<ul class="nav nav-pills nav-fill mb-2" id="jkassaFilterTabs" role="tablist">
		{% if filter_cost %}
			{% if active == 'cost' %}
				{% assign active_cost = ' active' %}
				{% assign select_cost = 'true' %}
			{% else %}
				{% assign active_cost = '' %}
				{% assign select_cost = 'false' %}
			{% endif %}
		<li class="nav-item">
			<a class="nav-link{{ active_cost }}" id="filterCost-tab" data-bs-toggle="tab" href="#filterCost" role="tab" aria-controls="filterCost" aria-selected="{{ select_cost }}">
				{{ 'sprintf' | jtext: 'MOD_JKASSA_FILTER_COST', symbol }}
			</a>
		</li>
		{% endif %}
		{% if manufacturers %}
			{% if active == 'manufacturers' %}
				{% assign active_man = ' active' %}
				{% assign select_man = 'true' %}
			{% else %}
				{% assign active_man = '' %}
				{% assign select_man = 'false' %}
			{% endif %}
		<li class="nav-item">
			<a class="nav-link{{ active_man }}" id="filterManufacturers-tab" data-bs-toggle="tab" href="#filterManufacturers" role="tab" aria-controls="filterManufacturers" aria-selected="{{ select_man }}">
				{{ '_' | jtext: 'MOD_JKASSA_FILTER_MANUFACTURERS' }}
			</a>
		</li>
		{% endif %}
		{% if attributes %}
			{% if active == 'attributes' %}
				{% assign active_attr = ' active' %}
				{% assign select_attr = 'true' %}
			{% else %}
				{% assign active_attr = '' %}
				{% assign select_attr = 'false' %}
			{% endif %}
		<li class="nav-item">
			<a class="nav-link{{ active_attr }}" id="filterAttributes-tab" data-bs-toggle="tab" href="#filterAttributes" role="tab" aria-controls="filterAttributes" aria-selected="{{ select_attr }}">
				{{ '_' | jtext: 'MOD_JKASSA_FILTER_MORE_FILTERS' }}
			</a>
		</li>
		{% endif %}
	</ul>
	<div class="tab-content" id="jkassaFilterTabsContent">
		{% if filter_cost %}
		<!--Filter cost-->
		<div class="tab-pane fade{% if active == 'cost' %} show active{% endif %}" id="filterCost" role="tabpanel" aria-labelledby="filterCost-tab">
			<!--Costs-->
			<div class="row">
				<div class="col">
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">
								{{ '_' | jtext: 'MOD_JKASSA_FILTER_ON' }}
							</span>
						</div>
						<input type="text" id="min_cost" name="min_cost" placeholder="{{ min_default }}" class="form-control" value="{{ min_cost }}" />
					</div>
				</div>
				<!--Slider-->
				{% if slider %}
				<div class="col-6 jk-slider-filter">
					<div id="jk_slider_filter"></div>
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
				</div>
				<div class="col">
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
		<div class="tab-pane fade{% if active == 'manufacturers' %} show active{% endif %}" id="filterManufacturers" role="tabpanel" aria-labelledby="filterManufacturers-tab">
			<ul class="list-inline text-center">
				{% for manufacturer in manufacturers %}
				<li class="checkbox">
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
				</li>
				{% endfor %}
			</ul>
		</div>
		{% endif %}
		
		{% if attributes %}
		<!--Filter attributes-->
		<div class="tab-pane fade{% if active == 'attributes' %} show active{% endif %}" id="filterAttributes" role="tabpanel" aria-labelledby="filterAttributes-tab">
			<div class="row horizontal-filters">
				{% for attribute in attributes %}
				<div class="col-12 col-sm-4 mb-3">
					<h5>
						{{ attribute.name }}
						{% if attribute.tooltip %}
						<small class="hasTooltip" title="{{ attribute.tooltip }}">
							<i class="fas fa-info-circle"></i>
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
			</div>
		</div>
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
	</div>
</form>