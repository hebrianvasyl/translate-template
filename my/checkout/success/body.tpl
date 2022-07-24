{$user = $order->user}
{assign var='delivery' value=$order->deliveries->getLast()}
{assign var='payment' value=$order->invoices->getFirst()}

{if $user.user_type == 'dealer'}
<script>
    App.get('localStorage').remove('new_user_last_name');
    App.get('localStorage').remove('new_user_first_name');
    App.get('localStorage').remove('new_user_second_name');
    App.get('localStorage').remove('new_user_locality');
    App.get('localStorage').remove('new_user_login');
</script>
{/if}

<script>
    App.get('localStorage').remove('recipient_last_name');
    App.get('localStorage').remove('recipient_first_name');
    App.get('localStorage').remove('recipient_second_name');
    App.get('localStorage').remove('recipient_phone');
</script>

<div class="checkout success clearfix">
    <div class="title not-for-print" name="app-message"></div>

    {literal}
        <script>
        App.addOnDomReady(function () {

            if ($$('[name=app-message]')[0] && $$('[name=app-message]')[0].innerHTML == '') {

                App.showMessage(new Message_class({
                    code: 1,
                    content: "{'Спасибо за покупку'|translate}"
                }));

            }

        });

        </script>
    {/literal}

    <h2 class="check-title padding-lt for-print border-btm hidden">{'Номер заказа'|translate}: №{$order->getId()}
        <p class="order-title-date">{$order->created->nice_date}, {"H:i"|date:$order->created->getTimeStamp()}</p>
    </h2>

    <div class="check-lt for-print hidden">
        <table class="order-t">
            {assign var='delivery' value=$order->deliveries->getLast()}
            {if !empty($delivery)}
            <tr class="order-t-i">
                <td class="order-t-i-lt grey">{'Доставка'|translate}:</td>
                <td class="order-t-i-rt">{$delivery->method.title}</td>
            </tr>
            {/if}
            {if !empty($order->invoices[0])}
            <tr class="order-t-i">
                <td class="order-t-i-lt grey">{'Оплата'|translate}:</td>
                <td class="order-t-i-rt">{$order->invoices[0]->payment_method}</td>
            </tr>
            {/if}
            {if !is_numeric($order->user.title)}
            <tr class="order-t-i">
                <td class="order-t-i-lt grey">{'Имя получателя'|translate}:</td>
                <td class="order-t-i-rt">{$order->user.title}</td>
            </tr>
            {else}
            <tr class="order-t-i">
                <td class="order-t-i-lt grey">{'Телефон'|translate}:</td>
                <td class="order-t-i-rt">{$order->user.title}</td>
            </tr>
            {/if}
            {if !empty($order->deliveries[0])}
            <tr class="order-t-i">
                <td class="order-t-i-lt grey">{'Телефон'|translate}:</td>
                <td class="order-t-i-rt">{$order->deliveries[0]->phone|@phone_format}</td>
            </tr>
            {/if}
            {if !empty($order->deliveries.0->address)}
                <tr class="order-t-i">
                    <td class="order-t-i-lt grey">{'Адрес получателя'|translate}:</td>
                    <td class="order-t-i-rt">{$order->deliveries.0->address}</td>
                </tr>
            {/if}
            {if !empty($order->user.email)}
                <tr class="order-t-i">
                    <td class="order-t-i-ltv grey">{'Эл почта'|translate}:</td>
                    <td class="order-t-i-rt">{$order->user.email}</td>
                </tr>
            {/if}
            {if !empty($order.comment)}
                <tr class="order-t-i">
                    <td class="order-t-i-lt grey">{'Комментарий'|translate}:</td>
                    <td class="order-t-i-rt">{$order.comment}</td>
                </tr>
            {/if}
        </table>
    </div>

    <div class="check-lt padding-lt not-for-print">
        <table class="order-t">
            <tr class="order-t-i">
                <td class="order-t-i-lt">{'Номер заказ'|translate}: <b>№{$order->getId()}</b></td>
            </tr>
            <tr class="order-t-i">
                <td class="order-t-i-lt">{'Сумма заказа'|translate}: <b>{$order->cost_with_discount nofilter}</b></td>
            </tr>
            <tr class="order-t-i">
                <td class="order-t-i-lt">
                    <div>
                            {'Оформление заказа'|translate} {"H:i"|date:$order->created->getTimeStamp()}, {"d.m.Y"|date:$order->created->getTimeStamp()}:
                        {if date('H') < $settings.Contacts.delivery_today_deadline}
                            <b>{'Отправим сегодня'|translate}</b>
                        {else}
                            <b>{'Отправим завтра'|translate}</b>
                        {/if}
                    </div>
                </td>
            </tr>
            {if $payment}
            <tr class="order-t-i" style="color: #666; font-size: 12px; font-style: italic">
                <td class="order-t-i-lt">
                    <p><br></p>
                    {$payment->payment_method.full_description nofilter}
                </td>
            </tr>
            {/if}
            {if $delivery}
            <tr class="order-t-i" style="color: #666; font-size: 12px; font-style: italic">
                <td class="order-t-i-lt">
                    <p><br></p>
                    {$delivery->method.full_description nofilter}
                </td>
            </tr>
            {/if}
        </table>

        {if !empty($order->invoices[0])}
            {assign var="invoices" value=$order->invoices}
            {if !empty($invoices) && $invoices.0.status != 'paid' && $invoices.0->payment_method->isOnline()}
            <div class="pay-wrap">
                <div class="pay-block">
                    <div class="pay-btn-wrap">
                        {if count($invoices) == 1 && $invoices.0.status == 'unpaid'}

                            {include file="my/checkout/payments/{$invoices.0->payment_method.processing}.tpl" invoice=$invoices.0}

                        {/if}
                    </div>
                    <ul class="pay-l">
                        <li class="pay-l-i cards"><img class="pay-l-i-img" src="{$settings.path.design}/checkout-visa.png"></li>
                        <li class="pay-l-i cards"><img class="pay-l-i-img" src="{$settings.path.design}/checkout-master.png"></li>
                    </ul>
                    <p class="pb-text">{'Для оплаты заказа вы&nbsp;будете переадресованны на&nbsp;страницу процессингового центра'|translate} <span class="pb-text-processing after">{'ПриватБанка'|translate}</span></p>
                </div>
            </div>
            {/if}
        {/if}

        {if $user.user_type == 'dealer'}
        <div style="padding: 10px;">
            <a href="{$menu.my.href}" class="btn-primary">
                {'Перейти в свой кабинет'|translate}
            </a>
        </div>
        {/if}
    </div>

    <div class="not-for-print">
{*        {SuccessPageRules->getScenario payment_method=$payment->payment_method delivery_method=$delivery->method assign="scenario"}*}
{*        {eval var=$scenario}*}

        {if $delivery->method.name == 'uzh_pickup' && $payment->payment_method.name == 'uzh_cash'}
            {include file="scripts/variant_4.tpl"}
        {elseif $delivery->method.name == 'uzh_pickup' && $payment->payment_method.name == 'privatbank'}
            {include file="scripts/variant_5.tpl"}
        {elseif $delivery->method.name == 'uzh_pickup' && $payment->payment_method.name == 'liqpay'}
            {include file="scripts/variant_6.tpl"}
        {elseif $delivery->method.name == 'uzh_pickup' && $payment->payment_method.name == 'novapay'}
        {include file="scripts/variant_8.tpl"}
        {elseif $delivery->method.name == '1click'}
            {include file="scripts/variant_7.tpl"}
        {elseif $payment->payment_method.name == 'cash'}
            {include file="scripts/variant_1.tpl"}
        {elseif $payment->payment_method.name == 'privatbank'}
            {include file="scripts/variant_2.tpl"}
        {elseif $payment->payment_method.name == 'liqpay'}
            {include file="scripts/variant_3.tpl"}
        {elseif $payment->payment_method.name == 'novapay'}
            {include file="scripts/variant_9.tpl"}
        {/if}
    </div>
