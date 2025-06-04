{{ 'loadAll5' | fontawesome }}
{{ 'tooltip' | bootstrap5, '.hasTooltip' }}
{% case icon %}
	{% when 'print' %}
		<span class="fas fa-print"></span>
        {{ '_' | jtext: 'JGLOBAL_PRINT' }}
	{% when 'print_screen' %}
		<span class="fas fa-print"></span>
        {{ '_' | jtext: 'JGLOBAL_PRINT' }}
    {% when 'email' %}
		<span class="fas fa-envelope"></span>
        {{ '_' | jtext: 'JGLOBAL_EMAIL' }}
	{% when 'lock' %}
		<span class="fas fa-lock"></span>
        {{ '_' | jtext: 'JLIB_HTML_CHECKED_OUT' }}
    {% when 'close' %}
		<span class="fas fa-eye-close"></span>
        {{ '_' | jtext: 'JGLOBAL_EDIT' }}
    {% when 'edit' %}
		<span class="fas fa-pencil-alt"></span>
        {{ '_' | jtext: 'JGLOBAL_EDIT' }}
    {% when 'create' %}
		<span class="fas fa-plus"></span>
        {{ '_' | jtext: 'JNEW' }}
	{% when 'help' %}
		<span class="hasTooltip" title="{{ tooltip }}">
			<i class="fas fa-info-circle"></i>
		</span>
	{% when 'star' %}
		<span class="fas fa-star" style="color: #F2CD00"></span>
	{% when 'star-empty' %}
		<span class="far fa-star" style="color: #CCCCCC"></span>
	{% when 'big-star' %}
		<span class="fas fa-star" style="color: #F2CD00; font-size: 24px"></span>
	{% when 'big-star-empty' %}
		<span class="far fa-star" style="color: #CCCCCC; font-size: 24px"></span>
	{% when 'audio' %}
		<span class="fas fa-play fa-3x pt-2"></span>
	{% when 'movie' %}
		<span class="fas fa-play fa-3x pt-2"></span>
	{% when '3d' %}
		<span class="fas fa-play fa-3x pt-2"></span>
	{% when 'status_success' %}
		fas fa-check text-success
	{% when 'status_new' %}
		fas fa-clock text-warning
	{% when 'status_process' %}
		fas fa-clock text-warning
	{% when 'status_fail' %}
		fas fa-times-circle text-danger
{% endcase %}
