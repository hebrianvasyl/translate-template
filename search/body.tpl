<section class="b-search-results catalog" id="goods-parent">
	<div class="b-search-results-header">
		<div class="b-search-results-hint">{'По запросу'|translate}:</div>
		<h1 class="b-search-results-title">
			<span class="b-search-results-request">{$searchResults.text nofilter}</span>
		</h1>
		{if isset($searchResults.sections_menu) and $searchResults.sections_menu|@count}
		<div class="b-search-results-hint">{'Найден'|translate}{$searchResults.total_count|@morphology:'':"{'ы'|translate}":"{'ы'|translate}"} {$searchResults.total_count} товар{$searchResults.total_count|@morphology:'':"{'а'|translate}":"{'ов'|translate}"}, в {$searchResults.sections_menu|count} категори{$searchResults.sections_menu|count|@morphology:"{'и'|translate}":"{'ях'|translate}":"{'ях'|translate}"}:</div>
		{capture name="sections_menu"}
			<ul class="search-results-sort-l clearfix">
				{foreach from=$searchResults.sections_menu item=node name=sections_menu}
					{if $node.is_active or count($node)==1}
						<li class="search-results-sort-l-i float-lt before">
							<a class="search-results-sort-l-i-link active">{$node.title}</a>
						</li>
						{assign var="section_selected" value="1"}
					{else}
						<li class="search-results-sort-l-i float-lt before">
							<a href="{$node.href}" class="search-results-sort-l-i-link">{$node.title}</a> ({$node.count})
						</li>
					{/if}
				{/foreach}
			</ul>
		{/capture}

		{if isset($smarty.capture.sections_menu)}{$smarty.capture.sections_menu nofilter}{/if}

	</div>
	{/if}

	{if $searchResults}
		{if $searchResults.count}
			<div class="b-search-results-content g-tile">
			<ul class="g-l catalog-l clearfix" name="goods_list">
                {assign var=section value='search'}

                {foreach from=$searchResults.records item=record name=results}

						{include file="goods/catalog/goods-tile.tpl"}

				{/foreach}
			</ul>
				{include file="body-page-navigation.tpl" pos="search"}

			</div>
			<script>

				new GTMEvents([
					{ //добавление товара из страницы результатов поиска
						selector: '[name=goods_list] a[name=topurchases]',
						event: 'click',
						gtm_data: {
							event: "OWOX",
							eventCategory: 'Cart',
							eventAction: 'addFromSearch',
							eventLabel: '{$searchResults.text nofilter}'
						}
					}
				]);

			</script>
		{else}
			<div class="b-search-results-hint">{'ничего не найдено'|translate}</div>
		{/if}

        {if 'min_price'|array_key_exists:$searchResults and $searchResults.min_price}
        <div id="adwords_min_price" class="hidden">{$searchResults.min_price}</div>
        {/if}

	{/if}
</section>