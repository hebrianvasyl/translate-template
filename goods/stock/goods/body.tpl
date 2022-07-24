<div class="body-layout clearfix">
    {$stock_section = $section}

    {include file="breadcrumbs.tpl" show_last_breadcrumb=1}

	<div class="site-content catalog sale">
		{$sections = []}
		{if count($menu.active->goods)}
			{foreach $menu.active->goods as $goods_node}
				{$sections[] = $goods_node -> getRecord()}
			{/foreach}
		{else}
			{$sections[] = $menu.active->getRecord()}
		{/if}

		{$sections_data = []}

		{foreach $sections as $section}
			{$section_records = $section->getIterator(
			$smarty.const.OWOX_RECORD,
			['sell_status' => $section -> module -> getATPStatuses(), 'status' => 'active'])}

			{if count($section_records)}
				{$sections_data[] = ['section' => $section, 'records' => $section_records]}
			{/if}

		{/foreach}

		{if count($sections_data)}
			{capture name=categories_list}
				{foreach $sections_data as $section_data}
					<li class="sale-categories-l-i">
						<a class="sale-categories-l-i-link underline novisited" name="link-to" href="#{$section_data.section.name}">{$section_data.section.title}</a>
					</li>
				{/foreach}
			{/capture}

			<aside class="sidebar-sort sidebar float-lt" name="fixed_block_parent">
                <div class="stock-title">
                    <h1>{$menu.active.title}</h1>
                </div>

				<div class="sale-categories-b" name="fixed_block">
					{if !empty($smarty.capture.categories_list)}
					<b class="sale-categories-title">{'Категории'|translate}</b>
					<ul class="sale-categories-l">
						{$smarty.capture.categories_list nofilter}
					</ul>
					{/if}
				</div>
			</aside>
		{/if}

		<div class="menu-g clearfix">

			<div class="">
				<div class="site-content catalog stock-catalog">
					<div class="content-wrapper">
						<div name="app-message"></div>

                        <aside class="sidebar float-rt">
                            {include file="goods/articles_block.tpl" section=$stock_section}

                            {include file="goods/catalog/banners-block.tpl" section=$stock_section}

                            {*include file="goods/promotions_block.tpl" goods_record=$stock_section relation_name="goods"*}

                            {include file="goods/videocontent_block.tpl" section=$stock_section}
                        </aside>

						<div id="goods-parent">

							{if count($sections_data)}

							<div class="goods g-tile g-tile-with-separate" >

								{include file="goods/catalog/body-records.tpl" sections_data=$sections_data}

							</div>

							{else}

								{'Нет уцененных товаров'|translate}

							{/if}

						</div>

					</div>

				</div>
			</div>

            {if !empty($menu.active.page.footer_title) || !empty($menu.active.page.footer_text)}
			<div class="about-site padding-in border-top">

				{if !empty($menu.active.page.footer_title)}
					<p class="about-site-text">{$menu.active.page.footer_title nofilter}</p>
				{/if}

				{if !empty($menu.active.page.footer_text)}
					<p class="about-site-text">{$menu.active.page.footer_text nofilter}</p>

                    {include file="social-buttons.tpl"}
				{/if}

			</div>
            {/if}
		</div>

	</div>

	{if count($sections_data)}
	<script>
		var FixedBlock = new FixedBlock_class().init();
	</script>
	{/if}
</div>