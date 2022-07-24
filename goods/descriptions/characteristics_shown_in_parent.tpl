{$characteristicsShownInParent = $inner_record->getCharacteristicsShownInParent()}
{if count($characteristicsShownInParent)}
<div class="main">
    <section class="tablet">
        <div class="tablet-info">
            <div class="left">
                <img src="{$inner_record->get('image')}" alt="{$inner_record.title}">
            </div>
            <div class="right">
                <div class="title">
                    {if !empty($detail_record.filter_title)}
                    {$detail_record.filter_title}
                    {else}
                    {$detail_record.title}
                    {/if}
                </div>
                {foreach from=$characteristicsShownInParent item="detail"}
                <p class="silver-color">{$detail.title}:</p>
                <div class="text">
                    {if $detail.type == 'Suggest' and !empty($detail.record_ref)}
                    <a href="{$detail->ref_record.external_href}" target="_blank">
                        {$detail->ref_record.sub_title_big}
                    </a>
                    {else}
                    {$detail|replace:'/*br*/':'<br>'|escape:'quotes' nofilter}
                    {/if}
                </div>
                {/foreach}
                <div class="button">
                    <a href="{$inner_record.external_href}" target="_blank">{'Узнать подробнее'|translate}</a>
                </div>
            </div>
        </div>
    </section>
</div>
{/if}