{strip}
	{if $record->seo and $record->seo.description}
		{if $menu.active.seo_params}
			{$record->seo.description|replace:'{$menu.active.seo_params}':$menu.active.seo_params}
		{else}
            {$record->seo.description}
        {/if}
	{else}
		{$record.title}
	{/if}
{/strip}