<head>
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
<link href="/style.css" rel="stylesheet" type="text/css" media="(min-width: 1200px)">
<link href="/main.css" rel="stylesheet" type="text/css" media="(min-width: 1200px)">
<link href="/desctop.css" rel="stylesheet" type="text/css" media="(min-width: 1200px)">
<link href="/adaptive.css" rel="stylesheet" type="text/css" media="(max-width: 1200px)">
{if isset($cookie_domain)}
	<script>{template_script_fetch file="referrer-check.js"}</script>
{/if}
{if !empty($settings.gtm.id)}
    <script type="text/javascript">
        dataLayer = [];
    </script>
{/if}
{$head.js.head nofilter}

<meta name="google-site-verification" content="BED4RUvrSxvBV36O67jBbO9Go255O02K90ebWxdmZHw" />

{$settings.Goods_SEO.head_scripts nofilter}
</head>