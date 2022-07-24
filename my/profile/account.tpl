<div class="cabinet history">
    {include file="breadcrumbs.tpl" show_last_breadcrumb=1}

    {Users->getUser assign="user"}
    {if $user.user_type == 'dealer'}
    <div style="color: #856404;background-color: #fff3cd;border: 3px solid #f1b813;padding: 10px; margin: 0 0 30px 0;">
        <p style="margin: 0;">{'Для загрузки товаров на Prom.ua используйте'|translate} <a href="http://export.intexpool.ua/promua.xml" target="_blank">{'специальный XML-фид'|translate}</a>.</p>
        <hr style="margin: 10px 0;border: 0;height: 1px;background: #f1b813;">
        <p style="margin: 0 0 5px 0;">{'Для получения актуальных цен и наличия товара на складе используйте'|translate} <a href="http://export.intexpool.ua/offers.xml" target="_blank">{'специальный XML-файл'|translate}</a>.</p>
        <p style="margin: 0 0 5px 0;"><em>{'Файл обновляется каждый час'|translate}.</em></p>
        <p><strong>{'Внимание! Парсинг запрещен и будет блокироваться. Используйте выгрузку'|translate}.</strong></p>
    </div>
    {/if}

    {include file="profile/agreements_block.tpl"}

	{include file="profile/body-menu.tpl"}

	<section class="content-wrapper">

		<div class="account">
			<div class="container">
				<div name="app-message"></div>

				{Controller->getOrders assign="orders"}

				{if count($orders)}
					<ul class="order-history" id="order-list">
						{foreach $orders as $order}

							{*Находим все счета для показа*}
							{assign var='invoices' value=[]}
							{assign var='unpaid_invoices' value=[]}
							{if count($order->invoices)}
								{foreach from=$order->invoices item='invoice'}
									{if $invoice.status == 'unpaid' || $invoice.status == 'paid' || $invoice.status == 'hold'}
										{$invoices[]=$invoice}
									{/if}
									{if $invoice.status == 'unpaid'}
										{$unpaid_invoices[]=$invoice}
									{/if}
								{/foreach}
							{/if}

							<li class="my-order {$order->status.value}">
								<div class="order">
									<div class="order-left float-lt">
										<div class="order-title-head">
										{*когда заказ в статусе нового, а счета уже в статусе "hold",
											для клиента он уже оплачен*}
										{if $order.status == 'new' && count($invoices) > 0 && !count($unpaid_invoices)}
											<h2 class="order-title order-complete after">
												{$order->status->values.paid.title} №{$order->getId()}
											</h2>
										{else}
											<h2 class="order-title
											{if $order.status == 'new'} order-green
											{elseif $order.status == 'success'} order-success after
											{elseif $order.status == 'complete'
												|| $order.status == 'paid'} order-complete after
											{elseif $order.status == 'fail'
												|| $order.status == 'cancel-test'
												|| $order.status == 'cancel-user'
												|| $order.status == 'cancel-admin'} order-cancel after
											{elseif $order.status == 'cancel-contact'
												|| $order.status == 'unpaid'
												|| $order.status == 'cancel-nopay'
												|| $order.status == 'cancel-error-data'
												|| $order.status == 'communication'} order-red
											{/if}">
												{$order->status->value.title} №{$order->getId()}
											</h2>
										{/if}
										</div>

										<table class="order-t">
											<tr>
												<td class="order-t-lt">{'Дата и время'|translate}</td>
												<td class="order-t-rt">{$order->created->nice_date}, {"H:i"|date:$order->created->getTimeStamp()}</td>
											</tr>

                                            {if $order.order_type == 'dealer_client'}
                                            <tr>
                                                <td class="order-t-lt">{'Имя и фамилия получателя'|translate}</td>
                                                <td class="order-t-rt">{$order.recipient_title}</td>
                                            </tr>
                                            <tr>
                                                <td class="order-t-lt">{'Телефон получателя'|translate}</td>
                                                <td class="order-t-rt">{$order.recipient_phone}</td>
                                            </tr>
                                            {else}
											<tr>
												<td class="order-t-lt">{'Имя и фамилия'|translate}</td>
												<td class="order-t-rt">
                                                    {if !empty($order->deliveries[0]['recipient_title'])}
														{$order->deliveries[0]['recipient_title']}
													{else}
														{$order->user.first_name}
														{if !empty($order->user.last_name)}
															{$order->user.last_name}
														{/if}
													{/if}
												</td>
											</tr>
											<tr>
												<td class="order-t-lt">{'Мобильный телефон'|translate}</td>
												<td class="order-t-rt">{if !empty($order->deliveries[0]->phone)}{$order->deliveries[0]->phone|replace:" (мобильный)":""}{else}-{/if}</td>
											</tr>
                                            <tr>
                                                <td class="order-t-lt">{'Эл. почта'|translate}</td>
                                                <td class="order-t-rt">
                                                    {if !empty($order->user.email)}
                                                    {$order->user.email}
                                                    {else}
                                                    -
                                                    {/if}
                                                </td>
                                            </tr>
                                            {/if}
											<tr>
												<td class="order-t-lt">{'Доставка'|translate}</td>
												<td class="order-t-rt">{if !empty($order->deliveries[0]->method) && $order->deliveries[0]->method['id'] != 23}{$order->deliveries[0]->method}{else}-{/if}</td>
											</tr>
											<tr>
												<td class="order-t-lt">{'Адрес'|translate}</td>
												<td class="order-t-rt">
													{if $order->deliveries[0].method_id == 22}
														{'г. Ужгород, ул. Радищева, 1'|translate}
													{else}
														{if !empty($order->deliveries[0]->address)}
															{$order->deliveries[0]->address}
														{else}
															{if !empty($order->deliveries[0]->place)}
																{$order->deliveries[0]->place|replace:"{'Новая почта'|translate}, ":""}
															{else}
																-
															{/if}
														{/if}
													{/if}
												</td>
											</tr>
											<tr>
												<td class="order-t-lt">{'Оплата'|translate}</td>
												<td class="order-t-rt">{if !empty($order->invoices[0]->payment_method)}{$order->invoices[0]->payment_method}{else}-{/if}</td>
											</tr>
											{if !empty($order->declaration_number.value)}
											<tr>
												<td colspan="2"><hr style="background: #e4e4e4;border: 0;height: 1px;margin: 0px 0px 10px 0px;"></td>
											</tr>
											<tr>
												<td class="order-t-lt">{'Номер декларации от службы доставки'|translate}</td>
												<td class="order-t-rt">
													{$order->declaration_number.value}
												</td>
											</tr>
											{/if}
                                            {if !empty($order.comment)}
                                            <tr>
                                                <td class="order-t-lt">{'Комментарий'|translate}</td>
                                                <td class="order-t-rt">{$order.comment|nl2br nofilter}</td>
                                            </tr>
                                            {/if}
										</table>
									</div>
									<div class="order-right float-lt">
										<div class="order-title-head">
											<h2>{'Ваш заказ'|translate}</h2>
										</div>
										<ul class="order-l">
											{Controller->getChildController assign="order_controller" name="order"}

											{assign var='grouped_merchandises' value=$order_controller->getGroupedMerchandisesByDiscountModules($order)}

											{$goods_kits_index = 'Goods.Kits'}

											{if !empty($grouped_merchandises.$goods_kits_index) and count($grouped_merchandises.$goods_kits_index)}
												{foreach $grouped_merchandises.$goods_kits_index as $kit}

													<li class="order-i cart-g-l-i kit">
														<div class="kit-wrap-red">
															<div class="b-goods-kit">
																<div class="b-goods-kit-header">
																	<h4 class="b-goods-kit-title">{'Акционный комплект'|translate}</h4>
																</div>
                                                                {$first_purchase = reset($kit.purchases)}
																<ul class="cart-g-l">
																	{$kit_cost_without_discount = 0}
																	{foreach $kit.purchases as $purchase}

																		{$cost = $purchase->cost->getValueByDecimals(null, ',', '')}
																		{$kit_cost_without_discount = $kit_cost_without_discount + $cost}
																		{$cost_with_discount = $purchase->cost_with_discount->getValueByDecimals(null, ',', '')}

																		<li class="cart-g-l-i clearfix">
                                                                            <div class="cart-g-l-content">
                                                                                <table class="table">
                                                                                    <tr>
                                                                                        <td width="1">
                                                                                            <div class="cart-g-l-img">
                                                                                                <a href="{$purchase->goods.external_href}" class="cart-g-l-img-link">
                                                                                                    {$purchase->goods->attachments->images.medium nofilter}
                                                                                                </a>
                                                                                            </div>
                                                                                        </td>
                                                                                        <td>
                                                                                            <div class="cart-g-l-i-title">
                                                                                                <a href="{$purchase->goods.external_href}" class="novisited">{$purchase->goods.title}</a>
                                                                                            </div>
                                                                                        </td>
                                                                                        <td width="1">
                                                                                            <div class="g-l-info-i g-l-info-amount">{$first_purchase->quantity|replace:" шт":""}</div>
                                                                                        </td>
                                                                                        <td width="1">
                                                                                            <div class="g-l-info-count">
                                                                                                {if $cost_with_discount/$purchase->quantity->getValue() < $cost/$purchase->quantity->getValue()}
                                                                                                <div class="old-price-discount">
                                                                                                    <div class="old-price-b">
                                                                                                <span class="g-l-i-price old-price crossed">
                                                                                                    {$purchase->price nofilter}
                                                                                                </span>
                                                                                                    </div>
                                                                                                </div>
                                                                                                {/if}
                                                                                                <div class="cart-g-l-content-cost-i">
                                                                                                    {($cost_with_discount/$purchase->quantity->getValue())|number_format:$purchase->cost_with_discount->getDecimals():',':' '} {$purchase->cost->unit}
                                                                                                </div>
                                                                                            </div>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </div>
																		</li>
																	{/foreach}
																</ul>

																<div class="b-goods-kit-footer">
																	<table class="b-goods-kit-info">
																		<tr>
																			<td class="b-goods-kit-price">{'Цена комплекта'|translate}:</td>
																			<td class="b-goods-kit-cost">
                                                                                <span class="kit-cost-without-discount">
                                                                                    {$first_purchase->price->getValueObject($kit_cost_without_discount) nofilter}
                                                                                </span>
                                                                                {$kit.discount_raw_data->kit_cost.primary.string nofilter}
                                                                            </td>
																		</tr>
																	</table>
																</div>
															</div>
														</div>
													</li>

												{/foreach}
											{/if}

											{if !empty($grouped_merchandises.simple) and count($grouped_merchandises.simple)}
												{foreach from=$grouped_merchandises.simple item="merchandise" name="merchandises"}
													<li class="order-i cart-g-l-i products clearfix">
														<div class="cart-g-l-content">
                                                            {$goods_item = $merchandise->goods}
                                                            <table class="table">
                                                                <tr>
																	{if $order.status != 'complete'}
                                                                    <td width="1">
                                                                        <div class="cart-g-l-img">
                                                                            <div class="cart-g-l-img-link">{$merchandise->goods->attachments->images.medium nofilter}</div>
                                                                        </div>
                                                                    </td>
																	{/if}
                                                                    <td>
                                                                        <div class="cart-g-l-i-title">
																			{if $order.status != 'complete'}
                                                                            <a href="{$merchandise->goods.external_href}" class="novisited">{$goods_item.title}</a>
																			{else}
																				<div style="padding: 0 0 0 10px;">
																				{if !empty($merchandise.good_title)}
																					{$merchandise.good_title}
																				{else}
																					{$goods_item.title}
																				{/if}
																				</div>
																			{/if}
                                                                        </div>
                                                                    </td>
                                                                    <td width="1">
                                                                        <div class="g-l-info-i g-l-info-amount">{$merchandise->quantity|replace:" шт":""}</div>
                                                                    </td>
                                                                    <td width="1">
                                                                        <div class="g-l-info-count">
                                                                            {if isset($merchandise->cost_with_discount) and $merchandise->cost_with_discount->getValue() != $merchandise->cost->getValue()}
                                                                            <div class="old-price-discount">
                                                                                <div class="old-price-b">
																			<span class="g-l-i-price old-price crossed">
																				{$merchandise->cost nofilter}
																			</span>
                                                                                </div>
                                                                            </div>
                                                                            {/if}
                                                                            <div class="cart-g-l-content-cost-i">
                                                                                {if isset($merchandise->cost_with_discount)}
                                                                                {$merchandise->cost_with_discount nofilter}
                                                                                {else}
                                                                                {$merchandise->price nofilter}
                                                                                {/if}
                                                                            </div>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>

															<div class="clearfix">
																{include "my/config-params.tpl" purchase=$merchandise}
															</div>
														</div>
													</li>
												{/foreach}
											{/if}

											<li class="order-i cart-g-l-i total">
												<div class="order-i-text left-column-text valigned-bottom">
													{'Итого'|translate}{if $user.user_type == 'dealer' && $order.dealer_discount == 1} ({'для дропшиппера'|translate}){/if}:
                                                </div>
												<div class="order-i-text right-column-text valigned-bottom g-l-info-cost">
													{if isset($order->cost_with_discount)}
														{$order->cost_with_discount nofilter}
													{else}
														{$order->cost nofilter}
													{/if}
												</div>
											</li>

                                            {if $order.order_type == 'dealer_client' && $order.recipient_amount > 0}
                                            <li class="order-i cart-g-l-i total">
                                                <div class="order-i-text left-column-text valigned-bottom">{'Итого (для покупателя)'|translate}:</div>
                                                <div class="order-i-text right-column-text valigned-bottom g-l-info-cost">
                                                    {$order.recipient_amount|number_format:0:',':' '} грн
                                                </div>
                                            </li>
                                            {/if}
										</ul>


                                        <div class="clearfix text-right">
                                            <hr style="border: 0;border-top: 1px solid #d9d9d9; height: 1px;width: 100%; margin: 30px 0;">
                                            {if !$order->isCanceled() && count($order->attachments->invoice) > 0}
                                            <a href="{$order->attachments->invoice.original.url}" target="_blank" class="downloadPDFInvoice">
                                                <i>&nbsp;</i>{'Скачать счет на оплату'|translate}
                                            </a>
                                            {/if}
                                            {if $order.status == 'complete' && $order.order_type != 'dealer_client'}
                                            <a href="{$order->getPDFInvoiceUrl()}" target="_blank" class="downloadPDFInvoice">
                                                <i>&nbsp;</i>{'Скачать расходную накладную'|translate}
                                            </a>
                                            {/if}

                                            {if $order.status == 'new' || $order.status == 'progress'}
                                            <span class="btn-link btn-grey submit-btn float-rt" >
											    <a class="btn-link-i js-order-cancel" data-order-id="{$order.id}" name="cancel-order-link" href="javascript:;">{'Отменить заказ'|translate}</a>
										    </span>
                                            <div class="text-right order-cancel-result" id="order-cancel-result-{$order.id}"></div>
                                            {/if}
                                        </div>
									</div>
								</div>

								{if !empty($invoices) && $invoices.0->payment_method->isOnline()}
									<div class="pay-block clearfix" name="pay-block">
										{$isset_unpaid = false}
										{if count($invoices) == 1 && $invoices.0.status == 'unpaid'}
											{$isset_unpaid = true}
										{elseif count($invoices) > 1}
											{foreach from=$invoices item='invoice'}
												{if $invoice.status == 'unpaid'}
													{$isset_unpaid = true}
												{/if}
											{/foreach}
										{/if}
										<div class="clearfix">
											{if count($invoices.0->payment_method->attachments->logo)}
												<img class="float-lt"
													 alt="{$invoices.0->payment_method.title|escape:'quotes'}"
													 title="{$invoices.0->payment_method.title|escape:'quotes'}"
													 src="{$invoices.0->payment_method->attachments->logo.original.url}"
													 width="{$invoices.0->payment_method->attachments->logo.original.width}"
													 height="{$invoices.0->payment_method->attachments->logo.original.height}"
												>
											{/if}
											{if $isset_unpaid}
												<span class="pb-text">
												<span class="pb-text-i">{'Для оплаты заказа вы будете переадресованны на страницу процессингового центра'|translate}</span>
											</span>
											{/if}
										</div>
										<div class="float-rt">
											{$isset_unpaid = false}
											{if count($invoices) == 1 && $invoices.0.status == 'unpaid'}
												{$isset_unpaid = true}
												{include file="my/checkout/payments/{$invoices.0->payment_method.processing}.tpl" invoice=$invoice submit_caption="{'Оплатить заказ сейчас'|translate}"}

											{elseif count($invoices) > 1}

												{foreach from=$invoices item='invoice'}

													<p>

														{'Номер счета'|translate}: {$invoice.id}
														{'Сумма'|translate}: {$invoice->amount nofilter}
														{'Статус'|translate}: {if $invoice.status == 'paid' || $invoice.status == 'hold'}{'Оплачен'|translate}{else}{'Не оплачен'|translate}{/if}

														{if $invoice.status == 'unpaid'}
															{$isset_unpaid = true}
															{include file="my/checkout/payments/{$invoice->payment_method.processing}.tpl" invoice=$invoice submit_caption="{'Оплатить счет'|translate}"}
														{/if}
													</p>

												{/foreach}

											{/if}
											<ul class="pay-l">
												<li class="pay-l-i valigned-bottom cards"><img class="pay-l-i-img" src="{$settings.path.design}/checkout-visa-bg.png"></li>
												<li class="pay-l-i valigned-bottom cards"><img class="pay-l-i-img" src="{$settings.path.design}/checkout-master-bg.png"></li>
											</ul>
										</div>
									</div>
								{/if}
							</li>
						{/foreach}
					</ul>

                    <script>
                        new GTMEvents([
                                { //отмена заказа
                                    selector: 'a[name=cancel-order-link]',
                                    event: 'click',
                                    gtm_data: {
                                        event: "OWOX",
                                        eventCategory: 'Profile',
                                        eventAction: 'cancelOrder'
                                    }
                                },
                                { //оплата заказа
                                    selector: '[name=pay-block] form',
                                    event: 'submit',
                                    gtm_data: {
                                        event: "OWOX",
                                        eventCategory: 'Profile',
                                        eventAction: 'payOrder'
                                    }
                                }
                            ]);
                    </script>

                    {include file="body-page-navigation.tpl" pos='videocontent'}
				{else}
                    <p>{'Вы еще ничего не заказывали в нашем магазине'|translate}.</p>
				{/if}
			</div>
		</div>

    </section>

