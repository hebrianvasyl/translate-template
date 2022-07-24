{include file='goods/purchase_goods_id.tpl' scope=parent}

{* флаг, уцененный ли это товар *}
{$is_mark_down = !empty($menu.active->stock_record)}

{$record_with_content = $record}

<div class="goods-details__tab-all">
    <div>
        <div>
            <div data-role="image-previews" id="image-previews-wrap"></div>
        </div>

        <script>
            var ip = new ImagePreviews({
                zoom_view: 1
            });
            ip.setImages({Goods->getGoodsImagesJSON record=$record not_show_defaults=1});
            ip.setTitle('{$record.title}');
            ip.onDOMReady();
        </script>


        <div class="goods-details__consultation">
            <a href="#">
                {'Онлайн консультант'|translate}
            </a>
            <a href="#">
                {'Условия гарантии'|translate}
            </a>
            <a href="#">
                {'Быстрый заказ'|translate}
            </a>
        </div>
    </div>

    <div class="goods-details__main">
        <div class="goods-details__main_rating">
            <div>
                {include file="goods/rating.tpl" record=$record_with_content}

                <script type="text/javascript">
                    var comments_link = $("goods{$purchase_goods_id}").getElement("a[name=switch_to_comments]");

                    if (comments_link) {
                        comments_link.addEvent('click', function (e) {
                            var event = new DOMEvent(e);
                            event.stop();
                            goodTabs.switchTab($$("li[name=comments]")[0]);
                            new Fx.Scroll(window,{ duration:300 }).toElement($('details-tabs-menu'));
                        });
                    }
                </script>
            </div>

            {if !$is_mark_down}
            <div>
                <ul>
                    <li name="compare_details"></li>
                    <li name="wishlists_details"></li>
                </ul>
            </div>
            {/if}
        </div>

        <div>
            {if $groups}
            <div id="configurable_details">
                {foreach $groups as $group_id => $group}
                <section class="variants">
                    <ul class="variants-l">
                        <li class="variants-l-i variants-link-title disabled">{$group.title}:</li>

                        {foreach $group.records as $group_good}
                        <li
                            class="variants-l-i js-variants-l-i float-lt {if $group_good.active}active{/if}"
                            data-value="{$group_good.title}"
                            data-sell-status="{$group_good.sell_status}"
                            data-price="{$group_good.price}"
                            data-image="{$group_good.image}"
                            data-details="{$group_good.main_details}"
                        >
                            {if $group_good.active}
                            <div class="variants-link">
                                <span class="active">{$group_good.$group_id}</span>
                            </div>
                            {else}
                            <a href="{$group_good.href}" class="variants-link novisited">
                                <span>{$group_good.$group_id}</span>
                            </a>
                            {/if}
                        </li>
                        {/foreach}
                    </ul>

                    <div class="all-variants-link-wrap">
                        <a href="#" id="groups_{$group.id}_popup" class="novisited all-variants-link underline">{'Сравнить все варианты'|translate}</a>
                    </div>

                    {*groups popup*}
                    <script>

                        var elem_{$group.id} = $('groups_{$group.id}_popup'),
                            groups_{$group.id}_popup;

                        if (elem_{$group.id}) {

                            groups_{$group.id}_popup = new Popup_class('{template_js_fetch file="_jst/popup-auto.jst"}');

                            groups_{$group.id}_popup.setContent(
                                '{template_js_fetch file="goods/details/_jst/popup-groups.jst"}'
                            );

                            elem_{$group.id}.addEvent(
                                'click', function(e){
                                    e.stop();
                                    groups_{$group.id}_popup.open()
                                }
                            );

                        }

                    </script>
                    {*end variants popup*}
                </section>
                {/foreach}
            </div>
            {/if}
        </div>

        <hr>

        <div>
            <div name="buy_details"></div>

            {$analog = $record->getSuggestRecord('kupit-analog')}
            {if $analog && $analog.sell_status == 'available' && $analog.price > 0}
            <div>
                <a href="{$analog.external_href}" id="buy-analog-btn" class="additional-btn">{'Купить аналог<br>за'|translate} {$analog->price nofilter}</a>
            </div>
            {elseif $record->parent.hide_oneclick_details != "1" and ($record->sell_status.value == "available" or $record->sell_status.value == "call" or $record->sell_status.value == "limited")}
            <div>
                <input type="hidden" name="oneclick_product_id" value="{$purchase_goods_id}">
                <a href="#" id="open-one-click-order" class="additional-btn">{'Заказать в 1 клик'|translate}</a>
            </div>
            {/if}
        </div>

        {if $record.defect_description}
        <div class="reason">
            <p class="reason-title light-red">
                {'Причина уценки'|translate}: <span class="reason-title-text">{$record.defect_description}</span>
            </p>
            <span class="reason-title-text">
                <span class="light-red">*</span>
                {'Уцененный товар возврату не подлежит'|translate}
            </span>
        </div>
        {/if}

        {if $is_mark_down}
        <div class="pp-new-good">
            <section class="goods-l horizontal small">
                <h4 class="green">{'Есть новый, без уценки'|translate}</h4>
                {include file='details/sidebar-item-tile.tpl' record=$record_with_content}
            </section>
        </div>
        {/if}

        {Goods->getRelatedStockGoods goods_record=$record assign='stock_goods_records'}

        {if count($stock_goods_records)}
        <section class="goods-l horizontal small g-stock-l clear">
            <h4 class="red">{'Есть такой же товар с уценкой'|translate}</h4>
            {foreach from=$stock_goods_records item='stock_goods_record'}
            {include file='details/sidebar-item-tile.tpl' record=$stock_goods_record}
            {/foreach}
        </section>
        {/if}

        <hr>

        {$main_details = $record_with_content->getMainDetails()}

        <div id="main-details">
            {$main_details nofilter}
        </div>

        <div>
            <div>
                <span>Доставка в <a href="#">Киев</a></span>
                <a href="#">{'Подробности о доставке'|translate}</a>
            </div>

            <table>
                <thead>
                <tr>
                    <th>
                        <span>{'Отправим сегодня'|translate}</span>
                    </th>
                    <th>
                        <span>{'Наложенным'|translate}</span>
                    </th>
                    <th>
                        <span>{'Передплата'|translate}</span>
                    </th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        {'Самовывоз из Новой почты'|translate}
                    </td>
                    <td>
                        25 грн
                    </td>
                    <td>
                        10 грн
                    </td>
                </tr>
                <tr>
                    <td>
                        {'Курьером НП по вашему адресу'|translate}
                    </td>
                    <td>
                        45 грн
                    </td>
                    <td>
                        30 грн
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div>
    <div name="scroll_to_description"></div>

    {if $record.sell_status=="archive" and count($record->getGoods()->relations->like->getActiveRecords()) > 0}
    {include file="details/recommend.tpl"}
    {/if}

    {assign var="goods_description" value=$record->getGoodsDescription()}

    {if !empty($goods_description)}
    {if $record.show_characteristics == '1'}
    {Controller->getChildTabControllerByName name='characteristics' assign='characteristics_controller'}

    {assign var="characteristics" value=$characteristics_controller->getCharacteristicsByRecord($record_with_content)}

    {if count($characteristics)}

    <div class="tabs-content-title">{'Технические характеристики'|translate} <span class="pp-characteristics-tab-product-name">{$record_with_content.title|@mnemonics_convert nofilter}</span></div>

    <div class="clearfix">
        <div class="characteristics-wrap">
            {foreach from=$characteristics item="fieldset" name="sections"}
            <table class="characteristics-t">
                {if $fieldset.section !== NULL}
                <caption class="characteristics-t-title">{$fieldset.section.title}</caption>
                {elseif ($characteristics.0.section !== NULL)}
                <caption class="characteristics-t-title">{'Другие характеристики'|translate}</caption>
                {/if}

                {foreach from=$fieldset.details item="detail"}
                <tr>
                    <td class="characteristics-t-subtitle">
                                                    <span class="characteristics-t-subtitle-text info-title"
                                                            gtm-data='{ "eventLabel":"characteristic"}'
                                                    >
                                                        {if !empty($detail.filter_title)}
                                                        {$detail.filter_title}:
                                                        {else}
                                                        {$detail.title}:
                                                        {/if}
                                                        {if !empty($detail.description)}
                                                            {include file="goods/catalog/glossary/popup_info.tpl" field=$detail glossary_href="{$record_with_content->parent->menu_node.href}glossary/"}
                                                        {/if}
                                                    </span>
                    </td>
                    <td class="characteristics-t-value">
                        {if $detail.type == 'Suggest' and !empty($detail.record_ref)}
                        <a href="{$detail->ref_record.external_href}" target="_blank">
                            {$detail->ref_record.sub_title_big}
                        </a>
                        {else}
                        {$detail|replace:'/*br*/':'<br>'|escape:'quotes' nofilter}
                        {/if}
                    </td>
                </tr>
                {/foreach}
            </table>
            {if $fieldset.section.title == "{'Комплектация'|translate}"}
            {foreach from=$fieldset.details item="detail"}
            {if $detail.type == 'Suggest' and !empty($detail.record_ref)}
            {$characteristicsShownInParent = $detail->ref_record->getCharacteristicsShownInParent()}
            {if count($characteristicsShownInParent)}
            <table class="characteristics-t">
                <caption class="characteristics-t-title">
                    {if !empty($detail.filter_title)}
                    {$detail.filter_title}
                    {else}
                    {$detail.title}
                    {/if}
                </caption>
                {foreach from=$characteristicsShownInParent item="detail"}
                <tr>
                    <td class="characteristics-t-subtitle">
                                                    <span class="characteristics-t-subtitle-text info-title"
                                                            gtm-data='{ "eventLabel":"characteristic"}'
                                                    >
                                                        {if !empty($detail.filter_title)}
                                                        {$detail.filter_title}:
                                                        {else}
                                                        {$detail.title}:
                                                        {/if}
                                                        {if !empty($detail.description)}
                                                            {include file="goods/catalog/glossary/popup_info.tpl" field=$detail glossary_href="{$record->parent->menu_node.href}glossary/"}
                                                        {/if}
                                                    </span>
                    </td>
                    <td class="characteristics-t-value">
                        {if $detail.type == 'Suggest' and !empty($detail.record_ref)}
                        <a href="{$detail->ref_record.external_href}" target="_blank">
                            {$detail->ref_record.sub_title_big}
                        </a>
                        {else}
                        {$detail|replace:'/*br*/':'<br>'|escape:'quotes' nofilter}
                        {/if}
                    </td>
                </tr>
                {/foreach}
            </table>
            {/if}
            {/if}
            {/foreach}
            {/if}
            {/foreach}
        </div>
    </div>
    <br><br><br><br>
    {/if}
    {/if}

    {if $record.description_noindex == '1'}
    <noindex>
        {/if}
        <div id="product-description">
            {if $record.show_characteristics != '1'}
            <h4>{'Описание к товару'|translate} <span class="pp-characteristics-tab-product-name">{$record_with_content.title|@mnemonics_convert nofilter}</span></h4>
            {/if}

            {$goods_description nofilter}
            {*
            {if !empty($record.description)}
            <div class="clearfix">

            </div>
            {/if}
            {if count($record_with_content->relations->descriptions->getActiveRecords())}
            <div class="clearfix">
                {foreach from=$record_with_content->getGoodsRelations('descriptions') item=item name=block}
                {assign var=block value=$item}
                {if !empty($block.template)}
                {$block->getDescription($record) nofilter}
                {/if}
                {/foreach}
            </div>
            {/if}
            *}
        </div>
        {if $record.description_noindex == '1'}
    </noindex>
    {/if}
    {else}
    {Controller->getChildTabControllerByName name='characteristics' assign='characteristics_controller'}

    {assign var="characteristics" value=$characteristics_controller->getCharacteristicsByRecord($record_with_content)}

    {if count($characteristics)}

    <div class="tabs-content-title">Технические характеристики <span class="pp-characteristics-tab-product-name">{$record_with_content.title|@mnemonics_convert nofilter}</span></div>

    <div class="clearfix">
        <div class="characteristics-wrap">
            {foreach from=$characteristics item="fieldset" name="sections"}
            <table class="characteristics-t">
                {if $fieldset.section !== NULL}
                <caption class="characteristics-t-title">{$fieldset.section.title}</caption>
                {elseif ($characteristics.0.section !== NULL)}
                <caption class="characteristics-t-title">{'Другие характеристики'|translate}</caption>
                {/if}

                {foreach from=$fieldset.details item="detail"}
                <tr>
                    <td class="characteristics-t-subtitle">
											<span class="characteristics-t-subtitle-text info-title"
                                                    gtm-data='{ "eventLabel":"characteristic"}'
                                            >
												{if !empty($detail.filter_title)}
                                                {$detail.filter_title}:
                                                {else}
                                                {$detail.title}:
                                                {/if}
												{if !empty($detail.description)}
													{include file="goods/catalog/glossary/popup_info.tpl" field=$detail glossary_href="{$record_with_content->parent->menu_node.href}glossary/"}
												{/if}
											</span>
                    </td>
                    <td class="characteristics-t-value">
                        {if $detail.type == 'Suggest' and !empty($detail.record_ref)}
                        <a href="{$detail->ref_record.external_href}" target="_blank">
                            {$detail->ref_record.sub_title_big}
                        </a>
                        {else}
                        {$detail|replace:'/*br*/':'<br>'|escape:'quotes' nofilter}
                        {/if}
                    </td>
                </tr>
                {/foreach}
            </table>
            {if $fieldset.section.title == "{'Комплектация'|translate}"}
            {foreach from=$fieldset.details item="detail"}
            {if $detail.type == 'Suggest' and !empty($detail.record_ref)}
            {$characteristicsShownInParent = $detail->ref_record->getCharacteristicsShownInParent()}
            {if count($characteristicsShownInParent)}
            <table class="characteristics-t">
                <caption class="characteristics-t-title">
                    {if !empty($detail.filter_title)}
                    {$detail.filter_title}
                    {else}
                    {$detail.title}
                    {/if}
                </caption>
                {foreach from=$characteristicsShownInParent item="detail"}
                <tr>
                    <td class="characteristics-t-subtitle">
                                                                <span class="characteristics-t-subtitle-text info-title"
                                                                        gtm-data='{ "eventLabel":"characteristic"}'
                                                                >
                                                                    {if !empty($detail.filter_title)}
                                                                    {$detail.filter_title}:
                                                                    {else}
                                                                    {$detail.title}:
                                                                    {/if}
                                                                    {if !empty($detail.description)}
                                                                        {include file="goods/catalog/glossary/popup_info.tpl" field=$detail glossary_href="{$record->parent->menu_node.href}glossary/"}
                                                                    {/if}
                                                                </span>
                    </td>
                    <td class="characteristics-t-value">
                        {if $detail.type == 'Suggest' and !empty($detail.record_ref)}
                        <a href="{$detail->ref_record.external_href}" target="_blank">
                            {$detail->ref_record.sub_title_big}
                        </a>
                        {else}
                        {$detail|replace:'/*br*/':'<br>'|escape:'quotes' nofilter}
                        {/if}
                    </td>
                </tr>
                {/foreach}
            </table>
            {/if}
            {/if}
            {/foreach}
            {/if}
            {/foreach}
        </div>
    </div>
    {/if}
    {/if}
