{*variants*}

{if $record->getGroup() && $record->showGroupVariants()}

	{if !empty($style) and $style == 'list'}
		{$visible_variants = 2}
	{elseif !empty($style) and $style == 'tile'}
		{$visible_variants = 2}
	{/if}

	{$detail_name = $record->getGroup()->getVariableDetailName("var_detail")}
	{$goods_variants = $record->getGroup()->getChildren(true, ['status' => 'active', 'sell_status' => $record->module->getATCStatuses()])}

	{if (count($goods_variants) > 1) or (count($goods_variants) == 1 and $goods_variants.0.id != $record.id)}
		{$variants_count = 0}

		{capture name="variants"}
			{foreach $goods_variants as $goods_variant}
				{if $goods_variant.id != $record.id && $goods_variant->$detail_name != ""}
					{$variants_count = $variants_count + 1}

					{if $variants_count == $visible_variants + 1}
						</ul>
						<ul class="under-cut" name="categories_cut">
					{/if}

					<li class="variants-l-i">
						<a
                            class="variants-link"
                            href="{$goods_variant.external_href}"
                            name="variant-link"
                            gtm-data='{ "eventLabel":"{$goods_variant.id}"}'
                            data-price="{$goods_variant.price}"
                            data-image="{$goods_variant->attachments->images.very_large.url}"
                        >

							{if !empty($style) and $style == 'list'}
								<img class="variants-link-img"
									 width="{$goods_variant->attachments->images.small.width}"
									 height="{$goods_variant->attachments->images.small.height}"
									 src="{$goods_variant->attachments->images.small.url}"
								>
							{elseif !empty($style) and $style == 'tile'}
								<img class="variants-link-img"
									 width="{$goods_variant->attachments->images.very_small.width}"
									 height="{$goods_variant->attachments->images.very_small.height}"
									 src="{$goods_variant->attachments->images.very_small.url}"
								>
							{/if}

							{*<p class="variants-link-price black">{$goods_variant->$detail_name}</p>*}
						</a>
					</li>
				{/if}
			{/foreach}
		{/capture}

		{if trim($smarty.capture.variants)}

			{if !empty($style) and $style == 'list'}
				<div class="hidden" id="variants{$record.id}">
					<section class="variants before after" name="more_parent">
						{*<span class="variants-link-title grey">{$record->$detail_name->detail.title}:</span>*}
						<ul class="variants-l clearfix">
							{$smarty.capture.variants nofilter}
						</ul>
						{if $variants_count>$visible_variants}
							<a class="link-more novisited" onclick="return false" more_hide name="more_categories" href="#">&#9660</a>
						{/if}
					</section>
				</div>
			{elseif !empty($style) and $style == 'tile'}
				<div id="variants{$record.id}" class="hidden">
					<section class="variants float-lt before after" name="more_parent">
						{*<span class="variants-link-title grey">{$record->$detail_name->detail.title}:</span>*}
						<ul class="variants-l clearfix">
							{$smarty.capture.variants nofilter}
						</ul>
						{if $variants_count>$visible_variants}
							<a class="link-more novisited" onclick="return false" more_hide name="more_categories" goods_id="{$record.id}" href="#">&#9660</a>
						{/if}
					</section>
				</div>
			{/if}

		{/if}
	{/if}
{/if}
<script type="text/javascript">
	var MoreBlock = new MoreBlock_class();
	MoreBlock.init('variants{$record.id}');
    MoreBlock.options.more_hide_text = '&#9660';
    MoreBlock.options.more_show_text = '&#9650';
	new GTMEvents([
			{ //ссылка "Еще" в списке вариантов товаров
				object: MoreBlock,
				event: 'moreShow',

				gtm_data: {
					event: "OWOX",
					eventCategory: 'Catalog',
					eventAction: 'moreVariants',
					eventLabel: { handler: function (event_object) {
						return event_object.get('goods_id');
					}}
				}
			}
		]);
</script>
{*end variants*}