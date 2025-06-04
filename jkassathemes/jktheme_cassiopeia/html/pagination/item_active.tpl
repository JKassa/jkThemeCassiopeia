<li class="page-item">
	<a href="#" data-click="pages-links" data-return="{{ link }}" title="{{ text }}" class="page-link">
		{% case action %}
			{% when 'start' %}
				<span class="fas fa-backward d-md-none"></span>
				<span class="d-none d-md-table-cell">{{ text }}</span>
			{% when 'previous' %}
				<span class="fas fa-chevron-left d-md-none"></span>
				<span class="d-none d-md-table-cell">{{ text }}</span>
			{% when 'next' %}
				<span class="fas fa-chevron-right d-md-none"></span>
				<span class="d-none d-md-table-cell">{{ text }}</span>
			{% when 'end' %}
				<span class="fas fa-forward d-md-none"></span>
				<span class="d-none d-md-table-cell">{{ text }}</span>
			{% else %}
				{{ text }}
		{% endcase %}
	</a>
</li>