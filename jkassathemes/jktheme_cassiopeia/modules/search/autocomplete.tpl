<div class="d-flex align-items-center" onclick="location.href='{{ url }}';">
	<!--Image-->
	<div class="flex-shrink-0">
		<img src="{{ image }}" class="media-object" alt="{{ alias }}" style="width: auto; height: 60px;">
	</div>
	<div class="flex-grow-1 ms-3">
		<!--Name-->
		<h5>
			{{ name }}
		</h5>
		<!--Price-->
		<span>
			{% if old_cost %}
			<!--old cost-->
			<del class="text-muted">{{ old_cost | costDisplay }}{{ currency.symbol }}</del>
			{% endif %}
			<!--cost-->
			<strong>{{ cost | costDisplay }}</strong>{{ currency.symbol }}
		</span>
		<br>
		<small class="text-muted">{{ sku }}</small>
	</div>
</div>
