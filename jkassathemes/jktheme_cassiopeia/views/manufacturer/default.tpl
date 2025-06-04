{{ 'dropdown' | bootstrap5 }}

{% if heading %}
<!--Heading-->
<h1>{{ heading }}</h1>
{% endif %}

<!--Image-->
<div class="row">
	<div class="col-12">
		<img {{ logo | img_exists: '400x120' }} alt="{{ alias }}" class="img-fluid">
	</div>
</div>

<div class="row mt-3">
	<div class="col-7">
		<!--Name-->
		<h2 class="mt-0">
			{{ name }}
			<small class="text-muted">
				{{ 'plural' | jtext: 'COM_JKASSA_PRODUCTS_QUANTITY', products_quantity }}
			</small>
		</h2>
	</div>
	<div class="col-5 text-end">
		{% comment %}
			Connecting voting plugin.
			See: Plugin Manager: Plugins -> jkvotes.
		{% endcomment %}
		{% assign votes = id | jkvotes: rating, rating_count %}
		{% if votes %}
		<!--Rating-->
		<div class="text-muted">
			{{ votes }}
		</div>
		{% endif %}
	</div>
</div>

{% comment %}
	Joomla events (fields).
{% endcomment %}
{{ event.afterDisplayTitle }}

<!--Layout products-->
{{ products }}

{% comment %}
	Joomla events (fields).
{% endcomment %}
{{ event.beforeDisplayContent }}

{% if fulltext %}
<!--Fulltext-->
<div class="mt-2">
	{{ fulltext }}
</div>
{% endif %}

{% if contacts %}
<!--Contacts-->
<div class="mb-3">
	<h4>
		{{ '_' | jtext: 'COM_JKASSA_MANUFACTURER_CONTACTS' }}
	</h4>
	<ul class="list-group">
		{% if contacts.url %}
		<!--homepage-->
		<li class="list-group-item" title="{{ '_' | jtext: 'COM_JKASSA_MANUFACTURER_HOMEPAGE' }}">
			<span class="fas fa-home"></span>
			<a href="{{ contacts.url }}" target="_blank">{{ '_' | jtext: 'COM_JKASSA_MANUFACTURER_HOMEPAGE' }}</a>
		</li>
		{% endif %}
		{% if contacts.email %}
		<!--email-->
		<li class="list-group-item" title="{{ '_' | jtext: 'JGLOBAL_EMAIL' }}">
			<span class="fas fa-envelope"></span>
			<a href="mailto:{{ contacts.email }}">{{ contacts.email }}</a>
		</li>
		{% endif %}
		{% if contacts.support %}
		<!--support-->
		<li class="list-group-item" title="{{ '_' | jtext: 'COM_JKASSA_MANUFACTURER_SUPPORT' }}">
			<span class="fas fa-envelope"></span>
			<a href="{{ contacts.support }}" target="_blank">{{ '_' | jtext: 'COM_JKASSA_MANUFACTURER_SUPPORT' }}</a>
		</li>
		{% endif %}
		{% if contacts.phone %}
		<!--phone-->
		<li class="list-group-item" title="{{ '_' | jtext: 'COM_JKASSA_PHONE' }}">
			<span class="fas fa-phone"></span>
			{{ contacts.phone }}
		</li>
		{% endif %}
		{% if contacts.fax %}
		<!--fax-->
		<li class="list-group-item" title="{{ '_' | jtext: 'COM_JKASSA_MANUFACTURER_FAX' }}">
			<span class="fas fa-fax"></span>
			{{ contacts.fax }}
		</li>
		{% endif %}
	</ul>
</div>
{% endif %}

{% comment %}
	Joomla events (fields).
{% endcomment %}
{{ event.afterDisplayContent }}

{% comment %}
    Connecting social plugin.
    See: Plugin Manager: Plugins -> jksocial.
{% endcomment %}
{% assign social = id | jksocial: name, logo, metadesc, return_url %}
{% if social %}
	{{ social }}
{% endif %}

{% if print_screen == 0 %}
<!--Print / Email / Edit-->
<div class="btn-group float-end" role="group">
	<button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle p-2" data-bs-toggle="dropdown" aria-expanded="false">
		<span class="fas fa-cog"></span>
	</button>
	<ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">
		<li class="dropdown-item">{{ print_icon }}</li>
		<li class="dropdown-item">{{ email_icon }}</li>
		{% if edit_icon %}
		<li role="separator" class="dropdown-divider"></li>
		<li class="dropdown-item">{{ edit_icon }}</li>
		{% endif %}
	</ul>
</div>
{% else %}
<div class="btn btn-primary no-print" style="position: fixed; right: 10px; top: 10px">
	{{ print_screen }}
</div>
{% endif %}

<!--Details-->
<ul class="breadcrumb mt-3 px-2 py-1" style="font-size: 70%">
	<li class="breadcrumb-item active">
		<span class="fas fa-user"></span>
		{{ 'sprintf' | jtext: 'COM_JKASSA_WRITTEN_BY', '' }}
		{% if contact_link %}
		<a href="{{ contact_link }}">{{ author }}</a>
		{% else %}
		{{ author }}
		{% endif %}
	</li>
	<li class="breadcrumb-item active">
		<span class="fas fa-calendar"></span>
		<time>
			{% assign date_created = 'date' | jhtml: created, 'DATE_FORMAT_LC2' %}
			{{ 'sprintf' | jtext: 'COM_JKASSA_CREATED_DATE_ON', date_created }}
		</time>
	</li>
	<li class="breadcrumb-item active">
		<span class="fas fa-calendar"></span>
		<time>
			{% assign date_modified = 'date' | jhtml: modified, 'DATE_FORMAT_LC2' %}
			{{ 'sprintf' | jtext: 'COM_JKASSA_LAST_UPDATED', date_modified }}
		</time>
	</li>
</ul>

{% if pagination %}
<!--Pagination-->
<nav aria-label="Page navigation">
	<ul class="pagination justify-content-center">
		{% if pagination.prev %}
		<li class="page-item">
			<a class="page-link" href="{{ pagination.prev }}" rel="prev">
				<span class="fas fa-arrow-circle-left"></span> {{ '_' | jtext: 'JPREV' }}
			</a>
		</li>
		{% endif %}
		{% if pagination.next %}
		<li class="page-item">
			<a class="page-link" href="{{ pagination.next }}" rel="next">
				{{ '_' | jtext: 'JNEXT' }} <span class="fas fa-arrow-circle-right"></span>
			</a>
		</li>
		{% endif %}
	</ul>
</nav>
{% endif %}