</div>

<script>
    var User = App.get('User');

    var elem = $('open-one-click-order'),
        oneclick_popup;

    if (elem) {

        oneclick_popup = new Popup_class('{template_js_fetch file="goods/details/_jst/popup-small-overflow.jst"}');

        oneclick_popup.setContent(
            '{template_js_fetch file="goods/details/_jst/popup-one-click.jst"}'
        );

        oneclick_popup.overlayON();

        elem.addEvent(
            'click', function(e){
                e.stop();
                oneclick_popup.open();

                var oneclick_name = document.id('input_oneclick_name');
                var oneclick_phone = document.id('input_oneclick_phone');

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
                    //                                                    contact._getView().focus();
                    oneclick_name.focus();
                }

                document.id('doOneclickOrder').addEvent('click', function(){
                    var record_id = $$('[name="oneclick_product_id"]').get('value'),
                        phone = $$('[name="oneclick_phone"]').get('value'),
                        name = $$('[name="oneclick_name"]').get('value');

                    $$('#oneclick_error').set('html', '');
                    $$('.oneclick-block .lock-wrap').set('html', '<div class="lock-inner"><div class="spin"></div></div>');
                    $$('.oneclick-block .lock-wrap').show();

                    $('doOneclickOrder').set('disabled', true);

                    new Request({
                        url: '/cgi-bin/form.php',
                        data: {
                            record_id: record_id,
                            name: name,
                            phone: phone
                        },
                        headers: {
                            ajaxAction: '{$menu.my.href}cart/#doOneclickOrder'
                        },
                        onSuccess: function (resp) {

                            var data = JSON.parse(resp);

                            if(data.success == true) {
                                goog_report_conversion();
                                window.location.href = '{$menu.my.href}checkout/success/';
                            } else {
                                $$('.oneclick-block .lock-wrap').set('html', '');
                                $$('.oneclick-block .lock-wrap').hide();

                                $('doOneclickOrder').set('disabled', false);

                                var message = '';
                                if(data.message) {
                                    message = data.message;
                                } else {
                                    message = '{'Произошла ошибка, свяжитесь с нами по телефону'|translate}';
                                }
                                $$('#oneclick_error').set('html', '<div class="code"><span class="message-content">'+message+'</span></div>');
                            }

                        }.bind(this)

                    }).send();
                });

                return false;
            }
        );

    }
