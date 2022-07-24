{$discount_value = 0}
{if $record_tmp.old_price && $record_tmp.old_price > $record_tmp.price}
{$discount_value = -floor(($record_tmp.old_price - $record_tmp.price) / $record_tmp.old_price * 100)}
{/if}

<div class="pp-price-label {$record_tmp.sell_status} {if $record_tmp.old_price && $record_tmp.old_price > $record_tmp.price}with-sell-price{/if}">
    {if $record_tmp.sell_status == "unavailable" || $record_tmp.sell_status == "waiting_for_supply"}
    <div name="sell_status" class="status status-unavailable">
        <div class="sell-status-title">
            {$record_tmp.sell_status}
        </div>
    </div>
    <div class="let-me-know m-top-15 aligned-center" name="waitlist_details"></div>
    {elseif $record_tmp.sell_status == "archive"}
    <div class="status sell-status-title status-archive">{'Снят с продаж'|translate}</div>
    {else}

    <div name="sell_status" class="status status-{$record_tmp.sell_status} {if $record_tmp.sell_status == "call"}before{/if}">
    <div class="sell-status-title">
        {$record_tmp->sell_status->value.title}
    </div>
</div>

{if $record_tmp.price}
<!--вывод правого блока с ценой-->
<div class="pp-price-label-i coast-block {if $record_tmp.old_price && $record_tmp.old_price > $record_tmp.price}sell-price{/if}">
    <div class="pp-price-old-wrap">
        {if $record_tmp.old_price && $record_tmp.old_price > $record_tmp.price}
        <div class="pp-price-cost pp-price-cost-old crossed">
            {$record_tmp->old_price nofilter}
        </div>
        {if $discount_value != 0}
        <div class="pp-price-discount-value">{$discount_value}%</div>
        {/if}
        {/if}
    </div>
    <div class="pp-price-cur-wrap">
        <div class="pp-price-cost uah pp-price-cost-cur">
            {$record_tmp->price nofilter}
        </div>
    </div>
</div>
{/if}
<!--вывод левого блока с кнопкой-->
<div class="pp-price-label-i">
    <div class="pp-to-buy clearfix" name="buy_details">
            <span class="g-l-i-price-buy">
                <a class="btn-link-i g-buy" name="topurchases" class="make-order g-buy">
                    {if $record_tmp.sell_status == "customized"}Под заказ{else}Купить{/if}
                </a>
            </span>
        </form>
    </div>
    <div class="additional-btn-place">&nbsp;</div>
</div>
{/if}
</div>