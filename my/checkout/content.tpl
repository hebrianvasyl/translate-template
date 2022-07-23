<!doctype html>
<html lang="ru">
	<title>{$head.title}</title>
	<meta charset="utf-8">

	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	{foreach from=$head.meta key=name item=content}
		{if $name=='opengraph'}
			{foreach from=$content key=property item=value}
				<meta property="{$property}" content="{$value}">
			{/foreach}
		{else}
			<meta name="{$name}" content="{$content}">
		{/if}
	{/foreach}

	{if !empty($settings.path.favicon)}
		<link rel="shortcut icon"  type="image/x-icon"  href="{$settings.path.images}/{$settings.path.favicon}">
	{/if}

	{if isset($cookie_domain)}
		<script>{template_script_fetch file="referrer-check.js"}</script>
	{/if}
	{if !empty($settings.gtm.id)}
		<script type="text/javascript">
			dataLayer = [];
		</script>
	{/if}

	<link href='{$settings.path.site_main_domain}checkout.css' rel='stylesheet' type='text/css'>
	<link href='{$settings.path.site_main_domain}adaptive.css' rel='stylesheet' type='text/css' media="(max-width: 1200px)">

	{$head.js.head nofilter}

	{$settings.Goods_SEO.head_scripts nofilter}
<body>
	{include file="gtm-code.tpl"}

	{Controller->getBody}

	{$head.js.footer nofilter}

	{include file="content-footer.tpl"}

<!-- current time: {$smarty.now|date_format:"%A, %B %e, %Y %T"} -->
</body>
</html>