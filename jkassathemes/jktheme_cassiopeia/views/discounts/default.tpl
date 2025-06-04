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

<!--List items-->
{% if items %}
<div>
	{% for item in items %}
	<div class="card text-center mb-3">
		{% if item.discount %}
		<h3 class="card-header">
			{{ '_' | jtext: 'COM_JKASSA_DISCOUNT' }} {{ item.discount }}{{ item.d_symbol }}
		</h3>
		{% endif %}
		{% if item.image %}
		<a href="{{ item.url }}">
			<img src="{{ item.image }}" class="card-img-top" alt="{{ item.alias }}">
		</a>
		{% endif %}
		<div class="card-body">
			<h5 class="card-title">{{ item.name }}</h5>
			<div class="card-text">{{ item.introtext }}</div>
			<a href="{{ item.url }}" class="btn btn-primary">
				{{ '_' | jtext: 'JDETAILS' }}
			</a>
		</div>
		{% if item.timer %}
		<div class="card-footer text-muted">
			<div id="discount-timer-{{ item.id }}">
				<strong>{{ item.timer.text_start }}</strong><br>
				<span id="timer-day-{{ item.id }}"></span>
				<span id="timer-hour-{{ item.id }}"></span>
				<span id="timer-minute-{{ item.id }}"></span>
				<span id="timer-second-{{ item.id }}"></span>
			</div>
			<script type="text/javascript">
				$('#discount-timer-{{ item.id }}').countdown('{{ item.timer.time }}')
					.on('update.countdown', function (event) {
						var sDay = +event.strftime('%D');
						if (sDay > 0) {
							// days
							var tDay = timeFormats(sDay, "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_DAY_1' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_DAY_2' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_DAY' }}");

							$('#timer-day-{{ item.id }}').html(event.strftime('%D ' + tDay));
							$('#timer-second-{{ item.id }}').hide();
						} else {
							// second
							var sSecond = +event.strftime('%S');
							var tSecond = timeFormats(sSecond, "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_SECOND_1' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_SECOND_2' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_SECOND' }}");

							$('#timer-day-{{ item.id }}').hide();
							$('#timer-second-{{ item.id }}').html(event.strftime('%S ' + tSecond));
						}

						// hour
						var sHour = +event.strftime('%H');
						var tHour = timeFormats(sHour, "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_HOUR_1' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_HOUR_2' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_HOUR' }}");

						$('#timer-hour-{{ item.id }}').html(event.strftime('%H ' + tHour));

						// minute
						var sMinute = +event.strftime('%M');
						var tMinute = timeFormats(sMinute, "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_MINUTE_1' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_MINUTE_2' }}", "{{ '_' | jtext: 'LIB_GSWORK_COUNTDOWN_MINUTE' }}");

						$('#timer-minute-{{ item.id }}').html(event.strftime('%M ' + tMinute));
					})
					.on('finish.countdown', function (event) {
						$(this).html('<strong class="timer-text timer-text text-{% if item.timer.event == "start" %}success{% else %}danger{% endif %}">{{ item.timer.text_end }}</strong>')
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
	{% endfor %}
</div>
{% else %}
<div class="alert alert-warning">
	{{ no_items }}
</div>
{% endif %}

{% if posttext %}
<!--Posttext-->
<div>
	{{ posttext }}
</div>
{% endif %}
