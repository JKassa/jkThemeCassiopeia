{{ 'tab' | bootstrap5 }}
{{ 'dropdown' | bootstrap5 }}
{{ 'tooltip' | bootstrap5, '.hasTooltip' }}

{% comment %}
	Parameters of the product.
{% endcomment %}
{% assign show_sku = tpl_params.sku | default_value: 1 %}
{% assign show_stock = tpl_params.stock | default_value: 1 %}
{% assign show_quantity = tpl_params.quantity | default_value: 1 %}
{% assign show_info = tpl_params.info | default_value: 1 %}
{% assign show_icons = tpl_params.icons | default_value: 1 %}
{% assign show_nav = tpl_params.nav | default_value: 1 %}

{% comment %}
	Variable depending on the availability of the product:
    '0'  - Not in stock;
    '-1' - In stock;
    '-2' - To order;
    'X'  - Balance of stock.
{% endcomment %}
{% case stock %}
	{% when 0 %}
		{% assign stock_icon = '<span class="fas fa-times text-danger"></span>' %}
        {% assign stock_text = '_' | jtext: 'COM_JKASSA_STOCK_0' %}
        {% assign btn_buyDisabled = false %}
        {% assign btn_buy = false %}
        {% assign btn_cartDisabled = false %}
        {% assign btn_cart = false %}
        {% assign btn_report = true %}
        {% assign btn_quickorder = false %}
		{% assign show_delivery = false %}
	{% when '-1' %}
		{% assign stock_icon = '<span class="fas fa-check text-success"></span>' %}
        {% assign stock_text = '_' | jtext: 'COM_JKASSA_STOCK_1' %}
        {% assign btn_buyDisabled = false %}
        {% assign btn_buy = true %}
        {% assign btn_cartDisabled = false %}
        {% assign btn_cart = true %}
        {% assign btn_report = false %}
        {% assign btn_quickorder = true %}
		{% assign show_delivery = true %}
	{% when '-2' %}
		{% assign stock_icon = '<span class="fas fa-check"></span>' %}
        {% assign stock_text = '_' | jtext: 'COM_JKASSA_STOCK_2' %}
        {% assign btn_buyDisabled = false %}
        {% assign btn_buy = false %}
        {% assign btn_cartDisabled = false %}
        {% assign btn_cart = false %}
        {% assign btn_report = false %}
        {% assign btn_quickorder = true %}
		{% assign show_delivery = false %}
	{% else %}
		{% assign stock_icon = '<span class="fas fa-check text-success"></span>' %}
        {% assign stock_text = 'sprintf' | jtext: 'COM_JKASSA_STOCK_N', stock %}
        {% assign btn_buyDisabled = false %}
        {% assign btn_buy = true %}
        {% assign btn_cartDisabled = false %}
        {% assign btn_cart = true %}
        {% assign btn_report = false %}
        {% assign btn_quickorder = true %}
		{% assign show_delivery = true %}
{% endcase %}

{% comment %}
	In cart.
{% endcomment %}
{% if cart_disabled %}
	{% assign btn_cartDisabled = true %}
    {% assign btn_cart = false %}
{% endif %}

{% if heading and quickview == 0 %}
<!--Heading-->
<h1 class="mb-3">
	{{ heading }}
</h1>
{% endif %}

