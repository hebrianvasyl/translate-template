<div class="tabs-content-wrap">
    <div class="clearfix">
        <div class="similar-models-t-wrap">

            <div name="fixed_block_parent">
                <div class="hide-thead-block" id="hide-thead-wrapper" name="fixed-thead">
                    <table class="similar-models-t">
                        <tr class="similar-models-t-head">
                            <th class="similar-models-t-sort-cell" colspan="2">
                                <h2 class="detail-tab-i-title">{'Похожие модели'|translate} <span class="pp-characteristics-tab-product-name">{$record.sub_title_big|@mnemonics_convert nofilter}</span></h2>
                            </th>
                            {foreach from=$main_characteristics item='main_detail'}
                            <th class="similar-models-t-sort-cell similar-models-t-sort-cell-detail">
                                <span>{$main_detail}</span>
                            </th>
                            {/foreach}
                        </tr>
                    </table>
                </div>
            </div>

            <table class="similar-models-t similar-models-t-main" name="similar-models-table">
                <tr class="similar-models-t-head" style="opacity: 0;">
                    <th class="similar-models-t-sort-cell" colspan="2">
                        <h2 class="detail-tab-i-title">{'Похожие модели'|translate} <span class="pp-characteristics-tab-product-name">{$record.sub_title_big|@mnemonics_convert nofilter}</span></h2>
                    </th>
                    {foreach from=$main_characteristics item='main_detail'}
                    <th class="similar-models-t-sort-cell similar-models-t-sort-cell-detail">
                        <span>{$main_detail}</span>
                    </th>
                    {/foreach}
                </tr>

                {if !empty($record->sku)}
                    {$first_sku = $record->sku->getFirst()}
                    {$purchase_goods_id = $first_sku.id}
                {else}
                    {$purchase_goods_id = $record.id}
                {/if}

                <tr class="similar-models-t-l similar-models-t-l-main-good"
                    id="goods{$purchase_goods_id}"
                    data-goods-id="{$record.id}"
                >
                    <td class="similar-models-t-l-i similar-models-t-l-i-image">
                        <div class="similar-image-wrap">
                            {$left_top_tags = $record->getCatalogTags('left_top_side')}
                            {if count($left_top_tags) > 0}
                            <div class="additional-tags left-top">
                                {foreach from=$left_top_tags item=tag}
                                <div class="tag tag-{$tag.class}">
                                    <img class="additional-tags-img" src="{$tag.image}">
                                    <span>{$tag.title}</span>
                                </div>
                                {/foreach}
                            </div>
                            {/if}

                            <a  href="{$record.external_href}"
                                data-link-id="goods-link-{$record.id}"
                            >
                                <img alt="{$record.title|escape:'quotes'}"
                                        title="{$record.title|escape:'quotes'}"
                                        src="{$record->attachments->images.medium.url}"
                                        width="{$record->attachments->images.medium.width}"
                                        height="{$record->attachments->images.medium.height}"
                                />
                            </a>
                        </div>
                    </td>
                    <td class="similar-models-t-l-i similar-models-t-l-i-main">
                        <div class="similar-main-info">
                            <div class="g-l-i-content-i-wrap g-l-i-status {$record.sell_status}">{$record->sell_status->value.title}</div>

                            <ul class="g-compare-l">
                                <li class="g-compare-l-i float-lt" name="wishlists_details"></li>
                                <li class="g-compare-l-i float-lt" name="compare_details"></li>
                            </ul>

                            <a
                                href="{$record.external_href}"
                                data-link-id="goods-link-{$record.id}"
                            >
                                <div class="g-details-title">
                                    {if $record.sub_title_big}
                                    {$record.sub_title_big}
                                    {/if}
                                </div>
                                <div class="g-details-sub-title-small">
                                    {if $record.sub_title_small}
                                    {$record.sub_title_small}
                                    {else}
                                    {$record.title}
                                    {/if}
                                </div>
                            </a>

                            {if $record->isATP()}
                            <div class="price-block">
                                <span>{'Цена'|translate}:</span>
                                {if !empty($record.old_price) && ($record.old_price > $record.price)}
                                <span class="old-price">{$record->old_price nofilter}</span>
                                {/if}
                                <span class="price" name="UAH">{$record->price nofilter}</span>
                            </div>

                            <div class="clearfix">
                                <div
                                        class="submit-btn accsesories-btn"
                                        name="buy_catalog"
                                        gtm-data='{ "eventLabel":"{$record.id}"}'
                                ></div>
                                <div class="hidden" name="price">{$record->price nofilter}</div>

                                {if $record->parent.hide_oneclick_catalog != "1" and $record->isATP()}
                                <div class="btn-one-click-order">
                                    <input type="hidden" name="oneclick_product_id" value="{$purchase_goods_id}">
                                    <a href="#" id="open-one-click-order-{$purchase_goods_id}">{'Заказать<br>в 1 клик'|translate}</a>
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
                                                                    message = '{'Произошла ошибка, свяжитесь с нами по телефону'|translate}';
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
                            {/if}

                            <script type="text/javascript">
                                var data = {
                                    "actionField": { "list": "Tab_Similar"},
                                    "products": [{
                                        "name": "{$record.title}",
                                        "id": "{$record.id}",
                                        "price": "{$record->price->getValueByDecimals(0, ".", "")}",
                                        "brand": "{$record->producer}",
                                        "category": "{$record->parent}",
                                        "position": "1"
                                    }]
                                };
                                new GTMEvents([
                                    {
                                        selector: '[data-goods-id="{$record.id}"]',
                                        event: 'show',
                                        gtm_data: {
                                            'event': "gtm-ee-event",
                                            'gtm-ee-event-category': 'Enhanced Ecommerce',
                                            'gtm-ee-event-action': 'Product Impressions',
                                            'gtm-ee-event-non-interaction': 'True',
                                            'ecommerce': {
                                                'impressions': data
                                            }
                                        }
                                    },
                                    { //переход на вариант товара
                                        selector: 'a[data-link-id="goods-link-{$record.id}"]',
                                        event: 'click',
                                        gtm_data: {
                                            'event': "gtm-ee-event",
                                            'gtm-ee-event-category': 'Enhanced Ecommerce',
                                            'gtm-ee-event-action': 'Product Clicks',
                                            'gtm-ee-event-non-interaction': 'False',
                                            'ecommerce': {
                                                'click': data
                                            }
                                        }
                                    }
                                ]);

                                $(document).getElement('[data-goods-id="{$record.id}"]').fireEvent('show');
                            </script>

                            <script type="text/javascript">GoodsCatalog.addEntity('Goods', { 'goods_id': {$purchase_goods_id}, 'added_to_cart_price': {$record->getPrice()}, 'content_record_id': {$record['id']} });</script>
                        </div>
                    </td>
                    {foreach from=$main_characteristics key='main_detail_name' item='main_detail'}
                    <td class="similar-models-t-l-i similar-models-t-l-i-detail">
                        {assign var='detail_value' value=$record->$main_detail_name|strval}
                        {if !empty($detail_value)}
                        {$detail_value|replace:'/*br*/':'<br>'|escape:'quotes' nofilter}
                        {else}
                        —
                        {/if}
                    </td>
                    {/foreach}
                </tr>

                {foreach from=$similar_models item=similar_model name=similars}

                {if !empty($similar_model->sku)}
                    {$first_sku = $similar_model->sku->getFirst()}
                    {$purchase_goods_id = $first_sku.id}
                {else}
                    {$purchase_goods_id = $similar_model.id}
                {/if}

                <tr class="similar-models-t-l"
                    id="goods{$purchase_goods_id}"
                    data-goods-id="{$similar_model.id}"
                >
                    <td class="similar-models-t-l-i similar-models-t-l-i-image">
                        <div class="similar-image-wrap">
                            {$left_top_tags = $similar_model->getCatalogTags('left_top_side')}
                            {if count($left_top_tags) > 0}
                            <div class="additional-tags left-top">
                                {foreach from=$left_top_tags item=tag}
                                <div class="tag tag-{$tag.class}">
                                    <img class="additional-tags-img" src="{$tag.image}">
                                    <span>{$tag.title}</span>
                                </div>
                                {/foreach}
                            </div>
                            {/if}

                            <a
                                href="{$similar_model.external_href}"
                                data-link-id="goods-link-{$similar_model.id}"
                            >
                                <img alt="{$similar_model.title|escape:'quotes'}"
                                     title="{$similar_model.title|escape:'quotes'}"
                                     src="{$similar_model->attachments->images.medium.url}"
                                     width="{$similar_model->attachments->images.medium.width}"
                                     height="{$similar_model->attachments->images.medium.height}"
                                />
                            </a>
                        </div>
                    </td>
                    <td class="similar-models-t-l-i similar-models-t-l-i-main">
                        <div class="similar-main-info">
                            <div class="g-l-i-content-i-wrap g-l-i-status {$similar_model.sell_status}">{$similar_model->sell_status->value.title}</div>

                            <ul class="g-compare-l">
                                <li class="g-compare-l-i float-lt" name="wishlists_details"></li>
                                <li class="g-compare-l-i float-lt" name="compare_details"></li>
                            </ul>

                            <a
                                href="{$similar_model.external_href}"
                                data-link-id="goods-link-{$similar_model.id}"
                            >
                                <div class="g-details-title">
                                    {if $similar_model.sub_title_big}
                                    {$similar_model.sub_title_big}
                                    {/if}
                                </div>
                                <div class="g-details-sub-title-small">
                                    {if $similar_model.sub_title_small}
                                    {$similar_model.sub_title_small}
                                    {else}
                                    {$similar_model.title}
                                    {/if}
                                </div>
                            </a>

                            {if $similar_model->isATP()}
                            <div class="price-block">
                                <span>Цена:</span>
                                {if !empty($similar_model.old_price) && ($similar_model.old_price > $similar_model.price)}
                                <span class="old-price">{$similar_model->old_price nofilter}</span>
                                {/if}
                                <span class="price" name="UAH">{$similar_model->price nofilter}</span>
                            </div>

                            <div class="clearfix">
                                <div
                                        class="submit-btn accsesories-btn"
                                        name="buy_catalog"
                                        gtm-data='{ "eventLabel":"{$similar_model.id}"}'
                                ></div>
                                <div class="hidden" name="price">{$similar_model->price nofilter}</div>

                                {if $similar_model->parent.hide_oneclick_catalog != "1" and $similar_model->isATP()}
                                <div class="btn-one-click-order">
                                    <input type="hidden" name="oneclick_product_id" value="{$purchase_goods_id}">
                                    <a href="#" id="open-one-click-order-{$purchase_goods_id}">{'Заказать<br>в 1 клик'|translate}</a>
                                </div>
                                <script>
                                    var User = App.get('User');

                                    var elem_{$purchase_goods_id} = $('open-one-click-order-{$purchase_goods_id}'),
                                        oneclick_popup_{$purchase_goods_id};

                                    if (elem_{$purchase_goods_id}) {

                                        oneclick_popup_{$purchase_goods_id} = new Popup_class('{template_js_fetch file="goods/details/_jst/popup-small.jst"}');

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
                                                                    message = '{'Произошла ошибка, свяжитесь с нами по телефону'|translate}';
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
                            {/if}

                            <script type="text/javascript">
                                var data = {
                                    "actionField": { "list": "Tab_Similar"},
                                    "products": [{
                                        "name": "{$similar_model.title}",
                                        "id": "{$similar_model.id}",
                                        "price": "{$similar_model->price->getValueByDecimals(0, ".", "")}",
                                        "brand": "{$similar_model->producer}",
                                        "category": "{$similar_model->parent}",
                                        "position": "{$smarty.foreach.similars.index + 2}"
                                    }]
                                };
                                new GTMEvents([
                                    {
                                        selector: '[data-goods-id="{$similar_model.id}"]',
                                        event: 'show',
                                        gtm_data: {
                                            'event': "gtm-ee-event",
                                            'gtm-ee-event-category': 'Enhanced Ecommerce',
                                            'gtm-ee-event-action': 'Product Impressions',
                                            'gtm-ee-event-non-interaction': 'True',
                                            'ecommerce': {
                                                'impressions': data
                                            }
                                        }
                                    },
                                    { //переход на вариант товара
                                        selector: 'a[data-link-id="goods-link-{$similar_model.id}"]',
                                        event: 'click',
                                        gtm_data: {
                                            'event': "gtm-ee-event",
                                            'gtm-ee-event-category': 'Enhanced Ecommerce',
                                            'gtm-ee-event-action': 'Product Clicks',
                                            'gtm-ee-event-non-interaction': 'False',
                                            'ecommerce': {
                                                'click': data
                                            }
                                        }
                                    }
                                ]);

                                $(document).getElement('[data-goods-id="{$similar_model.id}"]').fireEvent('show');
                            </script>

                            <script type="text/javascript">GoodsCatalog.addEntity('Goods', { 'goods_id': {$purchase_goods_id}, 'added_to_cart_price': {$similar_model->getPrice()}, 'content_record_id': {$similar_model['id']} });</script>
                        </div>
                    </td>
                    {foreach from=$main_characteristics key='main_detail_name' item='main_detail'}
                    <td class="similar-models-t-l-i similar-models-t-l-i-detail">
                        {assign var='detail_value' value=$similar_model->$main_detail_name|strval}
                        {if !empty($detail_value)}
                            {$detail_value|replace:'/*br*/':'<br>'|escape:'quotes' nofilter}
                        {else}
                            —
                        {/if}
                    </td>
                    {/foreach}
                </tr>
                {/foreach}
            </table>

        </div>
    </div>

</div>


<script>

    var table_size = $(document.body).getElement('.similar-models-t-main').getComputedSize();
    $('hide-thead-wrapper').setStyle('width', table_size.width);

    $$('.similar-models-t-main .similar-models-t-head th').each(function(element, index) {
        var size = element.getComputedSize();
        $$('.hide-thead-block .similar-models-t .similar-models-t-head th:nth-child('+(index + 1)+')').setStyle('width', size.width);
    });

    var FixedBlock = new FixedBlock_class({
        fixed_block_name: 'fixed-thead',
        fixed_class_name: 'fixed',
        to_top_link_name: null
    }).init();
</script>

{*include file="details/similar-models-table.tpl" active_tab="visible"*}