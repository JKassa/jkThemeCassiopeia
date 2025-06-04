{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ '' | registerAndUseStyle: 'jktheme.css' }}

<!--Header-->
<div class="page-header">
    <h2>{{ title }}</h2>
</div>

<!--Desc-->
<p>{{ desc }}</p>

<!--Logo-->
<p style="text-align:center">
	<img src="{{ logo }}" alt="{{ key }}" class="img-thumbnail">
</p>

<!--Params-->
<legend class="mb-3">{{ name }}</legend>
<ul class="unstyled">
    {% for param in params %}
    <li>
		<strong>{{ param.name }}:</strong>
		{% if param.code %}<code>{% endif %}{{ param.value }}{% if param.code %}</code>
        {% endif %}
	</li>
    {% endfor %}
</ul>

<legend class="mb-3">{{ '_' | jtext: 'COM_JKASSA_TEST_IMITATION_TITLE' }}</legend>
<p>{{ '_' | jtext: 'COM_JKASSA_TEST_IMITATION_DESC' }}</p>

<div class="card text-center mb-3">
    <div class="card-body">
		{% if interaction %} 
        <!--Interaction-->
		<div class="row mb-3">
			<form action="{{ interaction.action }}" method="{{ interaction.method }}" name="{{ interaction.name }}" target="_blank" class="form-horizontal">
				{% for field in interaction.fields %}
					{% case field.type %}
						{% when 'hidden' %}
						<input type="hidden" name="{{ field.name }}" value="{{ field.value }}">
						{% when 'select' %}
							{% include 'html/forms/field_select' %}
						{% when 'submit' %}
						<button type="submit" class="btn btn-dark" title="{{ field.title }}">
							<i class="fas fa-sync"></i> {{ field.value }}
						</button>
					{% endcase %}
				{% endfor %}
			</form>
		</div>
		<hr>
        {% endif %}
		<div class="row">
			{% if pending %} 
			<!--Pending-->
			<div class="col">
				<form action="{{ pending.action }}" method="{{ pending.method }}" name="{{ pending.name }}" target="_blank">
					{% for field in pending.fields %}
						{% case field.type %}
							{% when 'hidden' %}
							<input type="hidden" name="{{ field.name }}" value="{{ field.value }}">
							{% when 'submit' %}
							<button type="submit" class="btn btn-warning" title="{{ field.title }}">
								<i class="fas fa-clock"></i> {{ field.value }}
							</button>
						{% endcase %}
					{% endfor %}
				</form>
			</div>
			{% endif %}
			{% if success %} 
			<!--Success-->
			<div class="col">
				<form action="{{ success.action }}" method="{{ success.method }}" name="{{ success.name }}" target="_blank">
					{% for field in success.fields %}
						{% case field.type %}
							{% when 'hidden' %}
							<input type="hidden" name="{{ field.name }}" value="{{ field.value }}">
							{% when 'submit' %}
							<button type="submit" class="btn btn-success" title="{{ field.title }}">
								<i class="fas fa-check"></i> {{ field.value }}
							</button>
						{% endcase %}
					{% endfor %}
				</form>
			</div>
			{% endif %}
			{% if fail %} 
			<!--Fail-->
			<div class="col">
				<form action="{{ fail.action }}" method="{{ fail.method }}" name="{{ fail.name }}" target="_blank">
					{% for field in fail.fields %}
						{% case field.type %}
							{% when 'hidden' %}
							<input type="hidden" name="{{ field.name }}" value="{{ field.value }}">
							{% when 'submit' %}
							<button type="submit" class="btn btn-danger" title="{{ field.title }}">
								<i class="fas fa-times"></i> {{ field.value }}
							</button>
						{% endcase %}
					{% endfor %}
				</form>
			</div>
			{% endif %}
		</div>
	</div>
</div>