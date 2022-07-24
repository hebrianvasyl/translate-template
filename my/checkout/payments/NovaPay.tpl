{NovaPay->getPayFormFields invoice=$invoice assign="data"}
<div class="pay-l-i valigned-bottom">
    <span class="btn-link btn-link-green">
        <a href="{$data.url}" class="btn-link-i" target="_blank">
            {'Оплатить заказ'|translate}
        </a>
    </span>
</div>