{$characteristicsShownInParent = $inner_record->getCharacteristicsShownInParent()}
{if count($characteristicsShownInParent)}
<table class="characteristics-t">
    <caption class="" style="text-align: center">
        {if !empty($detail_record.filter_title)}
        {$detail_record.filter_title}
        {else}
        {$detail_record.title}
        {/if}
    </caption>
    {foreach from=$characteristicsShownInParent item="detail"}
    <tr>
        <td class="characteristics-t-subtitle">
            <span class="characteristics-t-subtitle-text info-title"
                gtm-data='{ "eventLabel":"characteristic"}'
            >
                {if !empty($detail.filter_title)}
                {$detail.filter_title}:
                {else}
                {$detail.title}:
                {/if}
                {if !empty($detail.description)}
                    {include file="goods/catalog/glossary/popup_info.tpl" field=$detail glossary_href="{$inner_record->parent->menu_node.href}glossary/"}
                {/if}
            </span>
        </td>
        <td class="characteristics-t-value">
            {if $detail.type == 'Suggest' and !empty($detail.record_ref)}
            <a href="{$detail->ref_record.external_href}" target="_blank">
                {$detail->ref_record.sub_title_big}
            </a>
            {else}
            {$detail|replace:'/*br*/':'<br>'|escape:'quotes' nofilter}
            {/if}
        </td>
    </tr>
    {/foreach}
    <tfoot>
        <tr>
            <td colspan="2">
                <p class="pl-30 text-center">
                    <br>
                    <a href="{$inner_record.external_href}" class="more-btn blue" target="_blank">{'Узнать подробнее'|translate}</a>
                </p>
            </td>
        </tr>
    </tfoot>
</table>
{/if}