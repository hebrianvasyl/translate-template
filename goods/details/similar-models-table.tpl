{if count($similar_models)}

	{$characeristics_count = 0}

	{*получаем name, title 6 основных характеристик моделей*}
	{foreach from=$similar_models.0->parent->getGoodsSection()->relations->details item='detail' name='main_characteristics'}
		{assign var='name' value=$detail->to.name}

		{if $detail->to.status !== 'configurable'}
			{$characeristics_count = $characeristics_count + 1}
			{$main_characteristics.$name=$detail->to.title}
		{/if}

		{if $characeristics_count == 6}
			{break}
		{/if}
	{/foreach}

	{if !empty($main_characteristics) && count($main_characteristics)}

		<div class="b-goods-apps {if !empty($active_tab)}similar-pos{else}border-top{/if}">
			<div class="similar-models-t-wrap">
				<table class="similar-models-t" name="similar-models-table">
					<tr class="similar-models-t-head">
						<th class="similar-models-t-sort-cell"></th>
						<th class="similar-models-t-sort-cell similar-models-t-medium-cell" colspan="2">
							{*<span >Цена</span>*}
						</th>

						{foreach from=$main_characteristics item='main_detail'}
							<th class="similar-models-t-sort-cell">
								<span>{$main_detail}</span>
							</th>
						{/foreach}


					</tr>

					{foreach $similar_models as $similar_model}
						<tr class="similar-models-t-l">
							<td class="similar-models-t-l-i similar-models-t-l-i-checkbox"></td>
							<td class="similar-models-t-l-i similar-models-t-l-i-img" rowspan="3">
								<div class="goods-l-i-img medium">
									<a href="{$similar_model.external_href}" class="goods-l-i-img-link" data-link-id="goods-link-{$similar_model.id}">

										{*{if $similar_model->getFirstTag()}*}
											{*<div class="tag tag-{$similar_model->getFirstTag()} small">*}
												{*<img src="{$settings.path.design}/_.gif">*}
											{*</div>*}
										{*{/if}*}

										<img alt="{$similar_model.title|escape:'quotes'}"
											 title="{$similar_model.title|escape:'quotes'}"
											 src="{$similar_model->attachments->images.medium.url}"
											 width="{$similar_model->attachments->images.medium.width}"
											 height="{$similar_model->attachments->images.medium.height}"
										/>
									</a>
								</div>
							</td>
							<td class="similar-models-t-l-i similar-models-t-l-i-title">
								<div class="g-l-i-details">
									<a href="{$similar_model.external_href}" data-link-id="goods-link-{$similar_model.id}">
										<div class="g-details-title">
											{$similar_model.sub_title_big}
										</div>
										<div class="g-details-sub-title-small">
											{$similar_model.sub_title_small}
										</div>
									</a>
								</div>
							</td>

                            <script>
                                var good = {
                                    "name": "{$similar_model.title}",
                                    "id": "{$similar_model.id}",
                                    "price": "{$similar_model->price->getValueByDecimals(0, '.', '')}",
                                    "brand": "{$similar_model->producer}",
                                    "category": "{$similar_model->parent}"
                                };

                                EEProcessor.productImpressions([good]);

                                $$('a[data-link-id="goods-link-{$similar_model.id}"]').addEvent('click', function(e){
                                    e.preventDefault();

                                    EEProcessor.productClick([good], $(this).get('href'));

                                    return false;
                                });
                            </script>
						</tr>

						{if !empty($similar_model->sku)}
							{$first_sku = $similar_model->sku->getFirst()}
							{$purchase_goods_id = $first_sku.id}
						{else}
							{$purchase_goods_id = $similar_model.id}
						{/if}

						<tr class="similar-models-t-l" id="goods{$purchase_goods_id}">
							<td class="similar-models-t-l-i similar-models-t-l-i-checkbox"></td>
							<td class="similar-models-t-l-i similar-models-t-l-i-price">
								{if !empty($similar_model.price)}
									{if $similar_model.type != 'configurable'}
										{*{if !empty($similar_model.old_price) && ($similar_model.old_price > $similar_model.price)}*}
											{*<div class="old-price-b small">*}
											{*<span class="submit-btn old-price crossed accsesories-btn">*}
												{*{$similar_model->old_price nofilter}*}
											{*</span>*}
											{*</div>*}
										{*{/if}*}

										<div class="price-block">
											<span>Цена:</span>
											{if !empty($similar_model.old_price) && ($similar_model.old_price > $similar_model.price)}
												<span class="old-price">{$similar_model->old_price nofilter}</span>
											{/if}
											<span class="price">{$similar_model->price nofilter}</span>
										</div>

										<div
												class="submit-btn accsesories-btn"
												name="buy_catalog"
												gtm-data='{ "eventLabel":"{$similar_model['id']}"}'
										></div>
										<div class="hidden" name="price">{$similar_model->price nofilter}</div>

									{else}
										{$record_prices = $similar_model -> sku -> getATPPricesForGroup()}
										{if !empty($record_prices.min)}
											<div class="btn-grey small submit-btn accsesories-btn ab-configurable">
												{if empty($record_prices.is_same)} от {/if}{$record_prices.min nofilter}
 											</div>
										{else}
											<div class="btn-grey small accsesories-btn">
												{$similar_model->sell_status.values.unavailable.title}
											</div>
										{/if}
									{/if}

								{/if}
							</td>


							{foreach from=$main_characteristics key='main_detail_name' item='main_detail'}
								<td class="similar-models-t-l-i">
								{assign var='detail_value' value=$similar_model->$main_detail_name|strval}
								{if !empty($main_detail)}
									{$detail_value}
								{else}
									—
								{/if}
								</td>
							{/foreach}


						</tr>
						<tr class="similar-models-t-l border">
							<td class="similar-models-t-l-i similar-models-t-l-i-checkbox">

							</td>
							<td class="similar-models-t-l-i similar-models-t-l-i-rating" colspan="6">
								{*<div class="b-rating small">*}
									{*<div class="rating">*}
										{*<div class="rating-i rating-good" style="width:{$similar_model.users_rating*20}%"></div>*}
									{*</div>*}
								{*</div>*}
							</td>
							<td></td>
						</tr>
					    <script type="text/javascript">GoodsCatalog.addEntity('Goods', { 'goods_id': {$purchase_goods_id}, 'added_to_cart_price': {$similar_model->getPrice()}, 'content_record_id': {$similar_model['id']} });</script>

                        <script type="text/javascript">
