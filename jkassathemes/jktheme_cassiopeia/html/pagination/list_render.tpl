<div class="row mb-5">
	<div class="col">
		<nav aria-label="Page navigation">
			<ul class="pagination pagination-sm m-0">
				{{ start.data }}
				{{ previous.data }}
				{% for page in pages %}
					{{ page.data }}
				{% endfor %}
				{{ next.data }}
				{{ end.data }}
			</ul>
		</nav>
	</div>
	<div class="col">
		<div class="float-end text-muted text-nowrap mt-2">
			{{ pagesCounter }}
		</div>
	</div>
</div>
