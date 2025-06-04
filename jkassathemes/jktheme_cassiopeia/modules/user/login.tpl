{{ 'tooltip' | bootstrap5, '.hasTooltip' }}
<form action="{{ form_action }}" method="post">
	<!--User name-->
	<div class="input-group mb-3">
		<input id="modjku-username" type="text" name="username" class="form-control" autocomplete="username" placeholder="{{ '_' | jtext: 'JGLOBAL_USERNAME' }}" />
		<label for="modjku-username" class="visually-hidden">{{ '_' | jtext: 'JGLOBAL_USERNAME' }}</label>
		<span class="input-group-text hasTooltip" title="{{ '_' | jtext: 'JGLOBAL_USERNAME' }}">
			<i class="fas fa-user"></i>
		</span>
	</div>
	<!--Password-->
	<div class="input-group mb-3">
		<input id="modjku-passwd" type="password" name="password" class="form-control" autocomplete="current-password" placeholder="{{ '_' | jtext: 'JGLOBAL_PASSWORD' }}" />
		<label for="modjku-passwd" class="visually-hidden">{{ '_' | jtext: 'JGLOBAL_PASSWORD' }}</label>
		<button type="button" class="btn btn-secondary input-password-toggle">
			<i class="icon-eye icon-fw"></i>
			<span class="visually-hidden">{{ '_' | jtext: 'JSHOWPASSWORD' }}</span>
		</button>
	</div>
	{% if twoFactorMethods %}
	<!--Secret key-->
	<div class="input-group mb-3">
		<span class="input-group-text hasTooltip" title="{{ '_' | jtext: 'JGLOBAL_SECRETKEY' }}">
			<i class="fas fa-star"></i>
		</span>
		<input id="modjku-secretkey" autocomplete="off" type="text" name="secretkey" class="form-control"  placeholder="{{ '_' | jtext: 'JGLOBAL_SECRETKEY' }}" />
		<label for="modjku-secretkey" class="visually-hidden">{{ '_' | jtext: 'JGLOBAL_SECRETKEY' }}</label>
		<span class="input-group-text hasTooltip" title="{{ '_' | jtext: 'JGLOBAL_SECRETKEY_HELP' }}">
			<i class="fas fa-info-circle"></i>
		</span>
	</div>
	{% endif %}
	{% if remember %}
	<!--Remember-->
	<div class="mb-3 form-check">
		<input id="modjku-remember" type="checkbox" name="remember" class="form-check-input" value="yes" />
		<label class="form-check-label" for="modjku-remember">{{ '_' | jtext: 'JGLOBAL_REMEMBER_ME' }}</label>
	</div>
	{% endif %}
	<!--Submit-->
	<button type="submit" tabindex="0" name="Submit" class="btn btn-primary login-button">
		{{ '_' | jtext: 'JLOGIN' }}
	</button>
	<input type="hidden" name="option" value="com_users" />
	<input type="hidden" name="task" value="user.login" />
	<input type="hidden" name="return" value="{{ return }}" />
	{{ token }}
</form>
