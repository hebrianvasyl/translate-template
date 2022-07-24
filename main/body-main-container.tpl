<div class="content clearfix main-container">

	<div name="app-message"></div>

	<div class="content-wrapper">

		{capture name="tabs"}

			{$tabs_count = 0}

			{MainTabs->getSegments assign='tabs'}

			{if count($tabs)}
				{foreach from=$tabs item="tab" name='tabs'}
					<li class="m-tabs-i main-tabs-i" name="{$tab.name}">
						<a href="#" class="btn-grey m-tabs-link black main-tabs-i-link">
							<span class="m-tabs-link-text main-tabs-i-link-text">{$tab.title}</span>
						</a>
					</li>
				{/foreach}

				{$tabs_count = (count($tabs))}
			{/if}

		{/capture}

		{if $tabs_count}
			<div class="tabs-b">
				<div class="tabs main-tabs">
					<nav class="m-tabs main-tabs-container before">
						<div class="m-tabs-wrap main-tabs-wrap">
							<ul class="m-tabs-l main-tabs-l tab-cont-{$tabs_count}" id="goods-tabs-menu">
								{$smarty.capture.tabs nofilter}
							</ul>
						</div>
					</nav>

					<div class="container-padd tabs-content catalog" id="goods-tabs-content"></div>
				</div>
			</div>

			<script type="text/javascript">
				var goodTabs = new Tabs_class(
                    'goods-tabs-menu',
                    'goods-tabs-content',
                    '{$menu.www.href}main_tabs_goods/'
				).setOptions({
                    hash_prefix: 'segments='
                });
                goodTabs.run();

				new GTMEvents([
					{ //переключение вкладок
						event: 'switchTab',
						gtm_data: {
							event: "OWOX",
							eventCategory: 'Main',
							eventAction: 'switchTab',
							eventLabel: { handler: function () {
								var active_tab_switchers = $$("#goods-tabs-menu li.active a span");

								var active_tab_segment = $$("#goods-tabs-menu li.active").get('name')[0];
								if(active_tab_segment == 'promotions') {
                                    active_tab_segment = 'all-promotions';
                                }
                                $('goods-tabs-content-all-link').set('html', '<a href="/'+active_tab_segment+'/">{'Посмотреть все'|translate}</a>');

								return active_tab_switchers.length
										? active_tab_switchers[0].get('html')
										: '';
							}}
						}
					},
					{ //добавление товара из вкладок
						selector: '#goods-tabs-content a[name=topurchases]',
						event: 'click',
						gtm_data: {
							event: "OWOX",
							eventCategory: 'Cart',
							eventAction: 'addFromMain',
							eventLabel: { handler: function () {
								var active_tab_switchers = $$("#goods-tabs-menu li.active a span");
								return active_tab_switchers.length
										? active_tab_switchers[0].get('html')
										: '';
							}}
						},
						depend_on_event: {
							event: 'switchTab'
						}
					},
					{ //переход на товар из вкладок
						selector: '#goods-tabs-content [name=goods-link]',
						event: 'click',
						gtm_data: {
							event: "OWOX",
							eventCategory: 'Main',
							eventAction: 'gotoProductFromTab',
							eventLabel: { handler: function () {
								var active_tab_switchers = $$("#goods-tabs-menu li.active a span");
								return active_tab_switchers.length
										? active_tab_switchers[0].get('html')
										: '';
							}}
						},
						depend_on_event: {
							event: 'switchTab'
						}
					}
				]);

			</script>

		{/if}

	</div>
</div>