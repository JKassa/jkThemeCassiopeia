{{ '' | registerAndUseStyle: 'jktheme.css' }}

{% if pre_text %}
<p>{{ pre_text }}</p>
{% endif %}

{% case layout %}
	{% when 'list' %}
<div class="list-group {{ class_sfx }}">
	{% include 'modules/currencies/list' %}
</div> 
    {% when 'select' %}
<form name="currency" method="post" action="{{ action }}">
	<select name="cur_id" class="form-select form-select{{ class_sfx }}" onchange="this.form.submit()" aria-label="Currency switcher">
		{% include 'modules/currencies/select' %}
	</select>
	<input type="hidden" name="option" value="com_jkassa" />
	<input type="hidden" name="task" value="user.switchingCurrency" />
	<input type="hidden" name="cur_return" value="{{ return }}" />
</form>
    {% when 'dropdown' %}
	{{ 'dropdown' | bootstrap5: '.dropdown' }}
<div class="dropdown">
	{% include 'modules/currencies/dropdown' %}
</div> 
{% endcase %}

{% if post_text %}
<p class="mt-2">{{ post_text }}</p>
{% endif %}
