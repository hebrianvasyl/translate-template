{include file='goods/purchase_goods_id.tpl' scope=parent}
<div class="goods-l-i clearfix" id="goods{$purchase_goods_id}" style="margin-bottom: 0;">
	<div class="goods-l-i-img float-lt">
		<a href="{$record.external_href}" class="goods-l-i-img-link" data-link-id="goods-link-{$record.id}"]>
            <img class="goods-l-i-img-preview"
				 alt="{$record.title|escape:'quotes'}"
				 title="{$record.title|escape:'quotes'}"
				 name="tips-{$record.id}"
				 src="{$record->attachments->images.medium.url}"
				 width="{$record->attachments->images.small.width}"
				 height="{$record->attachments->images.small.height}"
			/>
		</a>
	</div>
	<div class="goods-l-i-content">
		<div class="goods-l-i-content-title"><a href="{$record.external_href}" data-link-id="goods-link-{$record.id}"]>{$record.title}</a></div>

        <div style="display: flex; align-items: center">
            {if $record.price}
            <div class="price-b small" name="price" style="font-weight: bold; margin: 0 10px 0 0;">{$record->price nofilter}</div>
            {/if}

            {if !empty($record.old_price) && ($record.old_price > $record.price)}
            <div class="old-price-b small"><span class="submit-btn old-price crossed">{$record->old_price nofilter}</span></div>
            {/if}

            {if $record.sell_status=="limited"}
            <span class="status status-ends">{$record->sell_status->value.title}</span>
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
        "list": "ProductSimilar",
        "category": "{$record->parent}"
    };

    EEProcessor.productImpressions([good]);

    $$('a[data-link-id="goods-link-{$record.id}"]').addEvent('click', function(e){
        e.preventDefault();

        EEProcessor.productClick([good], $(this).get('href'));

        return false;
    });
</script>
