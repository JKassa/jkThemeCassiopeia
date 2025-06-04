{% if heading %}
<!--Heading-->
<h1 class="mt-0">
	{{ heading }}
</h1>
{% endif %}

<div class="card text-center mb-3">
	{% if discount %}
	<h3 class="card-header">
		{{ '_' | jtext: 'COM_JKASSA_DISCOUNT' }} {{ discount }}{{ d_symbol }}
	</h3>
	{% endif %}
	{% if image %}
	<img src="{{ image }}" class="card-img-top" alt="{{ alias }}">
	{% endif %}
	<div class="card-body">
		<h5 class="card-title">
			{{ name }}
			{% if products_quantity %}
			<br>
			<small>{{ 'plural' | jtext: 'COM_JKASSA_PRODUCTS_QUANTITY', products_quantity }}</small>
			{% endif %}
		</h5>
		<div class="card-text">{{ introtext }}</div>
	</div>
	{% if timer %}
	<div class="card-footer text-muted">
		<div id="discount-timer-{{ id }}">
			<strong>{{ timer.text_start }}</strong><br>
			<span id="timer-day-{{ id }}"></span>
			<span id="timer-hour-{{ id }}"></span>
			<span id="timer-minute-{{ id }}"></span>
			<span id="timer-second-{{ id }}"></span>
		</div>
		<script type="text/javascript">
			$('#discount-timer-{{ id }}').countdown('{{ timer.time }}')
				.on('update.countdown', function (event) {
					var sDay = +event.strftime('%D');
					if (sDay > 0) {
						// days
						var tDay = timeFormats(sDay, "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_DAY_1' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_DAY_2' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_DAY' }}");

						$('#timer-day-{{ id }}').html(event.strftime('%D ' + tDay));
						$('#timer-second-{{ id }}').hide();
					} else {
						// second
						var sSecond = +event.strftime('%S');
						var tSecond = timeFormats(sSecond, "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_SECOND_1' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_SECOND_2' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_SECOND' }}");

						$('#timer-day-{{ id }}').hide();
						$('#timer-second-{{ id }}').html(event.strftime('%S ' + tSecond));
					}

					// hour
					var sHour = +event.strftime('%H');
					var tHour = timeFormats(sHour, "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_HOUR_1' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_HOUR_2' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_HOUR' }}");

					$('#timer-hour-{{ id }}').html(event.strftime('%H ' + tHour));

					// minute
					var sMinute = +event.strftime('%M');
					var tMinute = timeFormats(sMinute, "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_MINUTE_1' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_MINUTE_2' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_MINUTE' }}");

					$('#timer-minute-{{ id }}').html(event.strftime('%M ' + tMinute));
				})
				.on('finish.countdown', function (event) {
					$(this).html('<strong class="timer-text timer-text text-{% if timer.event == "start" %}success{% else %}danger{% endif %}">{{ timer.text_end }}</strong>')
						.parent().addClass('disabled');
				});

			// Time formats
			function timeFormats(n, f, s, t) {
				"use strict";

				// f - 1, 21, 31, ...
				// s - 2-4, 22-24, 32-34 ...
				// t - 5-20, 25-30, ...

				n = n % 100;
				var n10 = n % 10;

				if ((n10 === 1) && ((n === 1) || (n > 20))) {
					return f;
				} else if ((n10 > 1) && (n10 < 5) && ((n > 20) || (n < 10))) {
					return s;
				} else {
					return t;
				}
			}
		</script>
	</div>
	{% endif %}
</div>

{% if fulltext %}
<div>
	{{ fulltext }}
</div>
{% endif %}

{% if products %}
<hr>
<!--Layout products-->
{{ products }}
{% endif %}
