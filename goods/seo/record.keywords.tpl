{strip}
	{if $record->seo and $record->seo.keywords}
		{$record->seo.keywords}
	{else}
		{$record.title}
	{/if}
{/strip}