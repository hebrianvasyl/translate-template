<div class="clearfix {if $record->parent.hide_oneclick_catalog != "1" and ($record->sell_status.value == "available" or $record->sell_status.value == "call" or $record->sell_status.value == "limited" or $record->sell_status.value == "customized")}with_one_click{/if}">
    {if $record.type !== 'configurable'}
        {include file="goods/catalog/goods-tile-price-block.tpl"}
    {else}
        {$record_prices = $record -> sku -> getATPPricesForGroup()}
        {if (!isset($has_atp) or $has_atp) and !empty($record_prices.min)}
            <div class="g-l-i-content-i-wrap sku-content available">
                {if $record_prices.min->getValue()}
                <div class="g-l-i-price">{if empty($record_prices.is_same)} от {/if}{$record_prices.min nofilter}</div>
                {/if}
            </div>
        {else}
            <div class="g-l-i-content-i-wrap sku-content unavailable">
                {*если у товара нет atp-артикулов, то выводим "нет в наличии"*}
                <div class="g-l-i-status">{$record->sell_status.values.unavailable.title}</div>
            </div>
        {/if}
    {/if}

    {if $record->parent.hide_oneclick_catalog != "1" and ($record->sell_status.value == "available" or $record->sell_status.value == "limited" or $record->sell_status.value == "customized")}
    <div class="btn-one-click-order">
        <input type="hidden" name="oneclick_product_id" value="{$purchase_goods_id}">
        <a href="#" id="open-one-click-order-{$purchase_goods_id}">Заказать<br>в 1 клик</a>
    </div>
    <script>
        var User = App.get('User');

        var elem_{$purchase_goods_id} = $('open-one-click-order-{$purchase_goods_id}'),
            oneclick_popup_{$purchase_goods_id};

        if (elem_{$purchase_goods_id}) {

            oneclick_popup_{$purchase_goods_id} = new Popup_class('{template_js_fetch file="goods/details/_jst/popup-small-overflow.jst"}');

            oneclick_popup_{$purchase_goods_id}.setContent(
                '{template_js_fetch file="goods/catalog/_jst/popup-one-click.jst"}'
            );

            elem_{$purchase_goods_id}.addEvent(
                'click', function(e){
                    e.stop();
                    oneclick_popup_{$purchase_goods_id}.open();

                    var oneclick_name = oneclick_popup_{$purchase_goods_id}.getElement('.input_oneclick_name');
                    var oneclick_phone = oneclick_popup_{$purchase_goods_id}.getElement('.input_oneclick_phone');

                    if(oneclick_phone.hasClass('mask_inited') == false) {
                        oneclick_phone.addClass('mask_inited');

                        var contact = new TextMaskedInputElement_class({});

                        contact.options.mask = '+xx (xxx) xxx-xx-xx';
                        contact.options.forcePrefix = '380';
                        contact.options.iPlaceholderChar = '';
                        contact.options.mPlaceholderChar = '';
                        contact.options.name = 'oneclick_phone';

                        if(User.auth == 1) {
                            var phone = '';
                            for (phone_id in User.S.phones) break;

                            contact.options.default_value = User.S.phones[phone_id].title;
                        }

                        contact.init(oneclick_phone);
                        contact.setDefaultValue();

                        oneclick_name.focus();
                    }

                    oneclick_popup_{$purchase_goods_id}.getElement('.doOneclickOrder').addEvent('click', function(){

                        var record_id = {$purchase_goods_id},
                            phone = $$('.input_oneclick_phone')[0].get('value'),
                            name = oneclick_name.get('value');

                        oneclick_popup_{$purchase_goods_id}.getElement('.oneclick_error').set('html', '');
                        oneclick_popup_{$purchase_goods_id}.getElement('.oneclick-block .lock-wrap').set('html', '<div class="lock-inner"><div class="spin"></div></div>');
                        oneclick_popup_{$purchase_goods_id}.getElement('.oneclick-block .lock-wrap').show();

                        oneclick_popup_{$purchase_goods_id}.getElement('.doOneclickOrder').set('disabled', true);

                        new Request({
                            url: '/cgi-bin/form.php',
                            data: {
                                record_id: [record_id],
                                name: [name],
                                phone: [phone]
                            },
                            headers: {
                                ajaxAction: '{$menu.my.href}cart/#doOneclickOrder'
                            },
                            onSuccess: function (resp) {

                                var data = JSON.parse(resp);

                                if(data.success == true) {
                                    window.location.href = '{$menu.my.href}checkout/success/';
                                } else {
                                    oneclick_popup_{$purchase_goods_id}.getElement('.oneclick-block .lock-wrap').set('html', '');
                                    oneclick_popup_{$purchase_goods_id}.getElement('.oneclick-block .lock-wrap').hide();

                                    oneclick_popup_{$purchase_goods_id}.getElement('.doOneclickOrder').set('disabled', false);

                                    var message = '';
                                    if(data.message) {
                                        message = data.message;
                                    } else {
                                        message = 'Произошла ошибка, свяжитесь с нами по телефону';
                                    }
                                    oneclick_popup_{$purchase_goods_id}.getElement('.oneclick_error').set('html', '<div class="code"><span class="message-content">'+message+'</span></div>');
                                }

                            }.bind(this)

                        }).send();
                    });
                }
            );

        }

    </script>
    {/if}
</div>

{if !empty($show_active_catalog_buttons) and empty($record.new_record)}
	<ul class="g-compare-l clearfix">
		<li class="g-compare-l-i" name="compare_catalog"></li>
		<li class="g-compare-l-i" name="wishlists"></li>
	</ul>
{/if}

{if !$record -> sku}
	<script type="text/javascript">
		GoodsCatalog.addEntity('Goods', { 'goods_id': {$purchase_goods_id}{if $record->getPrice()},  'added_to_cart_price': {$record->getPrice()}{/if}, 'content_record_id': {$record.id} });
	</script>
{else}
	{$record_prices = $record -> sku -> getATPPricesForGroup()}
	<script type="text/javascript">
		var catalog_entity = GoodsCatalog.addEntity(
				'Sku',
				{
					'goods_id': {$purchase_goods_id}
					{if !empty($record_prices.min)}, 'added_to_cart_price': {$record_prices.min->getValue()} {/if}
					, 'content_record_id': {$record.id}
				}
		);
		{if $record.type == 'configurable'}
			catalog_entity.getDataFromSource().goods_id = null;
		{/if}
	</script>
{/if}