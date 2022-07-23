<div class="g-l-i-price">
	{if $record.type !== 'configurable'}
		{if $record.sell_status=="limited"}
			<div class="g-l-i-status status-limited">{$record->sell_status->value.title}</div>
		{/if}
		{if !empty($record.price)}
			<div class="accsesories-btn" name="buy_catalog"></div>
			<div class="hidden" name="price">{$record->price nofilter}</div>
		{/if}
	{else}
		{$record_prices = $record -> sku -> getATPPricesForGroup()}
		{if !empty($record_prices.min)}
			<div class="btn-grey small submit-btn accsesories-btn ab-configurable">
				<div>{if empty($record_prices.is_same)} от {/if}{$record_prices.min nofilter}</div>
				<div class="g-l-i-price-buy">
					<span class="g-buy"></span>
				</div>
			</div>
		{/if}
	{/if}
</div>

<ul class="g-compare-l clearfix">
	<li class="g-compare-l-i" name="compare_details"></li>
	<li class="g-compare-l-i" name="wishlists"></li>
</ul>

{if !$record -> sku}
	<script type="text/javascript">
        GoodsCatalog.addEntity('Goods', { 'goods_id': {$purchase_goods_id}{if $record->getPrice()},  'added_to_cart_price': {$record->getPrice()}{/if}, 'content_record_id': {$record.id} });
	</script>
{else}
	<script type="text/javascript">
        var catalog_entity = GoodsCatalog.addEntity(
            'Sku',
            {
                'goods_id': {$purchase_goods_id}
                {if !empty($record_prices_by_sku.min)}, 'added_to_cart_price': {$record_prices_by_sku.min->getValue()} {/if}
                , 'content_record_id': {$record.id}
            }
        );
        {if $record.type == 'configurable'}
        catalog_entity.getDataFromSource().goods_id = null;
        {/if}
	</script>
{/if}
