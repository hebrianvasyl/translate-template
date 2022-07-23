{foreach $sections_data as $section_data}
	<a class="anchor-link novisited" id="{$section_data.section.name}">{$section_data.section.title}</a>

	<ul class="g-l catalog-l" name="goods_list">

		{foreach $section_data.records as $item}

			{if $item->isRecord()}

				{include file="goods/catalog/goods-tile.tpl" record=$item}

				{*лимитируем вывод товаров до 200*}
				{if $item@iteration >= 200}
					{break}
				{/if}

			{/if}

		{/foreach}

	</ul>
{/foreach}