{if !empty($goods_icons)}
<div class="clearfix hidden">
    {*if isset($exclusive) and $exclusive == '1'*}
    {*<h4 class="goods-icons-title">{'ЭКСКЛЮЗИВНАЯ КОМПЛЕКТАЦИЯ'|translate}:</h4>*}
    {*else*}
    <h4 class="goods-icons-title">{'КОМПЛЕКТАЦИЯ'|translate}:</h4>
    {*/if*}
</div>

<div class="goods-icons-wrap clearfix">
    {*	Вывод дополнительных иконок *}
    {include file="goods-icons/details-icons.tpl" icons=$goods_icons hide_docket=$hide_docket}
    {*	END Вывод дополнительных иконок *}
</div>
{/if}

{if count($characteristics) and (empty($goods_icons) or count($goods_icons) < 3)}
<table class="pp-characteristics-table">
    {foreach from=$characteristics item='detail'}
    <tr>
        <td>
            <strong>
                {if !empty($detail.filter_title)}
                {$detail.filter_title}:
                {else}
                {$detail.title}:
                {/if}
            </strong>
        </td>
        <td>
            {$detail|replace:'/*br*/':'<br>' nofilter}
        </td>
    </tr>
    {/foreach}
</table>
{/if}