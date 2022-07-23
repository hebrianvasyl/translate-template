{strip}
    {if $menu.active.record.keywords}{$menu.active.record.keywords}{else}{if $menu.active.title}{$menu.active.title|replace:'/*br*/':''}{/if} {$settings.Contacts.title}{/if}
{/strip}