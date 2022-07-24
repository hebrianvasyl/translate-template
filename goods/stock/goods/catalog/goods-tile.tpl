{Goods->getRelatedNewGoods record=$record.new_record assign='new_record'}

{capture name="details"}
{if $new_record}
{include file="goods/details.tpl" record=$new_record}
{/if}
{/capture}

{include file='goods/purchase_goods_id.tpl' scope=parent}

{capture name="details"}
{include file="goods/details.tpl"}
{/capture}

{capture name="left_top_tags"}
{$left_top_tags = $record->getCatalogTags('left_top_side')}
{if count($record->relations->videos) > 0 or count($left_top_tags) > 0}
<div class="additional-tags left-top">
    {foreach from=$left_top_tags item=tag}
    <div class="tag tag-{$tag.class}">
        <img class="additional-tags-img" src="{$tag.image}">
        <span>{$tag.title}</span>
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

<li class="g-l-i g-l-i-list cut-price" id="goods{$purchase_goods_id}">
    {$smarty.capture.left_top_tags nofilter}

	<div class="g-l-i-content clearfix {if !empty($record.defect_description)} visible {/if}">
		<div class="g-l-i-content-i float-lt">
			<div class="g-l-i-img">
				<a class="g-l-i-img-link" href="{$record.external_href}" data-link-id="goods-link-{$record.id}"]>
					<div class="g-l-i-img-link-i">
						<img class="g-l-i-img-link-i-img" alt="{$record.title|escape:'quotes'}"
							 title="{$record.title|escape:'quotes'}"
							 name="tips-{$record.id}"
							 src="{$record->attachments->images.large.url}"
							 width="{$record->attachments->images.large.width}"
							 height="{$record->attachments->images.large.height}"
						/>
					</div>
				</a>
			</div>

			<div class="g-l-i-details">
                <a href="{$record.external_href}" data-link-id="goods-link-{$record.id}"]>
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
                <span class="price" name="UAH">{$record->price nofilter}</span>
            </div>
            {/if}

			<div class="g-info-l defect-b">
                {include file="goods/catalog/goods-tile-price-block.tpl"}

				{if (!empty($record.defect_description))}
					<span class="defect-title">{'Причина уценки'|translate}:</span>
					<div class="g-info-l">
						{$record.defect_description nofilter}
					</div>
				{/if}

                {if !empty($new_record) and !empty($new_record->getGoods()->relations->goods_icons) and $new_record->getGoods()->relations->goods_icons->getActiveCatalogRecords()}
                <div class="goods-icons-full">
                    {include file="goods-icons/catalog-tile-icons-full.tpl" record=$new_record}
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

		</div>

	</div>
	<script type="text/javascript">GoodsCatalog.addEntity('Goods', { 'goods_id': {$purchase_goods_id}, 'added_to_cart_price': {$record->price->getValue()} })</script>
    <script>
        var good = {
            "name": "{$record.title}",
            "id": "{$record.id}",
            "price": "{$record->price->getValueByDecimals(0, '.', '')}",
            "brand": "{$record->producer}",
            "category": "{$record->parent}",
            "list:": "Stock"
        };

        EEProcessor.productImpressions([good]);

        $$('a[data-link-id="goods-link-{$record.id}"]').addEvent('click', function(e){
            e.preventDefault();

            EEProcessor.productClick([good], $(this).get('href'));

            return false;
        });
    </script>
</li>
