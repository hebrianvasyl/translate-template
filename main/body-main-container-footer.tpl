<div id="short_text" class="text-description-content">
	{if !empty($menu.active.page.home_h1)}
		<p class="about-site-text">{$menu.active.page.home_h1 nofilter}</p>
	{/if}
	{if !empty($menu.active.page.home_textblock)}
		<p class="about-site-text">{$menu.active.page.home_textblock nofilter}</p>
	{/if}

	{include file="social-buttons.tpl"}
</div>
{*<div class="text-description-more">*}
	{*<a href="#" id="short_text_show_link" class="novisited arrow-link text-description-more-link">*}
		{*<span class="xhr arrow-link-inner">Читать полностью</span>&nbsp;→*}
	{*</a>*}
{*</div>*}
{*<script>*}
	{*$('short_text_show_link').addEvent('click', function(event) {*}
		{*event.preventDefault();*}
		{*$$('.text-description-content').removeClass('box-hide');*}
		{*$('short_text_show_link').destroy();*}
	{*});*}
{*</script>*}