</div>
<style>
.js-order-cancel.disabled {
    opacity: 0.5;
    cursor: wait;
}
.order-cancel-result {
    font-size: 16px;
}
.order-cancel-result.error {
    color: red;
}
.order-cancel-result.success {
    color: green;
}
</style>
<script>
$('order-list').getElements('[name=cancel-order-link]').addEvent('click', function(event) {
    var button = $(this);
    if(button.hasClass('disabled')) {
        // Cancellation in process
        return false;
    }

    var orderId = button.get('data-order-id');

    button.set('disabled', true);
    button.addClass('disabled');

    new Request({
        url: '/cgi-bin/form.php',
        data: {
            json: 1,
            orderId: orderId
        },
        headers: {
            ajaxAction: '{$menu.www.href}users/#cancelOrderRequest'
        },
        onSuccess: function (response) {
            var data = JSON.parse(response);

            button.set('disabled', false);
            button.removeClass('disabled');
            button.addClass('hidden');

            var res = $('order-cancel-result-' + orderId);
            res.set('html', data.message.content.msg);

            if(data.message.code === 0) {
                res.addClass('success');
            } else {
                res.addClass('error');
            }
        }.bind(this),
        onFailure: function () {
            button.set('disabled', false);
            button.removeClass('disabled');

            alert("{'Ошибка на сервере'|translate}");
        }.bind(this)
    }).send();
});
</script>