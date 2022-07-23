{* Оплата на карту ПриватБанка, доставка с помощью Новой Почты *}

{assign var='delivery' value=$order->deliveries->getLast()}

{if $delivery->method.name == 'nova-poshta'}
{assign var='delivery_name' value='Новой Почты'}
{assign var='delivery_link' value='https://novaposhta.ua/'}
{assign var='delivery_img' value='checkout-delivery-np'}
{else}
{assign var='delivery_name' value=''}
{assign var='delivery_link' value=''}
{assign var='delivery_img' value=''}
{/if}

{$checkout_settings = $settings->getProperty("Orders.Checkout")}
{include file="string:{$checkout_settings.scripts_variant_2}" inline}