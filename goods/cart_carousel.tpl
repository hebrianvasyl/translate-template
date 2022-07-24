<div>
	{if !empty($relations)}
		<section class="goods slider accessories-carousel" id="accessories_carousel">
			<h2>{'Аксессуары'|translate}</h2>
			<a class="btn btn-lt" href="#" name="carousel_control_left"><img class="btn-img"  src="{$settings.path.design}/_.gif"></a>
			<a class="btn btn-rt" href="#" name="carousel_control_right"><img class="btn-img" src="{$settings.path.design}/_.gif"></a>
			<div class="slider-i">
				<ul class="g-l clearfix" name="carousel_container">
					{* выводятся только не конфигурируемые товары *}
					{foreach from=$relations item='record'}
						{if $record -> sku}
							{$record = $record -> sku-> getFirst()}
						{/if}
						<li class="float-lt" name="carousel_element">
							<div class="g-l-i" id="goods{$record.id}" gtm-data='{ "eventLabel":"{$record['id']}"}'>
								<input type="hidden" id="goods{$record.id}">
								<div class="g-l-i-img">
									<a class="g-l-i-img-link" href="{$record.external_href}" name="goods-link">
										<img
											 alt="{$record.title|escape:'quotes'}"
											 title="{$record.title|escape:'quotes'}"
											 name="tips-{$record.id}" src="{$record->attachments->images.small.url}"
											 width="{$record->attachments->images.small.width}"
											 height="{$record->attachments->images.small.height}"
										/>
									</a>
								</div>
								<label class="add-to-order" name="buy_in_cart">
									<input class="sort-box-cb" type="checkbox" checked="">
									Добавить к заказу
								</label>
								<div class="g-l-i-details">
									<a href="{$record.external_href}">
										<div class="g-details-title">
                                            {if $record.sub_title_big}
                                                {$record.sub_title_big}
                                            {/if}
										</div>
										{*<div class="g-details-sub-title-small">*}
                                            {*{if $record.sub_title_small}*}
                                                {*{$record.sub_title_small}*}
                                            {*{else}*}
                                                {*{$record.title}*}
                                            {*{/if}*}
										{*</div>*}
									</a>
									{*<div class="g-l-i-details-title" >*}
										{*<a class="g-l-i-details-title-link novisited" name="goods-link" href="{$record.external_href}">{$record.title}</a>*}
									{*</div>*}
								</div>

								<div class="b-rating clearfix">
									<div class="rating">
										<div class="rating-i" style="width:{$record.users_rating*20}%"></div>
									</div>
									<a href="{$record.href}#tab=comments" class="valigned-top">
										{$record->users_rating.count_comments|intval} отзыв{$record->users_rating.count_comments|@morphology}
									</a>
								</div>

								{if $record.sell_status=="limited"}
									<div class="status status-ends red">{$record->sell_status->value.title}</div>
								{/if}

								<div class="price-block">
									<span>{'Цена'|translate}:</span>
                                    {*{if !empty($record['old_price']) and $record['old_price'] > $record['price']}*}
										{*<span class="old-price">{$record->old_price nofilter}</span>*}
                                    {*{/if}*}
									<span class="price">{$record->price nofilter}</span>
								</div>
							</div>
							<script type="text/javascript">GoodsCatalog.addEntity('Goods', { 'goods_id': {$record.id}, 'added_to_cart_price': {$record->getPrice()} })</script>
						</li>
					{/foreach}
				</ul>
			</div>
		</section>

		<script type="text/javascript">
			var Carousel = new Carousel_class('accessories_carousel');
			{literal}
			Carousel.setOptions({
				control_size: 0,
				controls_css: {
					prev: 'carousel_control_left_disabled',
					next: 'carousel_control_right_disabled'
				}
			});
			{/literal}
			Carousel.run();
		</script>

	{/if}
</div>