//                            var similar_product_{$record.id} = {
//                                "name":"{$record.title}",
//                                "id":"{$record.id}",
//                                "price":"{$record.price}",
//                                "brand":"{$record->producer.title}",
//                                "category":"{$record->parent.title}",
//                                "list":"product/similar"
//                            };
//
//                            $$('[data-link-id="goods-link-{$record.id}"]').removeEvents('click');
//                            $$('[data-link-id="goods-link-{$record.id}"]').addEvent('click', function(e) {
//                                e.preventDefault();
//
//                                var url = $(this).get('href');
//                                EEProcessor.productClick([similar_product_{$record.id}], url);
//                            } );
                        </script>
					{/foreach}

				</table>
			</div>
			{if !empty($show_link_to_similar)}
				<a href="#" class="tabs-content-link underline novisited" name="switch_to_similar">Все похожие модели</a>

				<script type="text/javascript">
					$$("a[name=switch_to_similar]").addEvent('click',function(e){
						var event = new DOMEvent(e);
						event.stop();
						goodTabs.switchTab( $$("li[name=similar]")[0] );
						new Fx.Scroll(window,{ duration:300 }).toElement($('details-tabs-menu'));
					});
				</script>
			{/if}
		</div>

		<script type="text/javascript">

			new GTMEvents([
					{ //добавление товара из похожих
						selector: '[name=similar-models-table] a[name=topurchases]',
						event: 'click',
						gtm_data: {
							event: "OWOX",
							eventCategory: 'Cart',
							eventAction: 'addFromSimilar'
						},
						depend_on_event: {
							object: GoodsCatalog,
							event: 'catalogUpdate'
						}
					}
				]);

			App.addOnDomReady(function() {

				Comparison.addEvent('update', function () {

					var item,
						show_button = false,
						ids = $$('[name=compare_like]').get('id');

					for (item=0; item < ids.length; item++) {

						if (Comparison.goods[ids[item]]) {

							show_button = true;

							break;

						}

					}

					if (show_button) {

						$$('[name=compare_button]').addEvent('click', function () {

							if (!Comparison.goods[{$record.id}]) {

								Comparison.addGoods({$record.id});

								Comparison.addEvent('actionCompleteForGoods{$record.id}', function () {

									window.location = '{$record->parent.href}comparison/';

								});

							} else {

								window.location = '{$record->parent.href}comparison/';

							}

						}).getParent().addClass('btn-link-blue').removeClass('btn-link-disable');

					} else {

						$$('[name=compare_button]').removeEvents().getParent()
							.removeClass('btn-link-blue').addClass('btn-link-disable');

					}

				});

				if (Comparison.is_updated) {

					Comparison.update();

				}

			});
		</script>

	{/if}

{/if}
