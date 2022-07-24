{Users->getUser assign="user"}
{Users->getAgreements assign="agreements"}
{if $user.user_type == 'dealer' && count($agreements) > 0}
<style>
    #agreements_block {
        color: #000;
        background-color: #fff;
        border: 3px solid #efefef;
        padding: 30px;
        margin: 0 0 30px 0;
    }
    #agreements_block hr {
        width: 100%;
        height: 1px;
        border: 0;
        background: #ccc;
        margin: 30px 0;
    }
</style>
<div id="agreements_block">
    <h3><b>{'Внимание! Изменения на сайте! Пожалуйста, чтоб продолжить работу (оформить заказ), ознакомьтесь с информацией'|translate}:</b></h3>
    {foreach from=$agreements item=item name=agreements}
    <div style="font-size: 15px; margin-bottom: 8px;">
        <a href="{$menu.my->profile->agreements.href}?id={$item.id}">{$item.title}</a>&nbsp;&mdash;&nbsp;{'Ожидаем Ваше подтверждение, кнопка "Я ознакомился"'|translate}
    </div>
    {/foreach}
</div>
{/if}