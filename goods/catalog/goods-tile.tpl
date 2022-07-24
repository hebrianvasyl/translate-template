{execute_if_exists object='Controller' method='getActualDataByOffer' args=['record'=>$record] assign='record_data'}

{if (isset($record_data))}
	{$has_atp = !empty($record_data.has_atp)}
{/if}

{include file='goods/purchase_goods_id.tpl' scope=parent}

{capture name="details"}
	{include file="goods/details.tpl"}
{/capture}

{$is_mark_down = !empty($record.defect_description)}

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

    {if count($record -> relations -> videos)}
        <div class="icon-video-container">
            {foreach from=$record -> relations -> videos item=item name=videos}
                {assign var=video value=$item -> record_to}
                {$href = $record.external_href|cat:"#video_container_"|cat:$video.id}
                <a class="video-review" href="{$href}" data-link-id="goods-link-{$record.id}"]>{'Видеообзор'|translate} <i class="icon-video"></i></a>
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
        <img class="additional-tags-img lazyload" data-src="{$tag.image}">
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
        <img class="additional-tags-img lazyload" data-src="{$tag.image}">
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
        <img class="additional-tags-img lazyload" data-src="{$tag.image}">
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

<div id="goods{$purchase_goods_id}" class="g-l-i g-l-i-list {$class}" name="more_parent"
	 goods-data-gtm='{ "name": "{$record.title}", "id": "{$record.id}", "price": "{$record->price->getValueByDecimals(0, '.', '')}", "brand": "{$record->producer}", "category": "{$record->parent}"}'
>
	{*include file="goods/catalog/goods-list-variants.tpl" style="tile"*}

    {$smarty.capture.left_top_tags nofilter}

    {*dump($record.parent_id, $record.group_priority)*}

	<div class="g-l-i-content clearfix visible {if count($record->relations->videos)}g-i-content-long{/if}">
		<div class="g-l-i-content-i float-lt">
            <div style="display: none; position: relative; z-index: 9999; padding: 5px; border: 3px solid #666; background: #efefef;color: #000; font-size: 15px;">
                <div>
                    ID: {$record.id}
                </div>
                <div>
                    {if $record.group_priority == '1'}
{'ПРИОРИТЕТ'|translate}
                    {else}
                    {'НЕ приоритет'|translate}
                    {/if}
                </div>
                <div>
                    {if $menu.active.id == $record.parent}
{'НЕ дубль'|translate}
                    {else}
                    {'ДУБЛЬ'|translate}
                    {/if}
                </div>
                <div>
{'Порядок'|translate}: {$record.order}
                </div>
            </div>

			<div class="g-l-i-img">
				<a class="g-l-i-img-link" href="{$record.external_href}" name="goods-link" data-link-id="goods-link-{$record.id}">
					<div class="g-l-i-img-link-i">
						<div class="pp-image-wrap g-i-tile-img-wrap">
							<img class="g-l-i-img-link-i-img g-i-tile-img lazyload"
                                 alt="{$record.title|escape:'quotes'}"
								 title="{$record.title|escape:'quotes'}"
								 name="tips-{$record.id}"
                                 data-src="{$record->attachments->images.medium.url}"
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

			<div class="goods-icons-wrap">
				{include file="goods-icons/catalog-icons.tpl"}
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
				{*<div class="g-l-i-details-title">*}
				{*<a class="g-l-i-details-title-link" href="{$record.external_href}" name="goods-link">{$record.title}</a>*}
				{*</div>*}
			</div>

			{include file="goods/rating.tpl"}

			{if $record->isATP()}
            <div class="price-block">
                <span>{'Цена'|translate}:</span>
                {if !empty($record.old_price) && ($record.old_price > $record.price)}
                <span class="old-price notranslate">{$record->old_price nofilter}</span>
                {/if}
                <span class="price notranslate" name="UAH">{$record->price nofilter}</span>
            </div>
			{else}
            <div class="g-l-i-status">{$record->sell_status->value.title}</div>
			{/if}

			<div class="g-info-l description">
				{include file="goods/catalog-item-tile-price-block.tpl" show_active_catalog_buttons=true}

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
