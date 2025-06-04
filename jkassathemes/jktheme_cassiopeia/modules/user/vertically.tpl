{% comment %}
	Connect CSS and JavaScript to the header of the document.
{% endcomment %}
{{ '' | registerAndUseStyle: 'jktheme.css' }}
{{ 'tooltip' | bootstrap5, '.hasTooltip' }}
<div class="jkassa jk-user-module {{ class_sfx }}">
	{% if login_form %}
	<!--Login form-->
	{{ login_form }}
	{% endif %}

	{% if avatar %}
	<!--Avatar-->
	<style type="text/css">
		.modjku-avatar {
			position: relative;
			width: {{ size_avatar }}px;
			height: {{ size_avatar }}px;
			margin: 0 auto 10px;
		}
		.modjku-avatar-edit {
			position: absolute;
			display: none;
			top: 50%;
			left: 50%;
			-webkit-transform: translate(-50%,-50%);
			transform: translate(-50%,-50%);
			width: -moz-max-content;
			max-width: 100%;
			-webkit-box-sizing: border-box;
			box-sizing: border-box;
		}
		.modjku-avatar a:hover .modjku-avatar-edit {
			display: table;
		}
	</style>
	<div class="modjku-avatar">
		<a href="{{ edit_avatar }}" target="_blank" title="{{ '_' | jtext: 'JGLOBAL_EDIT' }}">
			<img src="{{ avatar }}" alt="{{ user_name }}" class="rounded-circle" />
			<span class="modjku-avatar-edit">
				<i class="fas fa-edit"></i>
			</span>
		</a>
	</div>
	{% endif %}

	<div class="text-center">
		<!--User name-->
		<p class="lead" style="margin-bottom: 10px">{{ user_name }}</p>
		{% if date_registration %}
		<!--Date registration-->
		<p class="text-muted">{{ date_registration }}</p>
		{% endif %}
	</div>

	{% if edit_url or logout_url %}
	<div class="text-center" style="margin-bottom: 10px">
		<div class="btn-group" role="group">
			{% if edit_url %}
			<!--Edit profile-->
			<a class="btn btn-primary" href="{{ edit_url }}" target="_top" title="{{ '_' | jtext: 'MOD_JKASSA_USER_EDIT_PROFILE' }}">
				<i class="fas fa-user"></i>
				{{ '_' | jtext: 'JOPTIONS' }}
			</a>
			{% endif %}
			{% if logout_url %}
			<!--Log out-->
			<a class="btn btn-primary" href="{{ logout_url }}" title="{{ '_' | jtext: 'JLOGOUT' }}">
				<i class="fas fa-sign-out-alt"></i>
				{% if edit_url == null %}{{ '_' | jtext: 'JLOGOUT' }}{% endif %}
			</a>
			{% endif %}
		</div>
	</div>
	{% endif %}

	{% if add_links %}
	<!--Additional links-->
	<div class="list-group">
		{% for link in add_links %}
		<a href="{{ link.url }}" class="list-group-item">
			{{ link.text }}
		</a>
		{% endfor %}
	</div>
	{% endif %}
</div>
