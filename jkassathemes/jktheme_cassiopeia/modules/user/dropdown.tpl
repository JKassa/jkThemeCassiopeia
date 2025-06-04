{{ '' | registerAndUseStyle: 'jktheme.css' }}
<div class="jkassa jk-user-module dropdown {{ class_sfx }}">
	<button type="button" class="btn btn-sm btn-primary position-relative bg-transparent border-0" id="jk-user-module-dropdown" data-bs-toggle="dropdown" aria-expanded="false">
		<i class="fas fa-user fa-2x"></i>
		{% if guest %}
		<span class="position-absolute top-0 translate-middle p-2 bg-secondary border border-light rounded-circle">
			<span class="visually-hidden">{{ '_' | jtext: 'MOD_JKASSA_USER_GUEST' }}</span>
		</span>
		{% else %}
		<span class="position-absolute top-0 translate-middle p-2 bg-danger border border-light rounded-circle">
			<span class="visually-hidden">{{ user_name }}</span>
		</span>
		{% endif %}
	</button>
	<div class="dropdown-menu dropdown-menu-end" aria-labelledby="jk-user-module-dropdown">
		{% if add_links %}
		<!--Additional links-->
		{% for link in add_links %}
        <a href="{{ link.url }}" class="dropdown-item">
            {{ link.text }}
        </a>
		{% endfor %}
		{% endif %}
		{% if login_url or logout_url %}
		<div class="dropdown-divider"></div>
		{% endif %}
		{% if login_url %}
		<!--Login url-->
        <a href="{{ login_url }}" class="dropdown-item">
            {{ '_' | jtext: 'JACTION_LOGIN_SITE' }}
        </a>
		{% endif %}
		{% if logout_url %}
		<!--Logout url-->
        <a href="{{ logout_url }}" class="dropdown-item">
            {{ '_' | jtext: 'JLOGOUT' }}
        </a>
		{% endif %}
	</div>
</div>
