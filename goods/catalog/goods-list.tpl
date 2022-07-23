{include file='goods/purchase_goods_id.tpl' scope=parent}

{Promotions->getLast goods_record=$record relation_name="goods" limit=1 only_active_promotions="1" assign="promotion_record"}

{capture name="tag_title"}
	{if $record->getFirstTag() == 'popularity'}
		Хит продаж
	{elseif $record->getFirstTag() == 'novelty'}
		Новинка
	{elseif $record->getFirstTag() == 'recommended'}
		Акция
	{/if}
{/capture}

{if $record->getFirstTag() == 'recommended'}
{if $record.old_price > $record.price}
{$discount = round(($record.old_price-$record.price)/$record.old_price*100)}
{if $discount > 99}{$discount = 99}{/if}
{capture name="tag_title"}{$smarty.capture.tag_title} - {$discount}%{/capture}
{/if}
{/if}

{capture name="additional_tags"}
	{foreach $record->getGoods()->relations->tags->getActiveRecords() as $relation}
		{$additional_tag = $relation->to}
		{if $additional_tag.slot == 'left_side' and $additional_tag->attachments->image.large.url != ''}
			<div class="tag additional-tag-link-img">
				<img class="additional-tags-img"
					 src="{$additional_tag->attachments->image.large.url nofilter}">
				<span>{$additional_tag.title}</span>
			</div>
		{/if}
	{/foreach}
{/capture}

{capture name="additional_tags_right"}
    {foreach $record->getGoods()->relations->tags->getActiveRecords() as $relation}
        {$additional_tag = $relation->to}
        {if $additional_tag.slot == 'right_side' and $additional_tag->attachments->image.large.url != ''}
        <div class="tag right-bottom additional-tag-link-img">
            <img class="additional-tags-img"
                    src="{$additional_tag->attachments->image.large.url nofilter}">
        </div>
        {/if}
    {/foreach}
{/capture}

{capture name="additional_class"}
{if count($promotion_record) or $record->getFirstTag() == 'recommended'}
g-l-i-list-promotion-record
{elseif count($record->getFirstTag()) or $smarty.capture.additional_tags|strip|count_characters > 0}
g-l-i-list-hit-record
{elseif !empty($record.old_price) && ($record.old_price > $record.price)}
g-l-i-list-promotion-record
{/if}
{/capture}

