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

{if !$record -> sku or !empty($record.price)}
	<script type="text/javascript">
		GoodsCatalog.addEntity('Goods', { 'goods_id': {$purchase_goods_id}, 'added_to_cart_price': {$record->getPrice()} });
	</script>
{else}
	{$record_prices = $record -> sku -> getATPPricesForGroup()}
	<script type="text/javascript">
		GoodsCatalog.addEntity('Sku', { 'goods_id': {$purchase_goods_id}{if !empty($record_prices.min)}, 'added_to_cart_price': {$record_prices.min->getValue()} {/if} });
	</script>
{/if}