<!--Product-->
<div class="row mb-2">
	<!--Images-->
	<div class="col-sm-7 product-image">
		{% if stickers %}
		<!-- Stickers -->
		<ul class="stickers">
			{% if new %}
			<li>
				<span class="product-label product-label_new">NEW</span>
			</li>
			{% endif %}
			{% if hit %}
			<li>
				<span class="product-label product-label_hit">HIT</span>
			</li>
			{% endif %}
			{% if discount %}
			<li>
				{% assign options = 'decimals' | arrayCombine: 0 %}
				{% if discount_image %}
				<img {{ discount_image | img_exists: '30x30' }} alt="" title="{{ discount_desc }} - {{ discount | costDisplay: options }}{{ d_symbol }}">
				{% else %}
				<span class="product-label" title="{{ discount_desc }} - {{ discount | costDisplay: options }}{{ d_symbol }}">
					-{{ discount | costDisplay: options }}{% if d_symbol == '%' %}{{ d_symbol }}{% endif %}
				</span>
				{% endif %}
			</li>
			{% endif %}
		</ul>
		{% endif %}
		
		{% assign img_height = tpl_params.p_img_height | default_value: 0 %}
		{% assign jkmedia = images | jkmedia: 70, img_height, null, null, media_layout %}
		{% if jkmedia %}
			{{ jkmedia }}
		{% else %}
		<img {{ image | img_exists: '260x380' }} alt="{{ alias }}" class="img-fluid"{% if img_height %} style="width: auto; max-height: {{ img_height }}px;"{% endif %}>
		{% endif %}

		{% if tags %}
		<!-- Tags -->
		<div style="position: absolute; right: 0; top: 4px">
			{% for tag in tags %}
			<a href="{{ tag.url }}" class="{{ tag.link_class }}" style="float: right; border-radius: 9px 0 0 9px; margin-top: 2px">
				{{ tag.title }}
			</a><br>
			{% endfor %}
		</div>
		{% endif %}
	</div>
	
	<!--Cost block-->
	<div class="col-sm-5">
		{% if manufacturer %}
		<!--Manufacturer-->
		<div>
			<a title="{{ manufacturer.name }}" href="{{ manufacturer.url }}" target="_top">
				<img src="{{ manufacturer.logo }}" alt="{{ manufacturer.alias }}" class="img-thumbnail" style="max-height: 60px; max-width: 200px">
			</a>
		</div>
		{% endif %}

		{% comment %}
			Rating reviews JKassa or Plug-in voting (See: Plugin Manager: Plugins -> jkvotes).
		{% endcomment %}
		{% if reviews_included %}
		<!--Rating reviews-->
		<div id="jkReviewsRating" class="mt-2 text-muted">
			{% include 'html/reviews/rating' %}
		</div>
		{% else %}
		{% assign votes = id | jkvotes: rating, rating_count %}
		{% if votes %}
		<!--Voting-->
		<div class="mt-2 text-muted">
			{{ votes }}
		</div>
		{% endif %}
		{% endif %}

		<!--Name-->
		<h1 style="font-size: 2rem;">
			<a href="{{ url }}" target="_top">
				{{ name }}
			</a>

			{% if files %}
			<!--Files-->
			<small class="text-muted hasTooltip" title="<strong>{{ '_' | jtext: 'COM_JKASSA_ATTACHMENT' }}:</strong><br>{{ files | join: '<br>' }}">
				<i class="fas fa-download" style="font-size: 14px;"></i>
			</small>
			{% endif %}
		</h1>
		
		{% comment %}
			Joomla events (fields).
		{% endcomment %}
		{{ event.afterDisplayTitle }}

		{% if present %}
		<!--Share (Product as a present)-->
		<div class="share">
			<div class="sharetitle">
				+ {{ present.name }}
			</div>
			<div class="sharedesc">
				<a href="{{ present.url }}" target="_top">
					<img {{ present.image | img_exists: '50x50' }} alt="{{ present.name }}">
					<span>{{ present.desc }}</span>
				</a>
			</div>
		</div>
		{% endif %}

		<!--Cost-->
		<div>
			{% if old_cost %}
			<del class="text-muted">{{ old_cost | costDisplay }}{{ currency.symbol }}</del>
			{% endif %}
			<span class="lead">{{ cost | costDisplay }}</span>{{ currency.symbol }}
			{% if vat %}
			<span class="text-muted small">
				({{ 'sprintf' | jtext: 'COM_JKASSA_VAT_INCL', vat }})
			</span>
			{% endif %}
		</div>

		{% if show_sku and sku %}
		<!--SKU (code)-->
		<div class="text-muted text-end">
			{{ '_' | jtext: 'COM_JKASSA_SKU' }}: {{ sku }}
		</div>
		{% endif %}

		{% comment %}
			Variants product.
			See: html\forms\variants.tpl
		{% endcomment %}
		{% if variants %}
		<div>
			{{ variants }}
		</div>
		{% endif %}

		{% if show_stock %}
		<!--Stock-->
		<div class="text-muted mt-2">
			<small>
				{{ stock_icon }} {{ stock_text }}
			</small>
		</div>
		{% endif %}

		{% if cart_disabled != 'false' and show_quantity %}
		<!--Quantity-->
		<div class="p-0 mt-2 col-4">
			<div class="input-group qty-product">
				<div class="input-group-prepend">
					<a href="javascript:;" class="btn btn-primary btn-sm" type="button" data-click="qty-minus" data-id="{{ id }}" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">&minus;</a>
				</div>
				<input type="text" value="{{ limit }}" data-limit="{{ limit }}" data-maxlimit="{{ maxlimit }}" class="form-control form-control-sm text-center mw-45" name="qty-product-{{ id }}" title="{{ '_' | jtext: 'COM_JKASSA_QTY_TITLE' }}">
				<div class="input-group-append">
					<a href="javascript:;" class="btn btn-primary btn-sm" type="button" data-click="qty-plus" data-id="{{ id }}" title="{{ '_' | jtext: 'COM_JKASSA_QTY_BTN' }}">+</a>
				</div>
			</div>
		</div>
		{% endif %}

		<!--Buttons-->
		<div class="row row-cols-lg-auto g-3 align-items-center mt-1">
			{% if btn_report %}
			<!--Waiting List-->
			<div class="col-12">
				<a href="{{ waitinglist }}" data-bs-toggle="modal" data-bs-target="#jk-modal_waitinglist" class="btn btn-primary">
					<span class="fas fa-envelope"></span>
					{{ '_' | jtext: 'COM_JKASSA_WAITINGLIST' }}
				</a>
			</div>
			{% else %}
			<!--Buy & Cart-->
			<div class="col-12 btn-group mb-0">
				{% if btn_buyDisabled %}
				<span class="btn btn-primary disabled">
					<span class="fas fa-check"></span>
					{{ '_' | jtext: 'COM_JKASSA_BUY' }}
				</span>
				{% endif %}
				{% if btn_buy %}
				<a href="#" data-click="to-order" data-id="{{ id }}" data-url="{{ form_url }}" class="btn btn-success">
					<span class="fas fa-check"></span>
					{{ '_' | jtext: 'COM_JKASSA_BUY' }}
				</a>
				{% endif %}
				{% if btn_cartDisabled %}
				<span class="btn btn-info disabled" title="{{ 'sprintf' | jtext: 'COM_JKASSA_ALREADY_CART', name }}">
					<span class="fas fa-shopping-cart"></span>
					{{ '_' | jtext: 'COM_JKASSA_IN_CART' }}
				</span>
				{% endif %}
				{% if btn_cart %}
				<a href="#" data-click="to-cart" data-id="{{ id }}" class="btn btn-info" title="{{ 'sprintf' | jtext: 'COM_JKASSA_TO_CART_TITLE', name }}">
					<span class="fas fa-shopping-cart"></span>
					{{ '_' | jtext: 'COM_JKASSA_TO_CART' }}
				</a>
				{% endif %}
			</div>
			{% endif %}
			<!--Wishlist & Compare-->
			<div class="col-12">
				{% if wishlist_disabled %}
				<span class="btn btn-outline-secondary btn-circle disabled" title="{{ 'sprintf' | jtext: 'COM_JKASSA_ALREADY_WISHLIST', name }}">
					<span class="fas fa-heart text-danger"></span>
				</span>
				{% else %}
				<a href="#" data-click="to-wishlist" data-id="{{ id }}" class="btn btn-outline-secondary btn-circle" title="{{ 'sprintf' | jtext: 'COM_JKASSA_TO_WISHLIST_TITLE', name }}">
					<span class="fas fa-heart text-danger"></span>
				</a>
				{% endif %}
				{% if compare_disabled %}
				<span class="btn btn-outline-secondary btn-circle disabled" title="{{ 'sprintf' | jtext: 'COM_JKASSA_COMPARE_ALREADY_ADDED', name }}">
					<span class="fas fa-random"></span>
				</span>
				{% else %}
				<a href="#" data-click="to-compare" data-id="{{ id }}" class="btn btn-outline-secondary btn-circle" title="{{ 'sprintf' | jtext: 'COM_JKASSA_COMPARE_ADD_TITLE', name}}">
					<span class="fas fa-random"></span>
				</a>
				{% endif %}
			</div>
		</div>

		{% if btn_quickorder and quickorder %}
		<!--Quick order-->
		<div class="mt-2">
			<a href="{{ quickorder }}" data-bs-toggle="modal" data-bs-target="#jk-modal_quickorder"class="btn btn-outline-dark">
				<span class="fas fa-star"></span>
				{{ '_' | jtext: 'COM_JKASSA_QUICK_ORDER' }}
			</a>
		</div>
		{% endif %}

		{% if f_attributes %}
		<!--Featured attributes-->
		<ul class="list-unstyled mt-2">
			{% for attribute in f_attributes %}
			<li>
				<strong>{{ attribute.name }}</strong>
				{{ attribute.value }}
				{% if attribute.tooltip %}
				<span class="hasTooltip" title="{{ attribute.tooltip }}">
					<span class="fas fa-question-circle"></span>
				</span>
				{% endif %}
			</li>
			{% endfor %}
		</ul>
		{% endif %}

		{% comment %}
			Connecting social plugin.
			See: Plugin Manager: Plugins -> jksocial.
		{% endcomment %}
		{% assign social = id | jksocial: name, image, metadesc, return_url %}
		{% if social %}
		<div class="mt-2">
			{{ social }}
		</div>
		{% endif %}
		
		{% if delivery and show_delivery %}
		<ul class="list-unstyled mt-2">
			<li>
				<strong>{{ '_' | jtext: 'COM_JKASSA_ORDER_DELIVERY' }}</strong>
			</li>
			{% for del in delivery %}
			<li>
				<i class="fas fa-map-marker-alt"></i>
				{{ del.label }}
				{% if del.tooltip %}
				<span class="hasTooltip" title="{{ del.tooltip }}">
					<span class="fas fa-question-circle"></span>
				</span>
				{% endif %}
			</li>
			{% endfor %}
		</ul>
		{% endif %}
		
		{% comment %}
			Joomla events (fields).
		{% endcomment %}
		{{ event.beforeDisplayContent }}
		
		{% if aff_income %}
		<!--Affiliate Links-->
		<div class="mt-2">
			<a href="{{ aff_url }}" data-bs-toggle="modal" data-bs-target="#jk-modal_affiliate" class="text-muted small">
				<span class="fas fa-flag"></span>
				<em>{{ '_' | jtext: 'COM_JKASSA_AFFILIATE_AFFILIATE_REWARD' }}: <strong>{{ aff_income | costDisplay }}{{ currency.symbol }}</strong></em>
			</a>
		</div>
		{% endif %}
	</div>
