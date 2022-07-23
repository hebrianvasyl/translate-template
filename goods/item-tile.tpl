{include file='goods/purchase_goods_id.tpl' scope=parent}

{assign var="additional_class" value=''}
{if $record->getFirstTag() == 'recommended' || (!empty($record.old_price) && ($record.old_price > $record.price))}
{assign var="additional_class" value='g-l-i-promotion-record'}
{elseif count($record->getFirstTag())}
{assign var="additional_class" value='g-l-i-hit-record'}
{/if}

{capture name="tag_title"}
{if $record->getFirstTag() == 'popularity'}
Хит продаж
{elseif $record->getFirstTag() == 'novelty'}
Новинка
{elseif $record->getFirstTag() == 'recommended'}
Акция
{/if}
{/capture}

{capture name="left_top_tags"}
{$left_top_tags = $record->getCatalogTags('left_top_side')}
{if count($record->relations->videos) > 0 or count($left_top_tags) > 0}
<div class="additional-tags left-top">
    {foreach from=$left_top_tags item=tag}
	<div class="tag tag-{$tag.class}" {if $tag.bg_color} style="background-color: #{$tag.bg_color};"{/if}>
		{if $tag.image}
			<img class="additional-tags-img lazyload" data-src="{$tag.image}">
		{/if}
		<span{if $tag.text_color} style="color: #{$tag.text_color};"{/if}>{$tag.title}</span>
    </div>
    {/foreach}

    {if count($record->relations->videos)}
    <div class="icon-video-container">
        {foreach from=$record->relations->videos item=item name=videos}
        {assign var=video value=$item->record_to}
        {if isset($section)}
        {$href = $record.external_href|cat:"#video_container_"|cat:$video.id}
        {else}
        {$href = "#video_container_"|cat:$video.id}
        {/if}
        <a class="video-review" href="{$href}" data-link-id="goods-link-{$record.id}"]>Видеообзор <i class="icon-video"></i></a>
        {break}
        {/foreach}
    </div>
    {/if}
</div>
{/if}
{/capture}

{capture name="left_bottom_tags"}
{$left_bottom_tags = $record->getCatalogTags('left_bottom_side')}
{if count($left_bottom_tags) > 0}
<div class="additional-tags left-bottom">
    {foreach from=$left_bottom_tags item=tag}
    <div class="tag tag-{$tag.class}">
        <img class="additional-tags-img" src="{$tag.image}">
    </div>
    {/foreach}
</div>
{/if}
{/capture}

{capture name="right_top_tags"}
{$right_top_side = $record->getCatalogTags('right_top_side')}
{if count($right_top_side) > 0}
<div class="additional-tags right-top">
    {foreach from=$right_top_side item=tag}
    <div class="tag tag-{$tag.class}">
        <img class="additional-tags-img" src="{$tag.image}">
    </div>
    {/foreach}
</div>
{/if}
{/capture}

{capture name="right_bottom_tags"}
{$right_bottom_side = $record->getCatalogTags('right_bottom_side')}
{if count($right_bottom_side) > 0}
<div class="additional-tags right-bottom">
    {foreach from=$right_bottom_side item=tag}
    <div class="tag tag-{$tag.class}">
        <img class="additional-tags-img" src="{$tag.image}">
    </div>
    {/foreach}
</div>
{/if}
{/capture}

<div class="g-l-i-content {$additional_class}">
	<div class="g-l-i-content-i" id="goods{$purchase_goods_id}">
		<div class="g-img"
            goods-data-gtm='{ "name": "{$record.title}", "id": "{$record.id}", "price": "{$record->price->getValueByDecimals(0, '.', '')}", "brand": "{$record->producer}", "category": "{$record->parent}"}'
        >
			<a href="{$record.external_href}" class="g-l-i-img-link" name="goods-link" data-link-id="goods-link-{$record.id}">
				<div class="g-img-link-i">
					<div class="pp-image-wrap">
						<img class="tips"
							 alt="{$record.title|escape:'quotes'}"
							 title="{$record.title|escape:'quotes'}"
							 name="tips-{$record.id}" src="{$record->attachments->images.medium.url}"
							 width="{$record->attachments->images.medium.width}"
							 height="{$record->attachments->images.medium.height}"
						/>
					</div>
                    {$smarty.capture.left_top_tags nofilter}
                    {$smarty.capture.left_bottom_tags nofilter}
                    {$smarty.capture.right_top_tags nofilter}
                    {$smarty.capture.right_bottom_tags nofilter}
				</div>
			</a>
		</div>

		<div class="goods-icons-wrap">
		    {include file="goods-icons/item-tile-icons.tpl"}
		</div>

		<div class="g-l-i-details">
			<a href="{$record.external_href}" data-link-id="goods-link-{$record.id}">
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
		</div>

		{include file="goods/item-tile-rating.tpl"}

		<div class="price-block">
			<span>Цена:</span>
			{if !empty($record.old_price) && ($record.old_price > $record.price)}
				<span class="old-price">{$record->old_price nofilter}</span>
			{/if}
			<span class="price" name="UAH">{$record->price nofilter}</span>
		</div>

		<div class="g-info-l description">
			<div class="g-l-i-price">
                {if $record.type !== 'configurable'}
                    <div class="g-l-i-status status-{$record.sell_status}">{$record->sell_status->value.title}</div>

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
		</div>
	</div>
</div>
<script type="text/javascript">
	var goods_item = GoodsCatalog.getItem('{$purchase_goods_id}');
	if (goods_item) {
		goods_item.update();
	}
</script>
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