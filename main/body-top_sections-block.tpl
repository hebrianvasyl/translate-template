{Goods->getGoodsByTag sections=1 order="order" limit=8 tag="top" only_with_tags=1 assign="categories"}

{if count($categories)}

<section class="m-filter">
	<div class="m-filter-title">Популярные категории</div>
	<nav>
		<ul class="m-filter-l">
			{foreach $categories as $category}

			<li class="m-filter-l-i">
				<a href="{$category.href}" class="m-filter-l-i-link">

					{include file='goods/section_attachment.tpl' scope=parent}

					<div class="m-filter-l-i-img">
						{if count($section_attachment)}

							<img
								alt="{$category.title|escape:'quotes'}"
								title="{$category.title|escape:'quotes'}"
								name="top-{$category.id}" src="{$section_attachment.medium.url}"
								width="{$section_attachment.medium.width}"
								height="{$section_attachment.medium.height}"
							>
						{/if}
					</div>
				<span class="m-filter-l-i-link-text">{$category.title}</span>
				</a>
			</li>
			{/foreach}
		</ul>
	</nav>
</section>
{/if}