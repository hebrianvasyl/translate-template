{*узнаем наличие серий товаров. если они есть, то именованные фильтры показывать не будем*}
{if $menu.active.group == 'producers'}
	{$series_nodes = $menu.active->series}
{else}
	{$series_nodes = []}
{/if}

{$show_last_breadcrumb = isset($filter_reset)}

{if !count($series_nodes)}

	{capture name=named_filters}

		{foreach from=$menu.active->presets item="preset_node"}
			{if $preset_node.name != 'reset' and $preset_node.records_count neq 0}
				<li class="m-filter-l-i">
					{if $preset_node->isSelected()}
						{assign var='show_last_breadcrumb' value=1}

						<div class="m-filter-l-i-active">
							<div class="m-filter-l-i-img">
								{if count($preset_node.attachments->icon)}
									{$preset_node.attachments->icon.small nofilter}
								{else}
									{image file="goods/0/no_photo_small.jpg"}
								{/if}
							</div>
							<div class="m-filter-l-i-link-title">{$preset_node.title}</div>
						</div>
					{else}
						<a class="m-filter-l-i-link novisited" href="{$preset_node.href}">
							<div class="m-filter-l-i-img">
								{if count($preset_node.attachments->icon)}
									{$preset_node.attachments->icon.small nofilter}
								{else}
									{image file="goods/0/no_photo_small.jpg"}
								{/if}
							</div>
							<div class="m-filter-l-i-link-title">{$preset_node.title}</div>
						</a>
					{/if}
				</li>
			{/if}
		{/foreach}

	{/capture}

{/if}

<div class="body-layout catalog-body-layout clearfix">

	{include file="breadcrumbs.tpl" show_last_breadcrumb=1}

	<div class="site-content catalog">
		<aside class="sidebar-sort sidebar float-lt">
      		<div class="menu__overlay" onclick="FilterClose()"></div>

      		<div class="sidebar-sort-intro">
        		<div class="close-menu">
          			<div class="close-menu-block" onclick="FilterClose()">
            			<svg width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg">
            				<path d="M1 15L15 1M1 1l14 14L1 1z" stroke="#191A1C" />
						</svg>
          			</div>
        		</div>
				<div class="category-title">
          			<h1>{$page_title}</h1>
        		</div>

		  		{include file="goods/catalog/body-filter.tpl"}
      		</div>

			{Goods->getGoodsByTag tag="bestsellers" limit="5" order="order" parent=$section only_with_tags="1" assign="items"}
			{if count($items)}
				<div class="category-popular-block">
					<div class="title">ТОП - {count($items)}</div>
					<ul>
					{foreach $items as $item}
						<li>
							<a href="{$item.external_href}" data-link-id="top-goods-link-{$item.id}">
								<div class="image">
									<img alt="{$item.title|escape:'quotes'}"
										 title="{$item.title|escape:'quotes'}"
										 name="tips-{$item.id}"
                                         data-src="{$item->attachments->images.medium.url}"
                                         class="lazyload"
									/>
								</div>
								<div class="buffer"></div>
								<div class="short_title">{$item.sub_title_big}</div>
								<div class="price">{$item->price nofilter}</div>
								<div class="counter popular-i-counter-{$item@iteration}">{$item@iteration}</div>
							</a>

                            <script>
