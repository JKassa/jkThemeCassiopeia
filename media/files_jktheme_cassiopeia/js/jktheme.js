/**
 * @copyright  (C) 2008 Open Source Matters, Inc. <https://www.jkassa.com>
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

/* LOADING FOR AJAX
------------------------------------------------ */
$(document).ajaxStart(function() {
	"use strict";

	var outerDiv = $('body');

	$('<div id="jk_loading"></div>')
		.css("background", "rgba(255, 255, 255, 0.8)")
		.css("top", outerDiv.position().top - $(window).scrollTop())
		.css("left", outerDiv.position().left - $(window).scrollLeft())
		.css("width", "100%")
		.css("height", outerDiv.height())
		.css("position", "fixed")
		.css("opacity", "0.80")
		.css("-ms-filter", "progid:DXImageTransform.Microsoft.Alpha(Opacity = 80)")
		.css("filter", "alpha(opacity = 80)")
		.css("zIndex", "60000")
		.appendTo(outerDiv);
	$('<div class="jk_loader"></div>').appendTo('#jk_loading');
}).ajaxStop(function() {
	"use strict";

	$('#jk_loading').remove();
});