</div>

<!--Tabs-->
<div class="mt-2">
	<ul class="nav nav-pills nav-fill mb-3" id="product-tab" role="tablist">
		<li class="nav-item" role="presentation">
			<a href="#" class="nav-link active" id="product-description-tab" data-bs-toggle="pill" data-bs-target="#product-description" role="tab" aria-controls="product-description" aria-selected="true">
				{{ '_' | jtext: 'JGLOBAL_DESCRIPTION' }}
			</a>
		</li>
		{% if attributes %}
		<li class="nav-item" role="presentation">
			<a href="#" class="nav-link" id="product-attributes-tab" data-bs-toggle="pill" data-bs-target="#product-attributes" role="tab" aria-controls="product-attributes" aria-selected="false">
				{{ '_' | jtext: 'COM_JKASSA_ATTRIBUTES' }}
			</a>
		</li>
		{% endif %}
		{% if tabs %}
		{% for tab in tabs %}
		<li class="nav-item" role="presentation">
			<a href="#" class="nav-link" id="product-{{ tab.id }}-tab" data-bs-toggle="pill" data-bs-target="#product-{{ tab.id }}" role="tab" aria-controls="product-{{ tab.id }}" aria-selected="false">
				{{ tab.name }}
			</a>
		</li>
		{% endfor %}
		{% endif %}
		{% if reviews_included %}
		<li class="nav-item" role="presentation">
			<a href="#" class="nav-link" id="product-reviews-tab" data-bs-toggle="pill" data-bs-target="#product-reviews" role="tab" aria-controls="product-reviews" aria-selected="false">
				{{ '_' | jtext: 'COM_JKASSA_REVIEWS' }} ({{ rating_count }})
			</a>
		</li>
		{% endif %}
	</ul>
	<div class="tab-content" id="product-tabContent">
		<!--Description-->
		<div class="tab-pane fade show active" id="product-description" role="tabpanel" aria-labelledby="product-description-tab">
			{{ fulltext }}
		</div>
		{% if attributes %}
		<!--Attributes-->
		<div class="tab-pane fade" id="product-attributes" role="tabpanel" aria-labelledby="product-attributes-tab">
			<dl class="row">
				{% for attribute in attributes %}
				<dt class="col-sm-4">{{ attribute.name }}</dt>
				<dd class="col-sm-8">
					{{ attribute.value }}
					{% if attribute.tooltip %}
					<span class="hasTooltip" title="{{ attribute.tooltip }}">
						<span class="fas fa-question-circle"></span>
					</span>
					{% endif %}
				</dd>
				{% endfor %}
			</dl>
		</div>
		{% endif %}
		{% if tabs %}
		{% for tab in tabs %}
		<div class="tab-pane fade" id="product-{{ tab.id }}" role="tabpanel" aria-labelledby="product-{{ tab.id }}-tab">
			{{ tab.content }}
		</div>
		{% endfor %}
		{% endif %}
		{% if reviews_included %}
		<!--Reviews-->
		<div class="tab-pane fade" id="product-reviews" role="tabpanel" aria-labelledby="product-reviews-tab">
			{% include 'html/reviews/reviews' %}
		</div>
		{% endif %}
	</div>
