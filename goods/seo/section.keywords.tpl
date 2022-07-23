{strip}
	{if $record->seo and $record->seo.keywords}
        {if $menu.active.seo_params}
            {$record->seo.keywords|replace:'{$menu.active.seo_params}':$menu.active.seo_params}
        {else}
            {$record->seo.keywords|replace:'{$menu.active.seo_params}':''}
        {/if}
	{else}
		{$record.title|replace:'{$menu.active.seo_params}':''}
	{/if}
{/strip}