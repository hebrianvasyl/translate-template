{Controller->getRecords parent_id=0 is_section=1 order=order assign=categories}
{if count($categories)}
    <div class="static-page-cateogries">
        <ul>
            {if ($menu.active != $item)}
            <li>
                {else}
            <li class="active">
                {/if}
                <a href="{$item.href}">Все</a>
            </li>

            {foreach from=$categories item=category}
                {if isset($menu.active.record) && $menu.active.record->name.value == {$category.name}}
                    <li class="active">
                        {else}
                    <li>
                {/if}
                <a href="{$category.href}">{$category.title}</a>
                </li>
            {/foreach}
        </ul>
    </div>
{/if}