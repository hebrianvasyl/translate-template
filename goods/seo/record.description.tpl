{strip}
	{if $record->seo and $record->seo.description}
		{$record->seo.description}
	{else}
		{$record.title}
	{/if}
{/strip}