<ul>

	{Controller->getChildController assign="order_controller" name="order"}

	{assign var='grouped_merchandises' value=$order_controller->getGroupedMerchandisesByDiscountModules($order)}

	{$goods_kits_index = 'Goods.Kits'}

	{if !empty($grouped_merchandises.$goods_kits_index) and count($grouped_merchandises.$goods_kits_index)}
		{foreach $grouped_merchandises.$goods_kits_index as $kit}

			<div class="kit-wrap-red">
				<div class="b-goods-kit">
					<div class="b-goods-kit-header">
						<h4 class="b-goods-kit-title">Акционный комплект</h4>
					</div>
					<ul class="cart-g-l">
						{$kit_cost_without_discount = 0}
						{foreach $kit.purchases as $purchase}

							{$cost = $purchase->cost->getValueByDecimals(null, ',', '')}
							{$kit_cost_without_discount = $kit_cost_without_discount + $cost}
							{$cost_with_discount = $purchase->cost_with_discount->getValueByDecimals(null, ',', '')}

							<li class="cart-g-l-i cart-g-l-i-popup clearfix">
								<div class="cart-g-l-img float-lt">
									<a href="{$purchase->goods.external_href}" class="cart-g-l-img-link">
										<img
											src="{$purchase->goods->attachments->images.very_small.url nofilter}"
											alt=""
											width="{$purchase->goods->attachments->image.very_small.width}"
											height="{$purchase->goods->attachments->image.very_small.height}"
										>
									</a>
								</div>
								<div class="cart-g-l-content">
									<div class="cart-g-l-i-title">
										<a href="{$purchase->goods.external_href}">{$purchase->goods.title}</a>
									</div>
									<table class="g-l-info">
										<tr>
											<td class="g-l-info-i g-l-info-price old-price-b">
												<div class="old-price-wrap">
													{if $cost_with_discount/$purchase->quantity->getValue() < $cost/$purchase->quantity->getValue()}
														<span class="old-price">{$purchase->price nofilter}</span>
													{/if}
												</div>
											</td>
											<td class="g-l-info-i g-l-info-amount"><span class="g-l-info-amount-content">1</span> шт</td>
											<td class="g-l-info-i g-l-info-price price-cur-b">
												<span class="g-l-info-price-cur">{($cost_with_discount/$purchase->quantity->getValue())|number_format:$purchase->cost_with_discount->getDecimals():',':' '} {$purchase->cost->unit}</span>
											</td>
										</tr>
									</table>
								</div>
							</li>
						{/foreach}
					</ul>

					{$first_purchase = reset($kit.purchases)}
					<div class="b-goods-kit-footer">
						<table class="b-goods-kit-info">
							<tr>
								<td class="b-goods-kit-price">Цена комплекта:</td>
								<td class="kit-cost-without-discount">{$first_purchase->price->getValueObject($kit_cost_without_discount) nofilter}</td>
								<td class="b-goods-kit-cost">{$kit.discount_raw_data->kit_cost.primary.string nofilter}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>

		{/foreach}
	{/if}

	{if !empty($grouped_merchandises.simple) and count($grouped_merchandises.simple)}
		{foreach from=$grouped_merchandises.simple item="purchase"}
			<li class="order-i cart-g-l-i clearfix" id="cart_item{$purchase.id}">


				<div class="cart-g-l-img float-lt">
					<a href="{$purchase->goods.external_href}">{$purchase->goods->attachments->images.small nofilter}</a>
				</div>
				{$goods_item = $purchase->goods}
				<div class="cart-g-l-content">
					<div class="cart-g-l-i-title"><a href="{$purchase->goods.external_href}">{$goods_item.title}</a></div>
					<table class="g-l-info success-simple-p">
						<tr>
							<td class="g-l-info-i g-l-info-price">{$purchase->price nofilter}</td>
							<td class="g-l-info-i g-l-info-amount aligned-right-important"><span>{$purchase.quantity} шт.</span></td>
							<td class="g-l-info-i g-l-info-cost">
								{if isset($purchase->cost_with_discount) and $purchase->cost_with_discount->getValue() != $purchase->cost->getValue()}
									<div class="old-price-discount">
										<div class="old-price-b">
											<span class="g-l-i-price old-price crossed">
												{$purchase->cost nofilter}
											</span>
										</div>
									</div>
								{/if}
								<div class="order-succsess-summ-i">
									{if isset($purchase->cost_with_discount)}
										{$purchase->cost_with_discount nofilter}
									{else}
										{$purchase->cost nofilter}
									{/if}
								</div>
							</td>
						</tr>
					</table>
					{include "my/config-params.tpl" purchase=$purchase}
				</div>

			</li>
		{/foreach}
	{/if}

	{assign var='delivery' value=$order->deliveries->getLast()}
	<li class="order-i cart-g-l-i clearfix">
		<p class="order-i-text left-column-text valigned-bottom">{$delivery->method.title}</p>
		<p class="order-i-text right-column-text valigned-bottom g-l-info-cost float-rt">
			{if in_array($delivery->method.name, ['nova-poshta', 'courier-service']) && $delivery->cost->getValue() == 0}
				Уточнить у менеджера
			{else}
				{$delivery->cost nofilter}
			{/if}
		</p>
	</li>

	<li class="order-i cart-g-l-i total">
		<div class="order-i-text left-column-text valigned-bottom">Итого к оплате:</div>
		<div class="order-i-text right-column-text valigned-bottom g-l-info-cost">
			{if $order->cost_with_discount}
				{$order->cost_with_discount nofilter}
			{else}
				{$order->cost nofilter}
			{/if}
		</div>
	</li>
</ul>