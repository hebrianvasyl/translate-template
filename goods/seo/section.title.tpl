{strip}
	{* Шаблон для формирования title страницы. В начале идет название текущей страницы, потом
       через разделитель названия вышележащих пунктов меню *}

	{if $record->seo and $record->seo.title}
		{$record->seo.title}
	{else}
		{$settings.Contacts.title} — {$menu.active.title}{if $titles} | {$titles|@implode:" / "}{/if}
	{/if}
{/strip}