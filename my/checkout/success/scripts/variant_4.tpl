{* Самовывоз из Ужгорода, оплата наличными на складе *}
{$checkout_settings = $settings->getProperty("Orders.Checkout")}
{include file="string:{$checkout_settings.scripts_variant_4}" inline}