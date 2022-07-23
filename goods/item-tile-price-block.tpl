{if !empty($show_active_catalog_buttons) and empty($record.new_record)}
	<ul class="g-compare-l clearfix">
		<li class="g-compare-l-i" name="compare_catalog"></li>
		<li class="g-compare-l-i" name="wishlists"></li>
	</ul>
{/if}

{if $record.type !== 'configurable'}
	{include file="goods/catalog/goods-tile-price-block.tpl"}
{else}
	{$record_prices = $record -> sku -> getATPPricesForGroup()}
	{if (!isset($has_atp) or $has_atp) and !empty($record_prices.min)}
		<div class="g-l-i-content-i-wrap sku-content available">
			{if $record_prices.min->getValue()}
				<div class="g-l-i-price">{if empty($record_prices.is_same)} от {/if}{$record_prices.min nofilter}</div>
			{/if}
		</div>
	{else}
		<div class="g-l-i-content-i-wrap sku-content unavailable">
			{*если у товара нет atp-артикулов, то выводим "нет в наличии"*}
			<div class="g-l-i-status">{$record->sell_status.values.unavailable.title}</div>
		</div>
	{/if}
{/if}

{if !$record -> sku}
	<script type="text/javascript">
		GoodsCatalog.addEntity('Goods', { 'goods_id': {$purchase_goods_id}{if $record->getPrice()},  'added_to_cart_price': {$record->getPrice()}{/if}, 'content_record_id': {$record.id} });
	</script>
{else}
	{$record_prices = $record -> sku -> getATPPricesForGroup()}
	<script type="text/javascript">
		var catalog_entity = GoodsCatalog.addEntity(
				'Sku',
				{
					'goods_id': {$purchase_goods_id}
					{if !empty($record_prices.min)}, 'added_to_cart_price': {$record_prices.min->getValue()} {/if}
					, 'content_record_id': {$record.id}
				}
		);
		{if $record.type == 'configurable'}
			catalog_entity.getDataFromSource().goods_id = null;
		{/if}
	</script>
{/if}
