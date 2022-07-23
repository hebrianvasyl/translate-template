{strip}
    {if $menu.active.record.meta_title}{$menu.active.record.meta_title}{else}{$settings.Contacts.title}{if $menu.active.title} — {$menu.active.title|replace:'/*br*/':''}{/if}{if $titles} | {$titles|@implode:" / "}{/if}{/if}
{/strip}