</div>

{% comment %}
	Joomla events (fields).
{% endcomment %}
{{ event.afterDisplayContent }}

{% if cheaper %}
<!--Share: Together cheaper-->
<div class="mt-3">
	<h3>{{ '_' | jtext: 'COM_JKASSA_CART_TOGETHER_CHEAPER' }}</h3>
	{% include 'html/products/cheaper' %}
</div>
{% endif %}

{% if quickview == 0 %}
{% if show_icons %}
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
<!--Print-->
<div class="btn btn-primary no-print" style="position: fixed; right: 10px; top: 10px">
	{{ print_screen }}
</div>
{% endif %}
{% endif %}

{% if show_info %}
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
	{% if parent_title %}
	<li class="breadcrumb-item active">
		<span class="fas fa-folder"></span>
		{% capture parent %}<a href="{{ parent_url }}">{{ parent_title }}</a>{% endcapture %}
		{{ 'sprintf' | jtext: 'COM_JKASSA_PARENT', parent }}
	</li>
	{% endif %}
	<li class="breadcrumb-item active">
		<span class="fas fa-folder-open"></span>
		{% capture category %}<a href="{{ category_url }}">{{ category_title }}</a>{% endcapture %}
		{{ 'sprintf' | jtext: 'COM_JKASSA_CATEGORY', category }}
	</li>
	<li class="breadcrumb-item active">
		<span class="fas fa-calendar"></span>
		<time>
			{% assign date_publish = 'date' | jhtml: publish, 'DATE_FORMAT_LC2' %}
			{{ 'sprintf' | jtext: 'COM_JKASSA_PUBLISHED_DATE_ON', date_publish }}
		</time>
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
	<li class="breadcrumb-item active">
		<span class="fas fa-eye"></span>
		{{ 'sprintf' | jtext: 'COM_JKASSA_PRODUCT_HITS', hits }}
	</li>
