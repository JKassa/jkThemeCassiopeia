<fieldset id="jk_location" class="row mb-3"{% if field.showon %} data-showon='{{ field.showon }}'{% endif %}>
	<div class="row">
		<legend class="col-form-label col-sm-4">
			{{ field.label }}{% if field.required %} <span class="text-danger">*</span>{% endif %}
		</legend>
		<div id="{{ field.name }}" class="col-sm-8 hasPopover" title="{{ field.label }}" data-content="{{ field.tooltip }}" data-placement="top">
			<div class="" id="jk_locations_countries_wrapper">
				<label for="jk_locations_countries" class="d-none">{{ '_' | jtext: 'COM_JKASSA_COUNTRY' }}</label>
				<select name="jk_locations_countries" id="jk_locations_countries" class="form-select"{% if field.required %} required{% endif %}>
					<option value="0">{{ '_' | jtext: 'COM_JKASSA_COUNTRY_SELECT' }}</option>
				</select>
			</div>
			<div class="mt-1" id="jk_locations_regions_wrapper" style="display: none">
				<label for="jk_locations_regions" class="d-none">{{ '_' | jtext: 'COM_JKASSA_STATE' }}</label>
				<select name="jk_locations_regions" id="jk_locations_regions" class="form-select"{% if field.required %} required{% endif %}>
					<option value="0">{{ '_' | jtext: 'COM_JKASSA_STATE_SELECT' }}</option>
				</select>
			</div>
			<div class="mt-1" id="jk_locations_cities_wrapper" style="display: none">
				<label for="jk_locations_cities" class="d-none">{{ '_' | jtext: 'COM_JKASSA_CITY' }}</label>
				<joomla-field-fancy-select {{ field.city_attr }}>
					<select name="jk_locations_cities" id="jk_locations_cities" class="form-select"{% if field.required %} required{% endif %}>
						<option value="0">{{ '_' | jtext: 'COM_JKASSA_CITY_SELECT' }}</option>
					</select>
				</joomla-field-fancy-select>
			</div>
		</div>
	</div>
</fieldset>
