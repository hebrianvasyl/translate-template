<thead class="">
	<tr class="compare-row">
		<td class="first">
			<div class="td_inner">
                {if $menu.active->parent.record->attachments->top and !$menu.active->parent.record->attachments->top.large->isDefault()}
                    {if $menu.active->parent.record->attachments->top.large.width > 0 && $menu.active->parent.record->attachments->top.large.height > 0}
						<div class="catalog-compare-main-img">
                            {$menu.active->parent.record->attachments->top.large nofilter}
						</div>
                    {/if}
                {/if}
			</div>
		</td>

		{foreach from=$goods_records item="record"}

			{include file='goods/purchase_goods_id.tpl' scope=parent}

			{capture name="picture"}
				{if isset($smarty.capture.picture)} {$smarty.capture.picture nofilter} {/if}

				<td name="compare-cell-goods{$record.id}">
					<div class="td_inner">
						<div class="compare-image">
							<div class="g-tile-i-img">
                                {capture name="tag_title"}
                                    {if $record->getFirstTag() == 'popularity'}
										{'Хит продаж'|translate}
                                    {elseif $record->getFirstTag() == 'novelty'}
										{'Новинка'|translate}
                                    {elseif $record->getFirstTag() == 'recommended'}
										{'Акция'|translate}
                                    {/if}
                                {/capture}

								{if $record->getFirstTag()}
									<div class="additional-tags">
										<div class="tag tag-{$record->getFirstTag()} small">
											<img src="{$settings.path.design}/_.gif">
											<span>{$smarty.capture.tag_title}</span>
										</div>
									</div>
								{/if}
								<a href="#" name="delete-from-comparison" goods_id="{$record.id}" class="delete"><img class="delete-img" width="18" height="20" alt="{'очистить'|translate}" src="{$settings.path.design}/_.gif"></a>
								<a href="{$record.external_href}" class="p-image">
									{$record->attachments->images.medium nofilter}
								</a>
							</div>
						</div>
					</div>
				</td>
			{/capture}

			{capture name="title_with_rating"}
				{if isset($smarty.capture.title_with_rating)} {$smarty.capture.title_with_rating nofilter} {/if}
				<td name="compare-cell-goods{$record.id}">
					<div class="td_inner">
						<div class="g-l-i-details">
							<a href="{$record.external_href}">
								<div class="g-details-title">
                                    {$record->sub_title_big}
								</div>
								<div class="g-details-sub-title-small">
                                    {$record->sub_title_small}
								</div>
							</a>
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
								<span class="price" name="UAH">{$record->price nofilter}</span>
							</div>
                        {/if}
					</div>
				</td>
			{/capture}

			{capture name="price"}
				{if isset($smarty.capture.price)} {$smarty.capture.price nofilter} {/if}

				<td name="compare-cell-goods{$record.id}">
					<div class="td_inner">
						<div class="g-i-price-buy" id="goods{$purchase_goods_id}">

							{if $record.type !== 'configurable'}

								{if $record->isATP()}
									<div class="g-i-price-buy-label submit-btn" name="buy_catalog"></div>
									<div class="hidden" name="price">{$record->price nofilter}</div>
								{/if}

								{if $record->isATW()}
									<span name="waitlist_catalog">&nbsp;</span>
								{/if}

								{if !$record -> sku or !empty($record.price)}
									{$goods_price = $record->getPrice()}
								{else}
									{$record_prices = $record -> sku -> getATPPricesForGroup()}
									{$goods_price = $record_prices.min->getValue()}
								{/if}

								<script type="text/javascript">
									GoodsCatalog.addEntity('Goods', { 'goods_id': {$purchase_goods_id}, 'added_to_cart_price': {$goods_price} });
								</script>

							{else}
								{$record_prices = $record -> sku -> getATPPricesForGroup()}
								{if !empty($record_prices.min)}
									<div class="g-l-i-content-i-wrap sku-content available">
										{if $record_prices.min->getValue()}
											<div class="g-l-i-price">
												{if empty($record_prices.is_same)} от {/if}{$record_prices.min nofilter}
											</div>
										{/if}
									</div>
								{else}
									<div class="g-l-i-content-i-wrap unavailable">
										{*если у товара нет atp-артикулов, то выводим "нет в наличии"*}
										<div class="g-l-i-status">{$record->sell_status.values.unavailable.title}</div>
									</div>
								{/if}
							{/if}

						</div>
					</div>
				</td>

			{/capture}

		{/foreach}

		{if isset($smarty.capture.picture)}
		{$smarty.capture.picture nofilter}
	</tr>
{/if}

{if isset($smarty.capture.title_with_rating)}
	<tr>
		<td>&nbsp;</td>
		{$smarty.capture.title_with_rating nofilter}
	</tr>
{/if}

{if isset($smarty.capture.price)}
	<tr class="row-prices">
		<td>
			<div>
				<span class="submit-btn add-more {if count($goods_records) < 2}large{/if}">
					<a href="{$menu.active->parent.href}">{'Добавить еще одну модель'|translate}</a>
				</span>
			</div>
		</td>
		{$smarty.capture.price nofilter}
	</tr>
{/if}
</thead>