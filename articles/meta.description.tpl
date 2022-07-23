{strip}
    {if $menu.active.record.description}{$menu.active.record.description}{else}{if $menu.active.title}{$menu.active.title|replace:'/*br*/':''}{/if} {$settings.Contacts.title}{/if}
{/strip}