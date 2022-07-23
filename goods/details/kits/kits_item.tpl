<div class="kit-variants-l-i kit-variants-l-item">
	<div class="g-l-i-img">
		<a class="g-l-i-img-link" href="{$goods_item.external_href}" target="_blank">

			{$price = $goods_item->price->getValue()}
			{$old_price = $goods_item->old_price->getValue()}
			{$price_with_discount = $unit.record->getCostByGoods($goods_item)->getValue()}

            {$discount = 0}
            {if !empty($goods_item.old_price) && ($goods_item.old_price > $goods_item.price)}
                {$discount = (($old_price - $price_with_discount) / $old_price * 100)}
            {elseif $unit.record->getCostByGoods($goods_item)->getValue() < $goods_item->price->getValue()}
                {$discount = (($price - $price_with_discount) / $price * 100)}
            {elseif $unit.record.relative_discount > 0}
                {$discount = $unit.record.relative_discount}
            {/if}

            {if $discount > 99}
                {$discount = 99}
            {/if}

            {if $kit.kit.is_show_full_discount and ($price > $price_with_discount or $old_price > $price) and $discount > 0}
                <div class="tag">
                    АКЦИЯ -{round($discount)}%
                </div>
            {/if}

			<img
				alt="{$goods_item.title|escape:'quotes'}"
				title="{$goods_item.title|escape:'quotes'}"
				src="{$goods_item->attachments->images.medium.url}"
				width="{$goods_item->attachments->images.medium.width}"
				height="{$goods_item->attachments->images.medium.height}"
			>
		</a>
	</div>

    {if $goods_item.sub_title_big or $goods_item.sub_title_small}
        <div class="g-l-i-details-title-big"><a href="{$goods_item.external_href}" title="{$goods_item.sub_title_big}">{$goods_item.sub_title_big}</a></div>
        <div class="g-l-i-details-title-small"><a href="{$goods_item.external_href}" title="{$goods_item.sub_title_small}">{$goods_item.sub_title_small}</a></div>
    {else}
        <div class="g-l-i-details-title"><a class="g-l-i-details-title-link" href="{$goods_item.external_href}">{$goods_item.title}</a></div>
    {/if}

    {*{include file="goods/rating.tpl" record=$goods_item}*}

    <div class="price-block">
        {if !empty($goods_item.old_price) && ($goods_item.old_price > $goods_item.price)}
        <span class="old-price">{$goods_item->old_price nofilter}</span>
        {elseif $unit.record->getCostByGoods($goods_item)->getValue() < $goods_item->price->getValue()}
        <span class="old-price">{$goods_item->price nofilter}</span>
        {/if}
        <span class="price">{$unit.record->getCostByGoods($goods_item) nofilter}</span>
    </div>

    {if $count > 1 && $count >= $index}
    <div class="g-kit-i-count hidden">{$index} из {$count}</div>
    {/if}

</div>