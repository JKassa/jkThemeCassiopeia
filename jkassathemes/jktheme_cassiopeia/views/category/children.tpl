<li{% if children %} class="dropdown-submenu"{% endif %}>
	<!--Title category and URL category-->
	<a href="{{ url }}" class="dropdown-item">{{ title }}</a>
	{% if children %}
	<!--Subcategories-->
	<ul class="dropdown-menu">
		{{ children }}
	</ul>
	{% endif %}
</li>