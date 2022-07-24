{if !empty($accessories) and count($accessories)}
		<h2 class="tabs-content-title">{'С этим товаром покупают'|translate}:</h2>

		{if count($accessories) > 5}
			<a href="#" class="tabs-content-link underline novisited switch_to_accessories" name="switch_to_accessories">{'Все аксессуары'|translate}</a>
		{/if}

		<ul class="goods-l" name="accessories_items">

			{foreach from=$accessories item="record"}
				{if $record@iteration <= 5}

					{include file='goods/purchase_goods_id.tpl' scope=parent}

					<li class="goods-l-i clearfix" id="goods{$purchase_goods_id}">
						<div class="g-l-i-img">
							<a class="g-l-i-img-link" href="{$record.external_href}" name="goods-link" data-link-id="goods-link-{$record.id}"]>
								<div class="g-l-i-img-link-i">

									<div class="pp-image-wrap g-i-tile-img-wrap">
										<img class="g-l-i-img-link-i-img g-i-tile-img" alt="{$record.title|escape:'quotes'}"
											 title="{$record.title|escape:'quotes'}"
											 name="tips-{$record.id}" src="{$record->attachments->images.medium.url}"
											 width="{$record->attachments->images.medium.width}"
											 height="{$record->attachments->images.medium.height}"
										/>
									</div>
								</div>
							</a>
						</div>

						<div class="g-l-i-details">
							<div class="g-details-title">
								{if $record.sub_title_big}
									{$record.sub_title_big}
								{/if}
							</div>
							<div class="g-details-sub-title-small">
								{if $record.sub_title_small}
									{$record.sub_title_small}
								{else}
									{$record.title}
								{/if}
							</div>
						</div>

						{include file="goods/rating.tpl"}

						{if $record.sell_status=="unavailable" or $record.sell_status=="waiting_for_supply" or $record.sell_status=="call"}
							<div class="g-l-i-status">{$record->sell_status->value.title}</div>
						{else}
							<div class="price-block">
								<span>{'Цена'|translate}:</span>
								{if !empty($record.old_price) && ($record.old_price > $record.price)}
									<span class="old-price">{$record->old_price nofilter}</span>
								{/if}
								<span class="price">{$record->price nofilter}</span>
							</div>
						{/if}

						<div class="g-l-i-price-buy" style="margin-top: 13px;">
							{include file='goods/details/sidebar-accessories-price-block.tpl'}
						</div>

                        <script>
                            var good = {
                                "name": "{$record.title}",
                                "id": "{$record.id}",
                                "price": "{$record->price->getValueByDecimals(0, '.', '')}",
                                "brand": "{$record->producer}",
                                "category": "{$record->parent}"
                            };

                            EEProcessor.productImpressions([good]);

                            $$('a[data-link-id="goods-link-{$record.id}"]').addEvent('click', function(e){
                                e.preventDefault();

                                EEProcessor.productClick([good], $(this).get('href'));

                                return false;
                            });
                        </script>
					</li>
				{/if}
			{/foreach}

		</ul>


	<script type="text/javascript">
		$$("a[name=switch_to_accessories]").addEvent('click',function(e){
			var event = new DOMEvent(e);
			event.stop();
			goodTabs.switchTab( $$("li[name=accessories]")[0] );
			new Fx.Scroll(window,{ duration:300 }).toElement($('details-tabs-menu'));
		});
	</script>

{/if}