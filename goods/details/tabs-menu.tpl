{$active_tab_name = NULL}
{if count($record_node)}
	<div>
		<div style="position: relative;">
			<nav class="goods-details__nav">
				<ul id="details-tabs-menu" class="goods-details__tabs" name="details-tabs-menu">

					{foreach from=$record_node item="tab" name="tabs_menu"}

						{if !empty($is_mark_down) and $tab.name == 'similar'
							or !empty($is_mark_down) and empty($record->users_rating.count_comments) and $tab.name == 'comments'}
							{* вкладку похожих товаров для уцененных товаров не выводим *}
							{* пустую вкладку с отзывами для уцененных товаров не выводим *}
							{continue}
						{/if}

                        {$count = 0}
                        {if $tab.name == 'comments'}
                        {$count = $record->getTotalComments()}
                        {elseif $tab.name == 'similar'}
                        {$count = $record->getTotalSimilar()}
                        {elseif $tab.name == 'photo_video'}
                        {$count = count($record->getVideos('product'))}
                        {/if}


                    <li class="{if $tab->isActive()}active{/if} {$tab.name}-tab" name="{$tab.name}">
							<a itemprop="url" href="{$tab.href}">{strip}
								<span>
                                    {$tab.title}
                                    {if $count > 0}
                                    <strong class="counter">{$count}</strong>
                                    {/if}
                                </span>
							{/strip}</a>
						</li>
						{if $tab->isActive()}
							{$active_tab_name = $tab.name}
						{/if}
					{/foreach}

				</ul>
			</nav>
            <div id="product-preload">
                {if $current_tab == 'preload'}
                {include file="details/preload.tpl"}
                {/if}
            </div>
			<div id="details-tabs-content"></div>
		</div>
	</div>

	<script type="text/javascript">
		var goodTabs = new Tabs_class(
				'details-tabs-menu',
				'details-tabs-content',
				'{$record.external_href}{$debug_url}'
		).run();

		new GTMEvents([
				{ //переключение вкладок
					event: 'switchTab',
					gtm_data: {
						event: "OWOX",
						eventCategory: 'Product',
						eventAction: 'switchTab',
						eventLabel: { handler: function () {
							var active_tab_switchers = $$("#details-tabs-menu li.active a");
							return active_tab_switchers.length
									? active_tab_switchers[0].get('html')
									: '';
						}}
					}
				}
			]);

		{*делаем единоразовый скролл к активной вкладке после загрузки ее содержимого
			(кроме дефолтной первой вкладки "Всё")*}
		if (
			goodTabs.getHashParam('tab')
			|| '{$active_tab_name and $active_tab_name != 'all'}'
		) {
			window.addEvent(
				'switchTab:once',
				function () {
					new Fx.Scroll(window,{ duration:300 }).toElement($('details-tabs-menu'));
				}
			);
		}

	</script>
{/if}