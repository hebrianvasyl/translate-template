<div class="cart-block">
	{assign var="purchases" value=$cart->purchases}

	{if $cart->show_in_stock_bar}
	<div class="id_row">
		<div class="id">В наличии</div>
		<div id="delivery-deadline" class="id">
			{if date('H') < $settings.Contacts.delivery_today_deadline}
				Отправим сегодня
			{else}
				Отправим завтра
			{/if}
		</div>
		<div id="delivery-uzh-pickup-deadline" class="id hidden">
			{if date('H') < $settings.Contacts.pickup_today_deadline}
				Выдача сегодня
			{else}
				Выдача завтра
			{/if}
		</div>
	</div>
	{/if}

	<div>
		<div class="order-i cart-g-l-i">
			<div class="purchases-b" id="purchases"></div>
		</div>

		<div class="order-i cart-g-l-i coupon {if $user.user_type == 'dealer'}hidden{/if}">
			<div id="coupon_container" class="order-i-text coupon-field valigned-bottom"></div>
		</div>

		<div class="count">
			{if $user.user_type == 'dealer'}
			<div class="count__row">
				<div class="count__col">Ваш баланс:</div>
				<div class="count__col">
					{if $user.balance < 0}
						<span style="color: red;">{$user.balance|number_format:2:".":" "} грн</span>
					{else}
						<span>{$user.balance|number_format:2:".":" "} грн</span>
					{/if}
				</div>
			</div>
			{/if}
			<div id="cart-sub-total" class="count__row hidden">
				<div class="count__col">Всего:</div>
				<div class="count__col" data-role="cart_sub_total"></div>
			</div>
			<div id="cart-discount" class="count__row hidden">
				<div class="count__col">Скидка:</div>
				<div class="count__col" data-role="cart_discount"></div>
			</div>
			<div class="count__row">
				<div class="count__col bold">Итого: </div>
				<div class="count__col bold" data-role="cart_total">{$cart->cost nofilter}</div>
			</div>
			<div class="count__row hidden">
				<div class="count__col bold">Итого с доставкой: </div>
				<div id="total-cost-with-delivery" class="count__col bold">по тарифам перевозчика</div>
			</div>
			{if $user.user_type == 'dealer'}
			<div class="count__row dealer-total-cost">
				<div class="count__col bold text-nowrap">Итого (для покупателя):</div>
				<div class="count__col bold g-l-info-cost" data-role="cart_total">{$cart->cost nofilter}</div>
			</div>
			{/if}
		</div>


		<div class="order-i cart-g-l-i totals hidden">
            {if $user.user_type == 'dealer'}
            <div class="clearfix dealer-balance order-i-total">
                <div class="order-i-text ">Ваш баланс:</div>
                <div class="valigned-bottom g-l-info-cost" >
                    <div style="font-size: 16px;">
                        {if $user.balance < 0}
                        <span style="color: red;">{$user.balance|number_format:2:".":" "} грн</span>
                        {else}
                        <span>{$user.balance|number_format:2:".":" "} грн</span>
                        {/if}
                    </div>
                </div>
            </div>
            {/if}

			{* TOTAL *}
			<div class="clearfix order-i-total">
				<div class="order-i-text ">Итого:</div>
				<div class="hidden" id="delivery_cost_raw"></div>
				<div class="valigned-bottom g-l-info-cost" >
					<div class="old-price-discount">
						<div class="old-price-b">
{*							<div id="cart_total_cost" class="g-l-i-price old-price crossed"></div>*}
						</div>
					</div>
{*					<div data-role="cart_total">{$cart->cost nofilter}</div>*}
				</div>
			</div>
            <div class="clearfix hidden dealer-total-cost order-i-total">
                <div class="order-i-text ">Итого (для покупателя):</div>
                <div class="valigned-bottom g-l-info-cost" >
                    <div></div>
                </div>
            </div>
			{* WEIGHT *}
			<div class="clearfix hidden" id="weight_container">
				<p class="order-i-text left-column-text valigned-bottom">Вес:</p>
				<p class="order-i-text right-column-text valigned-bottom g-l-info-cost" id="weight_value"></p>
			</div>

			{* VOLUME *}
			<div class="clearfix hidden" id="volume_container">
				<p class="order-i-text left-column-text valigned-bottom">Объем:</p>
				<p class="order-i-text right-column-text valigned-bottom g-l-info-cost" id="volume_value"></p>
			</div>
			<div id="cart-delivery-info" class="hidden">
				{* DELIVERY *}
				<div class="clearfix">
					<p class="order-i-text left-column-text valigned-bottom" id="delivery_title"></p>
					<p class="order-i-text right-column-text valigned-bottom g-l-info-cost" id="delivery_cost"></p>
				</div>

				{* COMISSION *}
				<div class="clearfix" id="commission_container">
					<p class="order-i-text left-column-text valigned-bottom">Комиссия за платеж:</p>
					<p class="order-i-text right-column-text valigned-bottom g-l-info-cost" id="commission_value"></p>
				</div>
			</div>

            <div id="cart-payment-info" class="hidden"></div>

			{* EDIT ORDER *}
			<div class="aligned-center hidden">
				<a href="#" id="checkout-show-cart-popup" class="order-link">Редактировать заказ</a>
			</div>
		</div>
	</div>

	<script>
	{literal}

		App.addOnDomReady(function () {

			Coupon.addEvent('update', function () {
				var input = $('coupon_code_item');

				if (input) {
					input.meiomask(
							input.get('data-meiomask'),
							JSON.decode(input.get('data-meiomask-options'))
					);
				}
			});

			Coupon.init();

		});

	{/literal}

	</script>
</div>

<script type="text/javascript">
    var google_tag_params = {
        dynx_itemid: [{foreach $cart->purchases as $purchase}{$purchase->goods.goods_id},
		{/foreach}],
        dynx_pagetype: 'cart',
        dynx_totalvalue: {$cart.cost_raw}
    };
</script>