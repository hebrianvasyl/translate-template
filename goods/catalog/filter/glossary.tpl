{if $menu.active.group == 'producers'}
	{$glossary_href = "{$menu.active->parent.external_base_href}glossary/"}
{else}
	{$glossary_href = "{$menu.active.external_base_href}glossary/"}
{/if}
{include file="goods/catalog/glossary/popup_info.tpl" glossary_href=$glossary_href}