</ul>
{% endif %}

{% if pagination and show_nav %}
<!--Pagination-->
<nav aria-label="Page navigation">
	<ul class="pagination justify-content-center">
		{% if pagination.prev %}
		<li class="page-item">
			<a class="page-link" href="{{ pagination.prev }}">
				<span class="fas fa-arrow-circle-left"></span> {{ '_' | jtext: 'JPREV' }}
			</a>
		</li>
		{% endif %}
		{% if pagination.next %}
		<li class="page-item">
			<a class="page-link" href="{{ pagination.next }}">
				{{ '_' | jtext: 'JNEXT' }} <span class="fas fa-arrow-circle-right"></span>
			</a>
		</li>
		{% endif %}
	</ul>
</nav>
{% endif %}
{% endif %}

{% comment %}
	Madal body for Waiting List.
{% endcomment %}
{% if waitinglist %}
{% assign modal_title = '_' | jtext: 'COM_JKASSA_WAITINGLIST' %}
{% assign options = 'title,url,bodyHeight' | arrayCombine: modal_title, waitinglist, 80 %}
{{ 'renderModal' | bootstrap5: 'jk-modal_waitinglist', options }}
{% endif %}

{% comment %}
	Madal body for Quick order.
{% endcomment %}
{% if quickorder %}
{% assign modal_title = '_' | jtext: 'COM_JKASSA_QUICK_ORDER' %}
{% assign options = 'title,url,bodyHeight' | arrayCombine: modal_title, quickorder, 80 %}
{{ 'renderModal' | bootstrap5: 'jk-modal_quickorder', options }}
{% endif %}

{% comment %}
  Madal body for Affiliate Links.
{% endcomment %}
{% if aff_income %}
{% assign modal_title = '_' | jtext: 'COM_JKASSA_AFFILIATE_PROGRAM' %}
{% assign options = 'title,url,bodyHeight' | arrayCombine: modal_title, aff_url, 80 %}
{{ 'renderModal' | bootstrap5: 'jk-modal_affiliate', options }}
{% endif %}
