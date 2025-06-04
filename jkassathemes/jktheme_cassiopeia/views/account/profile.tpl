<div class="profile">
	<!--Profile-->
	<fieldset id="users-profile-core">
		<legend class="mb-3">
			{{ '_' | jtext: 'COM_JKASSA_ACCOUNT_CONTACT' }}
		</legend>
		<dl class="row">
			<dt class="col-sm-3">{{ '_' | jtext: 'COM_JKASSA_YOUR_NAME' }}:</dt>
			<dd class="col-sm-9">{{ user_name }}</dd>
			<dt class="col-sm-3">{{ '_' | jtext: 'JGLOBAL_EMAIL' }}:</dt>
			<dd class="col-sm-9">{{ user_email }}</dd>
			<dt class="col-sm-3">{{ '_' | jtext: 'COM_USERS_PROFILE_USERNAME_LABEL' }}:</dt>
			<dd class="col-sm-9">{{ user_username }}</dd>
			{% if profile.phone %}
			<dt class="col-sm-3">{{ '_' | jtext: 'PLG_USER_PROFILE_FIELD_PHONE_LABEL' }}</dt>
			<dd class="col-sm-9">{{ profile.phone }}</dd>
			{% endif %}
			{% if profile.country %}
			<dt class="col-sm-3">{{ '_' | jtext: 'PLG_USER_PROFILE_FIELD_COUNTRY_LABEL' }}</dt>
			<dd class="col-sm-9">{{ profile.country }}</dd>
			{% endif %}
			{% if profile.region %}
			<dt class="col-sm-3">{{ '_' | jtext: 'PLG_USER_PROFILE_FIELD_REGION_LABEL' }}</dt>
			<dd class="col-sm-9">{{ profile.region }}</dd>
			{% endif %}
			{% if profile.city %}
			<dt class="col-sm-3">{{ '_' | jtext: 'PLG_USER_PROFILE_FIELD_CITY_LABEL' }}</dt>
			<dd class="col-sm-9">{{ profile.city }}</dd>
			{% endif %}
			{% if profile.address1 %}
			<dt class="col-sm-3">{{ '_' | jtext: 'PLG_USER_PROFILE_FIELD_ADDRESS1_LABEL' }}</dt>
			<dd class="col-sm-9">{{ profile.address1 }}</dd>
			{% endif %}
			{% if profile.address2 %}
			<dt class="col-sm-3">{{ '_' | jtext: 'PLG_USER_PROFILE_FIELD_ADDRESS2_LABEL' }}</dt>
			<dd class="col-sm-9">{{ profile.address2 }}</dd>
			{% endif %}
			{% if profile.postal_code %}
			<dt class="col-sm-3">{{ '_' | jtext: 'PLG_USER_PROFILE_FIELD_POSTAL_CODE_LABEL' }}</dt>
			<dd class="col-sm-9">{{ profile.postal_code }}</dd>
			{% endif %}
			{% if profile.website %}
			<dt class="col-sm-3">{{ '_' | jtext: 'PLG_USER_PROFILE_FIELD_WEB_SITE_LABEL' }}</dt>
			<dd class="col-sm-9">{{ profile.website }}</dd>
			{% endif %}
			{% if profile.dob %}
			<dt class="col-sm-3">{{ '_' | jtext: 'PLG_USER_PROFILE_FIELD_DOB_LABEL' }}</dt>
			<dd class="col-sm-9">{{ profile.dob }}</dd>
			{% endif %}
			{% if profile.aboutme %}
			<dt class="col-sm-3">{{ '_' | jtext: 'PLG_USER_PROFILE_FIELD_ABOUT_ME_LABEL' }}</dt>
			<dd class="col-sm-9">{{ profile.aboutme }}</dd>
			{% endif %}
			<dt class="col-sm-3">{{ '_' | jtext: 'COM_USERS_PROFILE_REGISTERED_DATE_LABEL' }}:</dt>
			<dd class="col-sm-9">{{ 'date' | jhtml: registerDate }}</dd>
			<dt class="col-sm-3">{{ '_' | jtext: 'COM_USERS_PROFILE_LAST_VISITED_DATE_LABEL' }}:</dt>
			{% if lastvisitDate != '0000-00-00 00:00:00' %}
			<dd class="col-sm-9">{{ 'date' | jhtml: lastvisitDate }}</dd>
			{% else %}
			<dd class="col-sm-9">{{ '_' | jtext: 'COM_USERS_PROFILE_NEVER_VISITED' }}</dd>
			{% endif %}
		</dl>
	</fieldset>
	<!--Edit profile | Log out-->
	<ul class="btn-toolbar">
		<li class="btn-group">
			<a class="btn btn-primary" href="{{ edit_url }}" target="_top">
				<span class="fas fa-user"></span>
				{{ '_' | jtext: 'COM_USERS_EDIT_PROFILE' }}
			</a>
			<a class="btn btn-primary" href="{{ logout_url }}">
				<span class="fas fa-power-off"></span>
				{{ '_' | jtext: 'JLOGOUT' }}
			</a>
		</li>
	</ul>
</div>
