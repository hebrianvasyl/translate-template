{GoodsKits->getKitsByGoodsAndTag goods=$record->getGoods() tag="action" get_all_units_goods=true order=["order" => "ASC"] limit=25 assign="kits"}

{if count($kits)}
<div class="clearfix">
	<section class="b-goods-kit multiple before after">
		<div class="slider{if $kits|@count==1} single{/if}">
			<div class="kits-carousel clearfix" id="kits_carousel">
				<a href="#" class="btn btn-lt carousel_control_left" name="carousel_control_left"><img class="btn-img" alt="" src="{$settings.path.design}/_.gif"></a>
				<a href="#" class="btn btn-rt carousel_control_right" name="carousel_control_right"><img class="btn-img" alt="" src="{$settings.path.design}/_.gif"></a>
				<div class="slider-i float-lt">
					<ul class="g-l kit-carousel-l clearfix" name="carousel_container">
                        {assign var="kits_i" value=0}
						{foreach from=$kits item="kit"}
							{$kit.units=$kit.units|array_slice:0:3}

                            {$title_type = 0}
                            {$total_old_price = 0}

                            {foreach $kit.units as $unit_index => $unit}
                                {foreach $unit.goods as $goods_item_key => $goods_item}
                                    {$price = $goods_item->price->getValue()}
                                    {$old_price = $goods_item->old_price->getValue()}
                                    {$price_with_discount = $unit.record->getCostByGoods($goods_item)->getValue()}

                                    {$discount = 0}
                                    {if !empty($goods_item.old_price) && ($goods_item.old_price > $goods_item.price)}
                                    {$discount = (($old_price - $price_with_discount) / $old_price * 100)}
                                    {elseif $unit.record->getCostByGoods($goods_item)->getValue() < $goods_item->price->getValue()}
                                    {$discount = (($price - $price_with_discount) / $price * 100)}
                                    {elseif $unit.record.relative_discount > 0}
                                    {$discount = $unit.record.relative_discount}
                                    {/if}

                                    {if $discount > 99}
                                    {$discount = 99}
                                    {/if}

                                    {if $discount >= 90}
                                        {$title_type = 1}
                                    {else}
                                        {$title_type = 2}
                                    {/if}
                                {/foreach}
                            {/foreach}

                            {assign var="units" value=[]}
                            {foreach from=$kit.units key='key' item='unit'}
                                {$units.$key=$unit}
                                {$units.$key.goods=$unit.goods.0}
                            {/foreach}

                            {$cost = $kit.kit -> getCostWithoutDiscount($record, $units)}
                            {$cost_with_discount = $kit.kit -> getCostByGoodsAndUnits($record, $units)}
                            {$discount = $kit.kit -> getDiscountByKit($record, $units)}
                            {$discount_cost = round($cost->getValue() - $cost_with_discount->getValue())}

                            {if $discount_cost <= 49}
                                {$title_type = 3}
                            {/if}

							{$kit_goods_ids = []}
							<li class="carousel-i float-lt" name="carousel_element" id="goods{$kit.kit.id}" position="{$kits_i}">
                                <div class="b-goods-kit-title">
                                    {$kit.kit->getKitTitle($record, $units) nofilter}
                                    {*
                                    {if $kit.kit.kit_title}
                                        {$kit.kit.kit_title}
                                    {else}
                                        {if $discount_cost > 0}
                                            При покупке комплекта,  экономия <span id="discount_cost{$kit.kit.id}">{$discount_cost}</span> грн. Вместе дешевле
                                        {else}
                                            Вместе дешевле!
                                        {/if}
                                    {/if}
                                    *}
                                </div>

								<script type="text/javascript">

									/* массив с карусельками аксессуаров для комплекта.
									 Нужен, чтоб потом навесить обработчики на скролл */
									var carousels_array{$kit.kit.id} = { };

								</script>

								<ul class="g-l count-{$kit.units|count}">
									<li class="g-l-i">
										<div class="g-l-i-border">
										<div class="g-l-i-block kits-main">
											<div class="kits-main-img-b">

												{$price_with_discount = $kit.kit->getCostByGoods($record)->getValueByDecimals(null,'.','')}

												{include file="details/kits/discount_tag.tpl" price=$record.price price_with_discount=$price_with_discount}

												<img
													class="kits-main-img"
													alt="{$record.title|escape:'quotes'}"
													title="{$record.title|escape:'quotes'}"
													src="{$record->attachments->images.large.url}"
													width="{$record->attachments->images.large.width}"
													height="{$record->attachments->images.large.height}"
												/>
											</div>

											{if $record.sub_title_big or $record.sub_title_small}
												<div class="kits-main-title-big">{$record.sub_title_big}</div>
												<div class="kits-main-title-small">{$record.sub_title_small}</div>
											{else}
												<div class="kits-main-title">{$record.title}</div>
											{/if}

											<div class="price-block">
                                                {if $kit.kit->getCostByGoods($record)->getValue() < $record->old_price->getValue()}
                                                <span class="old-price">{$record->old_price nofilter}</span>
                                                {/if}
												<span class="price">{$kit.kit->getCostByGoods($record) nofilter}</span>
											</div>
										</div>
										</div>
									</li>

									{foreach $kit.units as $unit_index => $unit}

										<li class="g-l-i">
											<div class="g-l-i-block slider-small" id="units_carousel{$unit.record.id}">
												<a href="#" class="btn btn-top" name="carousel_control_left">
                                                    <svg viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><title/><g data-name="1" id="_1"><path d="M202.1,450a15,15,0,0,1-10.6-25.61L365.79,250.1,191.5,75.81A15,15,0,0,1,212.71,54.6l184.9,184.9a15,15,0,0,1,0,21.21l-184.9,184.9A15,15,0,0,1,202.1,450Z"/></g></svg>
                                                </a>

												<div class="g-l-i-block-content ">
													<ul class="kit-variants-l" name="carousel_container{$unit.record.id}">

														{foreach $unit.goods as $goods_item_key => $goods_item}

															{if $goods_item.type == 'configurable'}
																{$unit.goods.$goods_item_key = null}
																{continue}
															{/if}

														{/foreach}

														{$unit.goods = array_values(array_filter($unit.goods))}

														{$unit.goods=$unit.goods|array_slice:0:10}

														{$kit.units.$unit_index = $unit}

                                                        {assign var="i" value=1}
                                                        {assign var="kits_count" value=count($unit.goods)}

														{foreach $unit.goods as $goods_item}

															<li class="float-lt kit-variants-l-i" name="carousel_element{$unit.record.id}">
																{include file="details/kits/kits_item.tpl" index=$i count=$kits_count}
															</li>

                                                            {assign var="i" value=$i+1}

															{if !empty($goods_item->sku)}
																{$first_sku = $goods_item->sku->getFirst()}
																{$goods_item_id = $first_sku.id}
															{else}
																{$goods_item_id = $goods_item.id}
															{/if}

															{$unit_id = $unit.record.id}
															{$key = $goods_item@key}
															{$kit_goods_ids.$unit_id.$key = $goods_item_id}

														{/foreach}

													</ul>
												</div>
												<a href="#" class="btn btn-btm" name="carousel_control_right">
                                                    <svg viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg"><title/><g data-name="1" id="_1"><path d="M202.1,450a15,15,0,0,1-10.6-25.61L365.79,250.1,191.5,75.81A15,15,0,0,1,212.71,54.6l184.9,184.9a15,15,0,0,1,0,21.21l-184.9,184.9A15,15,0,0,1,202.1,450Z"/></g></svg>
                                                </a>
											</div>

											<script type="text/javascript">

												var carousel{$unit.record.id} = new Carousel_class('units_carousel{$unit.record.id}');

												carousels_array{$kit.kit.id}['{$unit.record.id}'] = carousel{$unit.record.id};

												carousel{$unit.record.id}{literal}.setOptions({
													control_size: 0,
													controls_css: {
														prev: 'carousel_control_left_disabled',
														next: 'carousel_control_right_disabled'
													},
													is_single: true,
													is_vertical: true,
													scroll_count: 1,
													container: '[name=carousel_container{/literal}{$unit.record.id}{literal}]',
													element: '[name=carousel_element{/literal}{$unit.record.id}{literal}]'
												});
												{/literal}
												carousel{$unit.record.id}.run();
											</script>

										</li>

									{/foreach}

									{assign var="units" value=[]}
									{foreach from=$kit.units key='key' item='unit'}
										{$units.$key=$unit}
										{$units.$key.goods=$unit.goods.0}
									{/foreach}

									{$cost = $kit.kit -> getCostWithoutDiscount($record, $units)}
									{$cost_with_discount = $kit.kit -> getCostByGoodsAndUnits($record, $units)}
									{$discount = $kit.kit -> getDiscountByKit($record, $units)}

									<li class="g-l-i" gtm-data='{ "eventLabel":"{$kit.kit.id}"}'>
										<div class="kit-price-b" id="kit_price{$kit.kit.id}">

											{include file="details/kits/kits_price_block.tpl" kit_id=$kit.kit.id}

										</div>
									</li>

								</ul>

								{$goods_ids = []}

								{foreach $kit.units as $unit}
									{$goods_record = $unit.goods.0}
									{if !empty($record->sku)}
										{$first_sku = $goods_record->sku->getFirst()}
										{$goods_item_id = $first_sku.id}
									{else}
										{$goods_item_id = $goods_record.id}
									{/if}

									{$key = $unit.record.id}
									{$goods_ids.$key = $goods_item_id}
								{/foreach}

								{include file='goods/purchase_goods_id.tpl' scope=parent}


								<script type="text/javascript">

									var kit{$kit.kit.id} = GoodsCatalog.addEntity("Kit", { 'goods_id':{$purchase_goods_id}, 'kit_id':{$kit.kit.id}, 'unit_ids':{$goods_ids|json_encode nofilter}});

									var kitsConstructor{$kit.kit.id} = new KitsConstructor_class(
											kit{$kit.kit.id},
											{$kit_goods_ids|json_encode nofilter}
									);

									var carousel_index;

									for (carousel_index in carousels_array{$kit.kit.id}) {

										carousels_array{$kit.kit.id}[carousel_index].addEvent('slide', function (index, position) {

											kitsConstructor{$kit.kit.id}.changeCurrentState(index, position);

											if($('discount_cost{$kit.kit.id}')) {
                                                $('discount_cost{$kit.kit.id}').set('html', $$('.kit-carousel-l .carousel-i.active .kit-price-b [name="discount_value"]')[0].value);
											}

										}.bind(this, carousel_index));

									}

                                    {if $kits_i == 0}
                                    kitsConstructor{$kit.kit.id}.changeCurrentState({$unit.record.id}, 0);
                                    {/if}

								</script>

							</li>
                            {assign var="kits_i" value=$kits_i+1}
						{/foreach}
					</ul>

                    <div id="kits-pages" class="{if count($kits) <=1}hidden{/if}">
                        {assign var="i" value=0}
                        {foreach from=$kits item="kit"}
                        <div name="page" position="{$i}" class="{if $i == 0}active{/if}"></div>
                        {assign var="i" value=$i+1}
                        {/foreach}
                    </div>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript">
        {include file="engine/KitsCarousel.class.js"}

		var Carousel = new KitsCarousel_class('kits_carousel');
		{literal}
		Carousel.setOptions({
			control_size: 0,
			controls_css: {
				prev: 'carousel_control_left_disabled',
				next: 'carousel_control_right_disabled'
			},
			is_single: true,
			is_stretchable: true
		});
		{/literal}
		Carousel.run();
	</script>
</div>
{/if}