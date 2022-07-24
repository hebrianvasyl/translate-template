{CatalogPromo->getBanners section=$section assign="catalog_promos"}

<div id="goods-parent">

	{foreach from=$menu.active->view item=node name=view}

		{if $node->isSelected()}

			{if $node.name eq 'tile'}
				<div class="goods g-tile g-tile-with-separate" >
			{else}
				<div class="goods g-list">
			{/if}

			<div class="g-l catalog-l" name="goods_list">

				{Promotions->hasPromotionsForOffers offers=$catalog_records relation_name="goods" only_active_promotions="1" assign="promotion_records"}

                {if $catalog_promos}
                    {$places = $catalog_promos.places|@array_keys}
                    {$position = 1}
                {/if}
				{foreach from=$catalog_records item=record}
                    {if $catalog_promos && !empty($catalog_promos.places)}
                        {if $position|in_array:$places}
                            {$banners_ids = $catalog_promos.places.$position}

                            <div class="catalog-banner" name="catalog-banner-block">
                            {foreach from=$banners_ids item=banner_id}
                                {if $banner_id and !empty($catalog_promos.banners[$banner_id])}
                                    <a  href="{$catalog_promos.banners[$banner_id].url}"
                                        class="hidden"
                                        enhanced-gtm-data='{
                                            "eventLabel": "{'Категория. В каталоге'|translate} - {$catalog_promos.banners[$banner_id].alt|replace:'/*br*/':' '|replace:'<br>':' '|escape:'quotes' nofilter}",
                                            "ecommerce": {
                                                "promoClick": {
                                                    "promotions": [
                                                        {
                                                            "id": {$catalog_promos.banners[$banner_id].id},
                                                            "name": "{$catalog_promos.banners[$banner_id].alt|replace:'/*br*/':' '|replace:'<br>':' '|escape:'quotes' nofilter}"
                                                        }
                                                    ]
                                                }
                                            }
                                        }'
                                    >
                                        <img data-src="{$catalog_promos.banners[$banner_id].src}" alt="{$catalog_promos.banners[$banner_id].alt}" width="{$catalog_promos.banners[$banner_id].width}" height="{$catalog_promos.banners[$banner_id].height}" class="lazyload">
                                    </a>
                                {/if}
                            {/foreach}
                            </div>
                        {/if}
                        {$position = $position+1}
                    {/if}

					{include file="goods/catalog/goods-`$node.name`.tpl" promotion_records=$promotion_records}

				{/foreach}
			</div>
		</div>

		{/if}

	{/foreach}

	{include file="body-page-navigation.tpl" pos="catalog"}

</div>

</div>

<script>
	new GTMEvents([
        { //добавление товара из вкладок
            selector: '#goods-parent a[name=topurchases]',
            event: 'click',
            gtm_data: {
                event: "OWOX",
                eventCategory: 'Cart',
                eventAction: 'addFromCatalog',
                eventLabel: '{$menu.active.record['id']}'
            },
            depend_on_event: {
                object: GoodsCatalog,
                event: 'catalogUpdate'
            }
        },
        { //переход на вариант товара
            selector: '#goods-parent a[name=variant-link]',
            event: 'click',
            gtm_data: {
                event: "OWOX",
                eventCategory: 'Catalog',
                eventAction: 'gotoVariant'
            }
        },
        { //переход на следующую страницу
            selector: 'a[name=page-link]',
            event: 'click',
            gtm_data: {
                event: "OWOX",
                eventCategory: 'Catalog',
                eventAction: 'nextPage',
                eventLabel: '{$menu.active.record['id']}'
            }
        },
        { //клик по баннерам
            selector: '[name=catalog-banner-block] a',
            event: 'click',
            gtm_data: {
                event: "EnhancedOWOX",
                eventCategory: 'Banner',
                eventAction: 'promotionClick'
            }
        }
    ]);

	var changeCatalogBanner = function(){
        var active, next;

        $$('.catalog-banner').each(function(el) {
            active = el.getFirst('a.active');

            if (!active) {
                next = el.getFirst('a');
            } else {
                next = active.getNext();

                if(!next) {
                    next = el.getFirst('a');
                }
            }

            el.getElements('a').removeClass('active').addClass('hidden');

            next.removeClass('hidden').addClass('active');
        });
    };
    changeCatalogBanner();

    var time = setInterval(changeCatalogBanner, 10000);

    $$('[name=catalog-banner-block]').addEvents({
        mouseenter: function() {
            clearInterval(time);
        },
        mouseleave: function() {
            time = setInterval(changeCatalogBanner, 10000);
        }
    });

</script>