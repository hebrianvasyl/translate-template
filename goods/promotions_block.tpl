{if !empty($goods_record) and !empty($relation_name)}
	{Promotions->getLast goods_record=$goods_record relation_name=$relation_name limit=4 only_active_promotions="1" assign="promotions"}
{else}
	{Promotions->getLast limit=4 only_active_promotions="1" assign="promotions"}
{/if}

{if count($promotions)}

{*Получаем на 1 товар больше, чем выводим, чтобы знать, выводить ли ссылку на все акции*}
	{if count($promotions) == 4 or !empty($show_all_promotions_link)}
		{$all_promotions_link = {$menu.www->promotions.href}}
		{$promotions = $promotions|array_slice:0:3}
	{/if}

	<div class="sidebar-i sidebar-i-content actions">
		<h2 class="sidebar-i-content-title clearfix">
			<a class="sidebar-i-content-title-link" href="{$menu.www->promotions.href}">Акции</a>
		</h2>
		<ul class="sidebar-i-content-l">

			{foreach $promotions as $promotion}
                <li class="sidebar-i-content-l-i item clearfix">
                    {if count($promotion->attachments->images_list)}
                    <a class="sidebar-i-content-l-i-text-img" href="{$promotion.external_href}" name="sidebar_promotion_item" title="{$promotion.title|replace:'/*br*/':''|replace:'<br>':'' nofilter}">
                        {if isset($promotion->attachments->images_list.small.url) and !empty($promotion->attachments->images_list.small.url) and ($promotion->attachments->images_list.small.url != 'https://i.intexpool.ua/promotions/0/_.gif')}
                        <span class="small-icon">
                            <img class="lazyload"
                                    alt="{$promotion.title|replace:'/*br*/':''|escape:'quotes'}"
                                    title="{$promotion.title|replace:'/*br*/':''|escape:'quotes'}"
                                    name="promotion-{$promotion.id}"
                                    data-src="{$promotion->attachments->images_list.small.url}"
                                    width="{$promotion->attachments->images_list.small.width}"
                                    height="{$promotion->attachments->images_list.small.height}"
                            />
                        </span>
                        {else}
                        <span class="original-icon">
                            <img class="lazyload"
                                    alt="{$promotion.title|replace:'/*br*/':''|escape:'quotes'}"
                                    title="{$promotion.title|replace:'/*br*/':''|escape:'quotes'}"
                                    name="promotion-{$promotion.id}"
                                    data-src="{$promotion->attachments->images_list.original.url}"
                                    width="{$promotion->attachments->images_list.original.width}"
                                    height="{$promotion->attachments->images_list.original.height}"
                            />
                        </span>
                        {/if}
                    </a>
                    {/if}
                    <a class="sidebar-i-content-l-i-text" href="{$promotion.external_href}" name="sidebar_promotion_item" title="{$promotion.title|replace:'/*br*/':''|replace:'<br>':'' nofilter}">{$promotion.title|replace:'/*br*/':' '|replace:'<br>':' ' nofilter}</a>
				</li>
			{/foreach}

		</ul>
		{if isset($all_promotions_link)}
			<a class="show-more-link" href="{$all_promotions_link}"><span>Все акции</span> &#8594;</a>
		{/if}
	</div>

    <script>
        new GTMEvents([
            { //переход на вариант товара
                selector: '[name="sidebar_promotion_item"]',
                event: 'click',
                gtm_data: {
                    event: "OWOX",
                    eventCategory: 'Catalog',
                    eventAction: 'clickOnPromotion',
                    eventLabel: { handler: function (event_object) {
                        return event_object.target.getProperty('title');
                    }}
                }
            }
        ]);
    </script>

{/if}