{*{include file="breadcrumbs.tpl" show_last_breadcrumb=1}*}

<div class="grey news-date">
	{$menu.active.record.created|@date_format:"%e"}
	{$menu.active.record.created|@date_format:"%m"|@month_title:genitive}
	{$menu.active.record.created|@date_format:"%Y"}
</div>

{if $menu.active.record->parseTextAsTemplate()|count_characters > 0}
<div class="details b-rich-text">
    {$menu.active.record->parseTextAsTemplate() nofilter}
</div>
{else}
<h1 class="b-static-title">{$menu.active.record.title|replace:'/*br*/':'<br>' nofilter}</h1>

<div class="details b-rich-text">
    {$menu.active.record.text|@html_entity_decode nofilter}
</div>
{/if}

<div class="return-to-list">
	<span class="btn-link btn-link-blue">
		<a class="btn-link-i" href="{$menu.www->news.href}">{'Вернуться к списку'|translate}</a>
	</span>
</div>

{include file="social-buttons.tpl"}