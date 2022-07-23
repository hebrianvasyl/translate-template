{if !$record.hide_goods_on_promotion_page}
	{Promotions->getRelatedGoods promotion_record=$record assign="goods_records"}

	{if count($goods_records)}
		{assign var='goods_records' value=$goods_records}

		<div class="catalog">
			<h2 class="promotions-goods-title">Товары из этой акции</h2>
			<div class="g hits g-tile">
				<ul class="g-l catalog-l" name="promotion-goods">
					{foreach $goods_records as $record}
						<li class="g-l-i" enhanced-gtm-data='{
							"ecommerce": {
								"click": {
									"actionField": { "list": "Promotions"},
									"products": [{
										"name": "{$record.title}",
										"id": "{$record.id}",
										"price": "{$record->price->getValueByDecimals(0, '.', '')}",
										"brand": "{$record->producer}",
										"category": "{$record->parent}"
									}]
								}
							}
						}'>
						    {include file="goods/catalog/goods-tile.tpl" record=$record}
						</li>
					{/foreach}
				 </ul>
			</div>
		</div>
		<script>
			new GTMEvents([
					{ //добавление товара из страницы Акции
						selector: '[name=promotion-goods] a[name=topurchases]',
						event: 'click',
						gtm_data: {
							event: "OWOX",
							eventCategory: 'Cart',
							eventAction: 'addFromPromotion',
							eventLabel: '{$menu.active.record['title']}'
						},
						depend_on_event: {
							object: GoodsCatalog,
							event: 'catalogUpdate'
						}
					}
				]);

			new GTMEvents([
				{ //переход на карточку товара из страницы Акции
					selector: '[name=goods-link]',
					event: 'click',
					gtm_data: {
						event: "EnhancedOWOX",
						eventAction: 'productClick'
					}
				}
			]).setOptions({ "gtm_attribute_name": 'enhanced-gtm-data'});

		</script>


	{/if}

{/if}