<div class="g-l-i {$smarty.capture.additional_class}" id="goods{$purchase_goods_id}">
	<div class="g-l-i-content">
		<div class="g-l-i-content-i">
			<div class="g-l-i-img float-lt">
				<div class="g-l-i-img-link-i">

					<div class="additional-tags">
						{if count($promotion_record)}
							<div class="tag tag-action small">
								<img src="{$settings.path.design}/_.gif">
								<span>Акция</span>
							</div>
						{elseif $record->getFirstTag()}
							<div class="tag tag-{$record->getFirstTag()} small">
								<img src="{$settings.path.design}/_.gif">
								<span>{$smarty.capture.tag_title}</span>
							</div>
						{/if}

						{$smarty.capture.additional_tags nofilter}

						{if count($record->relations->videos)}
							<div class="icon-video-container">
								{foreach from=$record->relations->videos item=item name=videos}
									{assign var=video value=$item->record_to}
									{if isset($section)}
										{$href = $record.external_href|cat:"#video_container_"|cat:$video.id}
									{else}
										{$href = "#video_container_"|cat:$video.id}
									{/if}
									<a class="video-review" href="{$href} data-link-id="goods-link-{$record.id}"]">Видеообзор <i class="icon-video"></i></a>
									{break}
								{/foreach}
							</div>
						{/if}
					</div>

					<a class="g-l-i-img-link" href="{$record.external_href}" name="goods-link" data-link-id="goods-link-{$record.id}"]>
						<div class="pp-image-wrap g-list-i-img">
							<img class="g-l-i-img-link-i-img" alt="{$record.title|escape:'quotes'}"
								 title="{$record.title|escape:'quotes'}"
								 name="tips-{$record.id}" src="{$record->attachments->images.medium.url}"
								 width="{$record->attachments->images.medium.width}"
								 height="{$record->attachments->images.medium.height}"
							/>
						</div>
                        <div class="additional-tags-right">
                            {$smarty.capture.additional_tags_right nofilter}
                        </div>
					</a>
				</div>

				{include file="goods/catalog/goods-list-variants.tpl" style="list"}



			</div>

			<div class="list-right">

				<div class="g-l-i-details">
					{if $record.sub_title_big or $record.sub_title_small}
						<a name="goods-link" class="g-l-i-details-title-link" href="{$record.external_href}" data-link-id="goods-link-{$record.id}"]>
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
						</a>
					{else}
						<div class="g-l-i-details-title">
							<a name="goods-link" class="g-l-i-details-title-link" href="{$record.external_href}" data-link-id="goods-link-{$record.id}"]>{$record.title}</a>
						</div>
					{/if}
				</div>

				{if $record.type !== 'configurable'}

					<div class="price-wrap">

						{if $record.sell_status=="unavailable" or $record.sell_status=="waiting_for_supply" or $record.sell_status=="call"}
							<div class="g-l-i-status">{$record->sell_status->value.title}</div>
						{else}
							<div class="price-block">
								<span>Цена:</span>
								<span class="price" name="UAH">{$record->price nofilter}</span>
								{if !empty($record.old_price) && ($record.old_price > $record.price)}
									<span class="old-price">{$record->old_price nofilter}</span>
								{/if}
							</div>
						{/if}

						{* В наличии *}
						{if $record.sell_status=="available"}
							<div class="g-l-i-content-i-wrap available">
								<div class="g-l-i-content-wrap">
									<div class="price">
										{if !empty($record.price)}
											<div class="g-l-i-price btn-grey" name="buy_catalog"></div>
											<div class="hidden" name="price">{$record->price nofilter}</div>

										{/if}
									</div>
								</div>
							</div>

						{* Нет в наличии *}
						{elseif $record.sell_status=="unavailable"}

							<div class="g-l-i-content-i-wrap unavailable">
								<div class="g-l-i-status status-{$record.sell_status} {if $record.sell_status == call}before{/if}">{$record->sell_status->value.title}</div>
								<div class="waitlist-btn-wrap small" name="waitlist_catalog"></div>
							</div>

						{* Заканчивается *}
						{elseif $record.sell_status=="limited"}

							<div class="g-l-i-content-i-wrap limited">
								<div class="g-l-i-status status-{$record.sell_status} {if $record.sell_status == call}before{/if}">{$record->sell_status->value.title}</div>

								<div class="g-l-i-content-wrap clearfix">
									<div class="price float-lt">
										{if !empty($record.price)}
											<div class="g-l-i-price btn-grey" name="buy_catalog"></div>
											<div class="hidden" name="price">{$record->price nofilter}</div>

										{/if}
									</div>
								</div>
							</div>

						{* Ожидается поставка *}
						{elseif $record.sell_status=="waiting_for_supply"}

							<div class="g-l-i-content-i-wrap for-supply">
								<div class="g-l-i-status">{$record->sell_status->value.title}</div>
								<div class="waitlist-btn-wrap small" name="waitlist_catalog"></div>
							</div>

						{* Под заказ *}
						{elseif $record.sell_status=="customized"}

							<div class="g-l-i-content-i-wrap customized">
								<div class="g-l-i-status status-{$record.sell_status} {if $record.sell_status == call}before{/if}">{$record->sell_status->value.title}</div>

								<div class="g-l-i-content-wrap clearfix">
									<div class="price float-lt">
										{if !empty($record.price)}
											<div class="g-l-i-price btn-grey" name="buy_catalog"></div>
											<div class="hidden" name="price">{$record->price nofilter}</div>

										{/if}
									</div>
								</div>
							</div>

						{*Звоните*}
						{elseif $record.sell_status=="call"}

							<div class="g-l-i-content-i-wrap call">
								<div class="g-l-i-status status-{$record.sell_status} {if $record.sell_status == call}before{/if}">{$record->sell_status->value.title}</div>
								{if $record.old_price || $record.price}
									<div class="g-l-i-content-wrap clearfix">
										<div class="price float-lt g-i-price-{$record.sell_status}">
										</div>
									</div>
								{/if}
							</div>
						{/if}
						{*/звоните*}

						<div class="clearfix" style="clear: both; padding-top: 10px;">
							{include file="goods/rating.tpl"}

							<ul class="g-compare-l">
								<li class="g-compare-l-i" name="compare_details"></li>
								<li class="g-compare-l-i" name="wishlists"></li>
							</ul>
						</div>

						{if !$record -> sku or !empty($record.price)}
							<script type="text/javascript">
								GoodsCatalog.addEntity('Goods', { 'goods_id': {$purchase_goods_id}, 'added_to_cart_price': {$record->getPrice()}, 'content_record_id': {$record.id} });
							</script>
						{else}
							{$record_prices = $record -> sku -> getATPPricesForGroup()}
							<script type="text/javascript">
								GoodsCatalog.addEntity('Sku', { 'goods_id': {$purchase_goods_id}{if !empty($record_prices.min)}, 'added_to_cart_price': {$record_prices.min->getValue()} {/if}, 'content_record_id': {$record.id} });
							</script>
						{/if}

					</div>

				{else}
					{$record_prices = $record -> sku -> getATPPricesForGroup()}
					{if !empty($record_prices.min)}
						<div class="g-l-i-content-i-wrap sku-content available">
							<div class="g-l-i-content-wrap">
								<div class="price">
									{if $record_prices.min->getValue()}
										<div class="g-l-i-price">{if empty($record_prices.is_same)} от {/if}{$record_prices.min nofilter}</div>
									{/if}
								</div>
							</div>
						</div>
					{else}
						<div class="g-l-i-content-i-wrap sku-content unavailable">
							{include file="goods/rating.tpl"}
							{*если у товара нет atp-артикулов, то выводим "нет в наличии"*}
							<div class="g-l-i-status">{$record->sell_status.values.unavailable.title}</div>
						</div>
					{/if}
				{/if}

				{if !empty($record->getGoods()->relations->goods_icons) and $record->getGoods()->relations->goods_icons->getActiveCatalogRecords()}
					<div class="goods-icons-full">
						{*	Вывод дополнительных тегов *}
						{*{include file="goods/additional_tags.tpl" pos='catalog'}*}
						{include file="goods-icons/catalog-list-icons-full.tpl"}
						{*	END Вывод дополнительных тегов *}
					</div>
				{else}
					<div class="description">
						<ul>
							{include file="goods/details.tpl"}
						</ul>
					</div>
				{/if}

			</div>
		</div>
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
</div>