</div>

<script type="text/javascript">
    var google_tag_params = {
        dynx_itemid: [{foreach $order->merchandises as $purchase}{$purchase->goods.goods_id},
        {/foreach}],
        dynx_pagetype: 'purchase',
        dynx_totalvalue: {$order.cost_with_discount}
    };
</script>

<script type="text/javascript">
    /* <![CDATA[ */
    var google_conversion_id = 986507359;
    var google_conversion_language = "en";
    var google_conversion_format = "3";
    var google_conversion_color = "ffffff";
    var google_conversion_label = "giGyCPH87AcQ39Cz1gM";
    var google_remarketing_only = false;
    /* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
    <div style="display:inline;">
        <img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/986507359/?label=giGyCPH87AcQ39Cz1gM&amp;guid=ON&amp;script=0"/>
    </div>
</noscript>

<script>
if(typeof fbq !== 'undefined') {
    fbq('track', 'Purchase', {
        content_ids: [
            {foreach $order->merchandises as $purchase}{$purchase->goods.goods_id},{/foreach}
        ],
        content_type: 'product',
        value: {$order.cost_with_discount},
        currency: 'USD'
    });
}
</script>

{if $user->email}
<script src="https://apis.google.com/js/platform.js?onload=renderOptIn" async defer></script>
<script>
    window.renderOptIn = function() {
        window.gapi.load('surveyoptin', function() {
            window.gapi.surveyoptin.render(
                {
                    // REQUIRED FIELDS
                    "merchant_id": 100854091,
                    "order_id": "{$order->getId()}",
                    "email": "{$user->email}",
                    "delivery_country": "UA",
                    "estimated_delivery_date": "{$estimated_delivery_date|date_format:'%Y-%m-%d'}",
                });
        });
    }
</script>
{/if}