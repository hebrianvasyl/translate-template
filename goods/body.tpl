	{include file="breadcrumbs.tpl" show_last_breadcrumb=1}

	<div class="content-catalog clearfix">
		<div id="categories_menu" class="content-wrapper">
			<h1 class="catalog-title">
                {if isset($menu.active.page) and isset($menu.active.page.page_h1)}
					{$menu.active.page.page_h1}
				{else}
                    {$menu.active.h1|@default:$menu.active.title|@mnemonics_convert}
				{/if}
			</h1>
			{strip}
			<div class="catalog-node-menu-table">
				<ul class="catalog-node-menu-l">

					{if !empty($settings.package_features.named_filters)}
						{*получаем все нужные именованные фильтры за раз*}
						{$goods_section_ids = []}
						{foreach from=$menu.active->goods item="node"}
							{$goods_section = $node->getRecord()->getGoodsSection()}
							{$goods_section_id = $goods_section.id}
							{$goods_section_ids.$goods_section_id = $goods_section_id}
						{/foreach}
						{GoodsNamedFilters->getPresetsBySections sections=$goods_section_ids assign="named_filters_for_goods_sections"}
					{/if}

					{foreach $menu.active->goods as $node}
						<li class="catalog-node-menu-l-i">
							<h4>
								<a class="catalog-node-menu-l-i-link catalog-node-menu-l-i-link-text" href="{$node.href}">
									{include file='goods/section_attachment.tpl' scope=parent}

									{if $section_attachment and !$section_attachment.large->isDefault()}
										{if $section_attachment.large.width > 0 && $section_attachment.large.height > 0}
											<div class="catalog-node-menu-l-i-link-img">
                                                <img data-src="{$section_attachment.large.url}"
                                                    class="lazyload"
                                                    width="{$section_attachment.large.width}"
                                                    height="{$section_attachment.large.height}"
                                                    alt="{$node.title}"
                                                    title="{$node.title}"
                                                >
											</div>
										{/if}
									{/if}
									<div class="catalog-node-menu-l-i-link-title">{$node.title}</div>
								</a>
							</h4>
							<div name="more_parent">
								<ul class="subnodes-l">

									{$section_node = $node}
									{include file='goods/get_subnodes_source_by_section_node.tpl' scope=parent}

									{$subnodes_count = 0}
									{foreach $subnodes_source as $subnode}

									<li class="subnodes-l-i"><a class="subnodes-l-i-link grey" href={$subnode.href}>{$subnode.title}</a></li>
									{$subnodes_count = $subnodes_count+1}

									{if (($subnodes_count == 5) && (count($subnodes_source) > 5))}
								</ul>
								<ul name="categories_cut" class="subnodes-l under-cut">
									{/if}

									{/foreach}
								</ul>
								{if (count($subnodes_source) > 5)}
									<a class="link-more novisited" onclick="return false" name="more_categories" href="#" more_hide catalog_id='{$node.id}'>
										<span class="underline">{'Еще'|translate}</span> ▼
									</a>
								{/if}
							</div>
						</li>
					{/foreach}
				</ul>
			</div>
			{/strip}
		</div>

		<script type="text/javascript">
			var MoreBlock = new MoreBlock_class();
			MoreBlock.init('categories_menu');
		</script>

        {include file="goods/big-promo.tpl" record=$section}
	</div>
</div> <!-- Закрываем главный класс: "content body-layout wrap clearfix" -->

<div class="sub_menu_hide">
{include file="goods/section_banners_block.tpl" section=$section}