</script>

<script type="text/javascript">
    var goods_id            = '{$purchase_goods_id}';
    var sell_status         = '{$record->sell_status.value}';
    var sell_status_title   = '{$record->sell_status->value.title}';
    var price_uah           = '{$record->price nofilter}';
    var old_price           = '{if $record.type !== "configurable"}{$record->old_price nofilter}{/if}';
    var price_usd           = '{$record->price->usd nofilter}';
    var phone_code          = '{$settings.Contacts.phone|@phone:code}';
    var phone_num           = '';
    var sell_code           = '{$record->ext_id}';
    var configurable        = '{intval($record.type === "configurable")}';

    var catalog_item_data = { goods_id: {$purchase_goods_id},{if $record->getPrice()} added_to_cart_price: {$record->getPrice()},{/if} content_record_id: {$record.id} },
        item_type = 'Goods';

    {if !empty($record->sku)}
    item_type = 'Sku';
    {/if}

    var catalog_item = GoodsCatalog.addEntity(item_type, catalog_item_data);
</script>

<script type="text/javascript">
    var LightBox = new ProjectLightBox_class('{template_js_fetch file="goods/details/_jst/lightbox.jst"}');

    {if !$record->attachments->images.original->isDefault()}
    LightBox.setData(
        {Goods->getGoodsImagesJSON record=$record not_show_defaults=1},
        '{$record.title}',
        [],
        {Videos->newGetVideosByRecordsRelationsByTagJSON record=$record_with_content relation_name="videos" tag="product"}
    );

    {literal}
    LightBox.addEvent('open:once', function(e) {
        GoodsCatalog.update();
        GoodsCatalog.addEntity('Goods', { 'goods_id': goods_id });
    });
    {/literal}

        new GTMEvents([
            { //открытие большой картинки
                object: LightBox,
                event: 'open',
                gtm_data: {
                    event: "OWOX",
                    eventCategory: 'Product',
                    eventAction: 'viewPhoto',
                    eventLabel: "{$record['id']}"
                }
            },
            { //листание больших фоток
                selector: '[name=popup-img-viewer] a[name=scroll_left], [name=popup-img-viewer] a[name=scroll_right]',
                event: 'click',
                gtm_data: {
                    event: "OWOX",
                    eventCategory: 'Product',
                    eventAction: 'switchPhoto',
                    eventLabel: "{$record['id']}"
                },
                depend_on_event: {
                    object: LightBox,
                    event: 'open'
                }
            }
        ]);

        new GTMEvents([
            {
                selector: '.goods-icons-b .goods-icons-b-i',
                event: 'click',
                gtm_data: {
                    event: "OWOX",
                    eventCategory: 'Product',
                    eventAction: 'clickIcon',
                    eventLabel: { handler: function (event) {
                            return event.target.getParent('.goods-icons-b-i').getElement('.icon-title').get('title');
                        }}
                }
            },
            { //открытие информационных окон. Ссылки могут находиться на вкладках, так что вешаемся на зависимое событие
                // (событие вызывается и при загрузке страницы)
                selector: 'a[name=info-link]',
                event: 'click',
                gtm_data: {
                    event: "OWOX",
                    eventCategory: 'Product',
                    eventAction: 'iconInfo',
                    eventLabel: { handler: function (event) {
                            return event.target.getParent('.info-link').get('title');
                        }}
                },
                depend_on_event: {
                    event:'switchTab'
                }
            },
            { //ссылка, наличие товаров в магазинах
                selector: 'a#pp_map_link',
                event: 'click',
                gtm_data: {
                    event: "OWOX",
                    eventCategory: 'Product',
                    eventAction: 'checkAvailabilityInstore',
                    eventLabel: '{$record['id']}'
                }
            },
            { //выбор города в попапе наличия товаров в магазинах
                selector: '#shops select#cities',
                event: 'change',
                gtm_data: {
                    event: "OWOX",
                    eventCategory: 'Product',
                    eventAction: 'checkAvailabilityInstoreCity',
                    eventLabel: { handler: function (event) {
                            var index = event.target.selectedIndex;
                            return event.target[index].get('html');
                        }}
                },
                depend_on_event: {
                    event: 'addressMapPopupContentUpdate'
                }
            }
        ]);
        {/if}
</script>

<script type="text/javascript">

</script>