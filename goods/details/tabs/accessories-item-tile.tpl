{if !isset($list)}
{$list = "Tab_Accessories"}
{/if}

{capture name="details"}
{include file="goods/details.tpl"}
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

{assign var="class" value=''}
{if !empty($record.old_price) && ($record.old_price > $record.price)}
{$class='red-price'}
{elseif count($record->getFirstTag()) or $smarty.capture.left_top_tags|strip|count_characters > 0}
{$class='blue-price'}
{/if}

{$smarty.capture.left_top_tags nofilter}

<div class="g-l-i-content clearfix {$class}" data-goods-id="{$record.id}">
    <div class="g-l-i-content-i">
	<div class="g-l-i-img">
		<a
            class="g-l-i-img-link"
            href="{$record.external_href}"
            name="goods-link"
            data-link-id="goods-link-{$record.id}"
        >
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
            {$smarty.capture.left_bottom_tags nofilter}
            {$smarty.capture.right_top_tags nofilter}
            {$smarty.capture.right_bottom_tags nofilter}
		</a>
	</div>

	<div class="g-l-i-details">
		<a
            href="{$record.external_href}"
            data-link-id="goods-link-{$record.id}"
        >
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

    {include file="goods/rating.tpl"}

    {if $record.sell_status=="unavailable" or $record.sell_status=="waiting_for_supply" or $record.sell_status=="call"}
		<div class="g-l-i-status">{$record->sell_status->value.title}</div>
    {else}
		<div class="price-block">
			<span>Цена:</span>
            {if !empty($record.old_price) && ($record.old_price > $record.price)}
				<span class="old-price">{$record->old_price nofilter}</span>
            {/if}
			<span class="price">{$record->price nofilter}</span>
		</div>
    {/if}

	<div class="g-info-l description">

        {if $record -> sku and empty($record_prices_by_sku)}
            {$record_prices_by_sku = $record -> sku -> getATPPricesForGroup()}
        {/if}

        {if $record.type !== 'configurable'}
            {include file="goods/catalog/goods-tile-price-block.tpl"}
        {else}
            {if (!isset($has_atp) or $has_atp) and !empty($record_prices_by_sku.min)}
				<div class="g-l-i-content-i-wrap sku-content available">
                    {if $record_prices_by_sku.min->getValue()}
						<div class="g-l-i-price">{if empty($record_prices_by_sku.is_same)} от {/if}{$record_prices_by_sku.min nofilter}</div>
                    {/if}
				</div>
            {else}
				<div class="g-l-i-content-i-wrap sku-content unavailable">
                    {*если у товара нет atp-артикулов, то выводим "нет в наличии"*}
					<div class="g-l-i-status">{$record->sell_status.values.unavailable.title}</div>
				</div>
            {/if}
        {/if}

		<ul class="g-compare-l clearfix">
			<li class="g-compare-l-i" name="compare_details"></li>
			<li class="g-compare-l-i" name="wishlists"></li>
		</ul>

        {if !empty($record->getGoods()->relations->goods_icons) and $record->getGoods()->relations->goods_icons->getActiveCatalogRecords()}
        <div class="goods-icons-full">
            {include file="goods-icons/catalog-tile-icons-full.tpl"}
        </div>
        {else}
        <div class="goods-details-full">
            {if $smarty.capture.details and $smarty.capture.details|strip|count_characters > 0}
            <ul class="g-info-l">
                {$smarty.capture.details nofilter}
            </ul>
            {/if}
        </div>
        {/if}

	</div>


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

<script>
    var data = {
        "actionField": { "list": "{$list}"},
        "products": [{
            "name": "{$record.title}",
            "id": "{$record.id}",
            "price": "{$record->price->getValueByDecimals(0, ".", "")}",
            "brand": "{$record->producer}",
            "category": "{$record->parent}",
            "position": "1"
        }]
    };

    new GTMEvents([
        {
            selector: '[data-goods-id="{$record.id}"]',
            event: 'show',
            gtm_data: {
                'event': "gtm-ee-event",
                'gtm-ee-event-category': 'Enhanced Ecommerce',
                'gtm-ee-event-action': 'Product Impressions',
                'gtm-ee-event-non-interaction': 'True',
                'ecommerce': {
                    'impressions': data
                }
            }
        },
        { //переход на вариант товара
            selector: 'a[data-link-id="goods-link-{$record.id}"]',
            event: 'click',
            gtm_data: {
                'event': "gtm-ee-event",
                'gtm-ee-event-category': 'Enhanced Ecommerce',
                'gtm-ee-event-action': 'Product Clicks',
                'gtm-ee-event-non-interaction': 'False',
                'ecommerce': {
                    'click': data
                }
            }
        }
    ]);

    $(document).getElement('[data-goods-id="{$record.id}"]').fireEvent('show');
</script>