<!-- Открываем главный класс: "content body-layout wrap clearfix" -->
<div class="content body-layout wrap section-page clearfix">
	<div class="content-catalog clearfix">
        {Goods->getGoodsByTag tag="bestsellers" limit="20" order="order" parent=$menu.active.record only_with_tags="1" assign="popularity"}
        {Goods->getGoodsByTag tag="novelties" limit="20" order="created-" parent=$menu.active.record only_with_tags="1" assign="novelty"}
        {Goods->getGoodsByTag tag="promotions" limit="20" order="created-" parent=$menu.active.record only_with_tags="1" assign="recommended"}

        {if count($popularity) or count($novelty) or count($recommended)}
			<div class="tabs section-tabs">
				<div class="nav">
                    {if count($popularity)}
						<a href="#popularity">{'Популярные товары'|translate}</a>
                    {/if}
                    {if count($novelty)}
						<a href="#novelty">{'Новинки'|translate}</a>
                    {/if}
                    {if count($recommended)}
						<a href="#recommended">{'Акции'|translate}</a>
                    {/if}
				</div>

				<div class="content">
                    {if count($popularity)}
						<div id="popularity" class="hidden">
							<section class="g slider padding-in" name="popularity_carousel" gtm-data=' { "eventLabel": "{'Популярные товары'|translate}" }'>
                                {include file="goods-container.tpl" id="block_popularity" items=$popularity tab="popularity"}
							</section>
						</div>
                    {/if}
                    {if count($novelty)}
						<div id="novelty" class="hidden">
							<section class="g slider padding-in" name="novelty_carousel" gtm-data=' { "eventLabel": "{'Новинки'|translate}" }'>
                                {include file="goods-container.tpl" id="block_novelty" items=$novelty tab="novelty"}
							</section>
						</div>
                    {/if}
                    {if count($recommended)}
						<div id="recommended" class="hidden">
							<section class="g slider padding-in" name="recommended_carousel" gtm-data=' { "eventLabel": "{'Акции'|translate}" }'>
                                {include file="goods-container.tpl" id="block_recommended" items=$recommended tab="promotions"}
							</section>
						</div>
                    {/if}
				</div>
			</div>

			<script type="text/javascript">
                $$(".tabs .nav a:first-child").addClass('active');
                $$(".tabs .content div:first-child").removeClass('hidden');
                var id = $$(".tabs .nav a:first-child").get('href')[0].substring(1);

                var Carousel = new Carousel_class('block_' + id + '_carousel');
                {literal}
                Carousel.setOptions({
                    control_size: 0,
                    scroll_count: 5,
                    controls_css: {
                        prev: 'carousel_control_left_disabled',
                        next: 'carousel_control_right_disabled'
                    }
                });
                {/literal}
                Carousel.run();

                $$(".tabs .nav a").addEvent('click',function(e) {
                    if (e) e.stop();

                    $$(".tabs .nav a").removeClass('active');
                    this.addClass('active');

                    $$(".tabs .content > div").addClass('hidden');
                    var id = this.get('href').substring(1);
                    $(id).removeClass('hidden');

                    var Carousel = new Carousel_class('block_' + id + '_carousel');
                    {literal}
                    Carousel.setOptions({
                        control_size: 0,
                        scroll_count: 5,
                        controls_css: {
                            prev: 'carousel_control_left_disabled',
                            next: 'carousel_control_right_disabled'
                        }
                    });
                    {/literal}
                    Carousel.run();
                });
			</script>
        {/if}

        {include file="my/recent_goods/recent_goods_block.tpl"}

		<div class="content-wrapper clearfix">

			<div class="intexpool-help">
				<h4>{'Помощь от IntexPool'|translate}</h4>
				<div class="bg">
					<div class="content">
						<div class="content-title">{'ПОЛЕЗНАЯ и НЕОБХОДИМАЯ информация'|translate}</div>
						<p>{'О продукции Intex и Bestway'|translate}</p>
					</div>
					<table>
						<tr>
							<td><a href="{$menu.www->qa.href}">{'Вопросы и ответы'|translate}</a></td>
							<td><a href="{$menu.www->articles.href}">{'Советы - Статьи'|translate}</a></td>
							<td><a href="{$menu.www->videocontent.href}">{'ВИДЕОинструкции'|translate}</a></td>
						</tr>
					</table>
				</div>
			</div>

			<div class="mainpage-social-widgets clearfix">

                {include file="goods/social-widgets.tpl"}

                {include file="main/body-banner-block-2.tpl"}

			</div>

		</div>

		<div id="short_text" class="text-description-content">
			{if !empty($menu.active.page.footer_title)}
				<div class="about-site-title">{$menu.active.page.footer_title nofilter}</div>
			{/if}

			{if !empty($menu.active.page.footer_text)}
				<div class="about-site-text">{$menu.active.page.footer_text nofilter}</div>
			{/if}

			{*include file="social-buttons.tpl"*}
		</div>

	</div>



	<script>
		$('short_text_show_link').addEvent('click', function(event) {
			event.preventDefault();
			$$('.text-description-content').removeClass('box-hide');
			$('short_text_show_link').destroy();
		});

		new GTMEvents([
				{ //добавление товара из каруселек
					selector: '[name=novelty_carousel] a[name=topurchases], ' +
							'[name=popularity_carousel] a[name=topurchases]',
					event: 'click',
					gtm_data: {
						event: "OWOX",
						eventCategory: 'Cart',
						eventAction: 'addFromPortal',
						eventLabel: '{$menu.active.record['id']}'
					},
					depend_on_event: {
						object: Cart,
						event: 'update'
					}
				},
				{ //переход на товар из каруселек
					selector: '[name=novelty_carousel] a[name=goods-link], ' +
							'[name=popularity_carousel] a[name=goods-link]',
					event: 'click',
					gtm_data: {
						event: "OWOX",
						eventCategory: 'Catalog',
						eventAction: 'gotoProductFromCarousel'
					}
				},
				{ //ссылка "Еще" в списке подкатегорий
					object: MoreBlock,
					event: 'moreShow',
					gtm_data: {
						event: "OWOX",
						eventCategory: 'Catalog',
						eventAction: 'moreCategories',
						eventLabel: { handler: function (event_object) {
							return event_object.get('catalog_id');
						}}
					}
				}
			]);

	</script>
</div>