//                                var product_top_{$item.id} = {
//                                    "name":"{$item.title}",
//                                    "id":"{$item.id}",
//                                    "price":"{$item.price}",
//                                    "brand":"{$item->producer.title}",
//                                    "category":"{$item->parent.title}",
//                                    "list":"category/top"
//                                };
//                                EEProcessor.productImpressions([product_top_{$item.id}]);
//
//                                $$('[data-link-id="top-goods-link-{$item.id}"]').addEvent('click', function(e) {
//                                    e.preventDefault();
//
//                                    var url = $(this).get('href');
//                                    EEProcessor.productClick([product_top_{$item.id}], url);
//                                } );
                            </script>
						</li>
					{/foreach}
					</ul>
				</div>
			{/if}
            {*
			<div class="social-widgets">
				<div class="container">
					<div class="item" id="youtube_widget">
						<div class="title"><span>Наш канал</span><img src="{$settings.path.design}/youtube_widget.png"></div>
						<div class="g-ytsubscribe" data-channelid="UC0rzaRCiZVosKaFLkgckTtg" data-layout="full" data-count="default"></div>
					</div>
					<div class="item" id="fb_widget"></div>
				</div>
			</div>
            *}
		</aside>

		<div class="menu-g clearfix">

			<div>
				<div class="site-content catalog">

        <div class="category-title">
          <p>{$page_title}</p>
        </div>

				<div class="content-wrapper">

				<div name="app-message"></div>

				{if count($catalog_records)}

					{include file="goods/catalog/menu-series.tpl"}

					{include file="goods/catalog/body-sort.tpl"}

                    {Goods->topInformationBlock record=$menu.active assign=top_block}
                    {if $top_block}
                    <div class="catalog-attention"><div>{$top_block nofilter}</div></div>
                    {/if}

					<aside class="sidebar float-rt">
                        {include file="goods/help_banner.tpl"}

						{include file="goods/articles_block.tpl"}

						{include file="goods/catalog/banners-block.tpl"}

						{*include file="goods/promotions_block.tpl" goods_record=$section relation_name="goods"*}

						{include file="goods/videocontent_block.tpl"}
					</aside>

                    {if $section.show_named_filters == '1'}
                        <section class="m-filter">
                            {if !count($series_nodes)}
                                <ul class="m-filter-l">
                                    {$smarty.capture.named_filters nofilter}
                                </ul>
                            {/if}
                        </section>
                    {/if}

					{include file="goods/catalog/body-records.tpl"}

				{else}

					<p>Товаров с указанными характеристиками не найдено, повторите запрос с другими параметрами</p>

				{/if}

				</div>
				</div>
			</div>
		</div>

	</div>
</div>

{*</div> <!-- Закрываем главный класс: "content body-layout wrap clearfix" -->*}

{include file="goods/category_banners_block.tpl" section=$section}

<!-- Открываем главный класс: "content body-layout wrap clearfix" -->
{*<div class="content body-layout wrap section-page clearfix">*}

<div class="content body-layout overflow-hidden wrap clearfix overflowed">
	<div class="site-content catalog">
		{include file="my/recent_goods/recent_goods_block.tpl"}

		<div id="short_text" class="text-description-content">
			{if !empty($menu.active.page.footer_title)}
				<div class="about-site-title">{$menu.active.page.footer_title nofilter}</div>
			{/if}

			{if !empty($menu.active.page.footer_text)}
				<div class="about-site-text">{$menu.active.page.footer_text nofilter}</div>

                {*include file="social-buttons.tpl"*}
			{/if}
		</div>

        {if empty($menu.active.page.footer_text)}
            {include file="block-help.tpl"}
            <div class="h-50"></div>
        {/if}
	</div>
</div>

<script src="https://apis.google.com/js/platform.js"></script>
<script>
	if($$('.body-layout .site-content.catalog .sidebar .sort-box .sort-box-l .sort-box-l-i input[type="checkbox"]:checked').length > 0) {
		$('filter-selected').set('html', '<span>Вы выбрали: </span>');
		$$('.body-layout .site-content.catalog .sidebar .sort-box .sort-box-l .sort-box-l-i input[type="checkbox"]:checked').each(function (el) {
			var label = el.getParent('label');
			var id = label.get('id');
			var value = label.getFirst('.sort-box-text-wrap .sort-box-link .sort-box-link-text .sort-box-text');

			var myAnchor = new Element('a', {
				href: '#' + id,
				html: value.get('text'),
				events: {
					click: function(){
						var href = this.get('href');
						var id = href.substring(1);

						$(id).click();

						return false;
					}
				}
			});
			$('filter-selected').grab(myAnchor);
		});
		var resetFilter = new Element('a', {
			href: '#reset-filter',
			'class': 'reset-filter',
			html: 'Сбросить фильтры',
			events: {
				click: function(){
					$('reset-silter').click();

					return false;
				}
			}
		});
		$('filter-selected').grab(resetFilter);
	}

	App.addOnDomReady(function(){
		if($('fb_widget')) {
			var fb = '<iframe scrolling="no" frameborder="0" allowtransparency="true" width="100%" height="170" style="overflow:hidden;" src="https://www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2FIntexPool.ua&width=214&connections=6&stream=false&small_header=true&hide_cover=true"></iframe>';

			$('fb_widget').set('html', fb);

			window.addEvent('resize', function() {
				$('fb_widget').set('html', fb);
			});
		}
	});

	$$('.catalog-body-layout').getParent('.body-layout').addClass('catalog-body-layout-wrap');

</script>