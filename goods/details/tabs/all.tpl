<script>
if($('product-preload')) {
    $('product-preload').processStop();
    $('product-preload').destroy();
}
</script>
{include file='goods/purchase_goods_id.tpl' scope=parent}

{* флаг, уцененный ли это товар *}
{Goods->getNewGoods goods_record=$record assign='record_new_goods'}
{$is_mark_down = !empty($record_new_goods)}

<script type="text/javascript">
    var IsMarkDown = '{$is_mark_down}';
</script>

{$record_with_content = $record}

{Cities->getShopCity assign="shop_city"}

{capture name="left_top_tags"}
{$left_top_tags = $record->getTags('left_top_side')}
{if count($left_top_tags) > 0}
<div class="additional-tags left-top">
    {foreach from=$left_top_tags item=tag}
    <div class="tag tag-{$tag.class}" {if $tag.bg_color} style="background-color: #{$tag.bg_color};"{/if}>
    {if $tag.image}
    <img class="additional-tags-img" src="{$tag.image}">
    {/if}
    <span{if $tag.text_color} style="color: #{$tag.text_color};"{/if}>{$tag.title}</span>
</div>
{/foreach}
</div>
{/if}
{/capture}

{capture name="left_bottom_tags"}
{$left_bottom_tags = $record->getTags('left_bottom_side')}
{if count($left_bottom_tags) > 0}
<div class="additional-tags left-bottom">
    {foreach from=$left_bottom_tags item=tag}
    <div class="tag tag-{$tag.class}">
        <img class="additional-tags-img" src="{$tag.image}">
    </div>
    {/foreach}
</div>
{/if}
{/capture}

{capture name="right_top_tags"}
{$right_top_side = $record->getTags('right_top_side')}
{if count($right_top_side) > 0}
<div class="additional-tags right-top">
    {foreach from=$right_top_side item=tag}
    <div class="tag tag-{$tag.class}">
        <img class="additional-tags-img" src="{$tag.image}">
    </div>
    {/foreach}
</div>
{/if}
{/capture}

{capture name="right_bottom_tags"}
{$right_bottom_side = $record->getTags('right_bottom_side')}
{if count($right_bottom_side) > 0}
<div class="additional-tags right-bottom">
    {foreach from=$right_bottom_side item=tag}
    <div class="tag tag-{$tag.class}">
        <img class="additional-tags-img" src="{$tag.image}">
    </div>
    {/foreach}
</div>
{/if}
{/capture}

{assign var="videos" value=$record->getVideos('product')}

<div class="goods-details__tab-all">
    <div>
        <div class="pp-image-tags-wrap {if count($videos) > 0}with-videos{/if}">
            <div data-role="image-previews" id="image-previews-wrap"></div>

            <div id="record-tags">
                {$smarty.capture.left_top_tags nofilter}
                {$smarty.capture.left_bottom_tags nofilter}
                {$smarty.capture.right_top_tags nofilter}
                {$smarty.capture.right_bottom_tags nofilter}
            </div>
            <div id="variant-tags"></div>
        </div>
        <script>
            var ip = new ImagePreviews({
                zoom_view: 1
            });
            ip.setImages({Goods->getGoodsImagesJSON record=$record not_show_defaults=1});
            ip.setTitle('{$record.title}');
            ip.onDOMReady();
        </script>

        {include file='goods/details/item-videos.tpl' videos=$videos record=$record_with_content}
    </div>

    <div class="goods-details__main">
        <div class="goods-details__main_rating">
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

            {if !$is_mark_down}
            <div>
                <ul>
                    <li name="compare_details"></li>
                    <li name="wishlists_details"></li>
                </ul>
            </div>
            {/if}
        </div>

        {Goods->topInformationBlock record=$menu.active assign=top_block}
        {if $top_block}
        <div class="attention">
            {$top_block nofilter}
        </div>
        {/if}

        <div class="goods-details__groups">
            {if isset($groups)}
            <div id="configurable_details">
                {foreach $groups as $group_id => $group}
                <section class="variants">
                    <ul class="variants-l">
                        <li class="variants-l-i variants-link-title disabled">{$group.title}:</li>

                        {foreach $group.records as $group_good}
                        <li
                                class="variants-l-i float-lt {if $group_good.active}active{else}js-variants-l-i{/if}"
                                data-title="{$group_good.title}"
                                data-ext-id="{$group_good.ext_id}"
                                data-image="{$group_good.image}"
                                data-details="{$group_good.main_details}"
                                data-price-block="{$group_good.price_block}"
                                data-tags-block="{$group_good.tags_block}"
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

        <div style="position: relative;">
            {$analog = $record->getSuggestRecord('kupit-analog')}
            {if $analog && $analog.sell_status == 'available' && $analog.price > 0}
            <div id="additional-btn-wrap" class="additional-btn-wrap additional-btn-wrap--analog {$record.sell_status}">
                <a href="{$analog.external_href}" id="buy-analog-btn" class="additional-btn">{'Купить аналог<br>за'|translate} {$analog->price nofilter}</a>
            </div>
            {elseif $record->parent.hide_oneclick_details != "1" and ($record->sell_status.value == "available" or $record->sell_status.value == "limited")}
            <div id="additional-btn-wrap" class="additional-btn-wrap {$record.sell_status}">
                <input type="hidden" name="oneclick_product_id" value="{$purchase_goods_id}">
                <a href="javascript:;" id="open-one-click-order" class="additional-btn">{'Заказать в 1 клик'|translate}</a>
            </div>
            {else}
            <div id="additional-btn-wrap"></div>
            {/if}

            <div id="record-price" name="buy_details"></div>
            <div id="variant-price"></div>
        </div>

        {if $record.defect_description}
        <div class="reason">
            <p class="reason-title light-red">
                Причина уценки: <span class="reason-title-text">{$record.defect_description}</span>
            </p>
            <span class="reason-title-text">
                <span class="light-red">*</span>
                Уцененный товар возврату не подлежит
            </span>
        </div>
        {/if}

        {if $is_mark_down}
        <div class="pp-new-good">
            <section class="goods-l horizontal small">
                <h4 class="green">{'Есть новый, без уценки'|translate}</h4>
                {include file='details/sidebar-item-tile.tpl' record=$record_new_goods}
            </section>
        </div>
        {/if}

        {Goods->getRelatedStockGoods goods_record=$record assign='stock_goods_records'}

        {if count($stock_goods_records)}
        <section class="goods-l horizontal small g-stock-l clear reason" style="background: #fff;">
            <h4 class="red">{'Есть такой же товар с уценкой'|translate}</h4>
            {foreach from=$stock_goods_records item='stock_goods_record'}
            {include file='details/sidebar-item-tile.tpl' record=$stock_goods_record}
            {/foreach}
        </section>
        {/if}

        <hr>

        {$main_details = $record_with_content->getMainDetails()}

        <div id="main-details">
            <div id="record-main-details">
                {$main_details nofilter}
            </div>
            <div id="variant-main-details"></div>
        </div>

        <div class="goods-details__delivery" id="js-delivery-block-content">
            <div>
                <span>{'Доставка в'|translate} <a href="#" id="select-delivery-city" data-city-id="0">{'Выберите город'|translate}</a></span>
                <a href="#" id="js-open-delivery-tab">{'Подробности о доставке'|translate} ></a>
            </div>

            <div class="goods-details__table">
            <table>
                <thead>
                <tr>
                    <th class="text-left">
                        <span>
                        {if date('H') < $settings.Contacts.delivery_today_deadline}
                            Отправим сегодня
                        {else}
                            Отправим завтра
                        {/if}
                        </span>
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
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 496 496"  xmlns:v="https://vecta.io/nano"><path d="M287.16 248c5.184-11.256 8.232-23.664 8.68-36.744 20.704-21.864 32.16-50.28 32.16-80.512V96c0-20.256-15.144-37.056-34.704-39.648C276.512 21.96 241.632 0 203.072 0h-13.464c-26.016 0-51.664 8.8-72.208 24.776C88.544 47.216 72 81.056 72 117.608v13.136c0 30.232 11.456 58.648 32.168 80.512 1.04 30.68 16.488 57.712 39.832 74.56v19.768L81.44 319.48C33.488 330.144 0 371.88 0 421.008V496h496V248H287.16zM104 152v33.304c-10.376-16.144-16-34.912-16-54.56v-13.136c0-31.584 14.296-60.824 39.224-80.208A102.15 102.15 0 0 1 189.608 16h13.464a84.31 84.31 0 0 1 77.576 51.152l2.08 4.848H288c13.232 0 24 10.768 24 24v34.744c0 19.648-5.624 38.416-16 54.56V120h-17.536l-2.76 1.104C224.456 141.6 170.48 152 115.264 152H104zM80 448v32H16v-58.992c0-41.56 28.336-76.888 68.904-85.896L104 330.864V448H80zm192 32H96v-16h24V327.304l24-5.336V464h112V321.968l16 3.56V480zm-72-104c15.664 0 29.824-6.48 40-16.888V448h-80v-88.888C170.176 369.52 184.336 376 200 376zm-40-56v-24.84c12.192 5.616 25.712 8.84 40 8.84s27.808-3.224 40-8.84V320c0 22.056-17.944 40-40 40s-40-17.944-40-40zm112-10.864l-16-3.552v-19.768c5.872-4.232 11.232-9.104 16-14.528v37.848zM280 208c0 44.112-35.888 80-80 80s-80-35.888-80-80v-40.024c55.016-.568 108.816-11.12 160-31.368V208zm88 56h32v64h-32v-64zm112 216H288V264h64v80h64v-80h64v216zm-32-32h16v16h-16zm-64 0h48v16h-48zm0-32h80v16h-80z"/></svg>
                            <span>{'Самовывоз из Новой почты'|translate}</span>
                        </div>
                    </td>
                    <td id="np-wh-pod">
                        {'по тарифам перевозчика'|translate}
                    </td>
                    <td id="np-wh">
                        по тарифам перевозчика
                    </td>
                </tr>
                <tr>
                    <td>
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" height="661.333" viewBox="-15 0 495 496" width="661.333"  xmlns:v="https://vecta.io/nano"><path d="M8.5 432.023a7.99 7.99 0 0 1-8-8c0-39.71 32.305-72.016 72.016-72.016 4.426 0 8 3.578 8 8a7.99 7.99 0 0 1-8 8c-30.887 0-56.016 25.13-56.016 56.016a7.99 7.99 0 0 1-8 8zm0 0"/><path d="M128.5 368.016l-55.984-.008a8 8 0 0 1-8-8c0-4.422 3.586-8 8-8l55.984.008a8 8 0 1 1 0 16zm144 0l-32-.008c-4.426 0-8-3.582-8-8s3.586-8 8-8l32 .008a8 8 0 1 1 0 16zM8.508 488a8 8 0 0 1-8-8L.5 424.023a8 8 0 0 1 8-8c4.414 0 8 3.578 8 8L16.508 480a8 8 0 0 1-8 8zm0 0"/><path d="M16.508 496a16.02 16.02 0 0 1-16-16c0-4.426 3.578-8 8-8a7.99 7.99 0 0 1 8 8v.016c4.426 0 8 3.57 8 7.992a7.99 7.99 0 0 1-8 7.992zm0 0"/><path d="M328.5 496H16.508c-4.422 0-8-3.574-8-8s3.578-8 8-8H328.5a8 8 0 1 1 0 16zm-200-127.984a7.99 7.99 0 0 1-8-8v-45.848a8 8 0 1 1 16 0v45.848a7.99 7.99 0 0 1-8 8zm0 0"/><path d="M240.5 368.008a7.99 7.99 0 0 1-8-8v-45.84a7.99 7.99 0 1 1 16 0v45.84a7.99 7.99 0 0 1-8 8zm0 0"/><path d="M184.5 336.008c-70.574 0-128-57.422-128-128 0-4.422 3.574-8 8-8s8 3.578 8 8c0 61.762 50.238 112 112 112s112-50.238 112-112c0-4.422 3.574-8 8-8s8 3.578 8 8c0 70.578-57.426 128-128 128zM304.5 144a7.99 7.99 0 0 1-8-8c0-61.762-50.238-112-112-112s-112 50.238-112 112a8 8 0 1 1-16 0c0-70.574 57.426-128 128-128s128 57.426 128 128a7.99 7.99 0 0 1-8 8zm0 0"/><path d="M64.5 216.008a7.99 7.99 0 0 1-8-8V168a8 8 0 1 1 16 0v40.008a7.99 7.99 0 0 1-8 8zm240 0a7.99 7.99 0 0 1-8-8V168a8 8 0 1 1 16 0v40.008a7.99 7.99 0 0 1-8 8zm0 0"/><path d="M320.5 176h-272a7.99 7.99 0 1 1 0-16h272a7.99 7.99 0 1 1 0 16zm0 0"/><path d="M320.5 176c-2.176 0-4.352-.88-5.93-2.625C314.363 173.16 285.34 144 184.5 144S54.645 173.16 54.355 173.457c-3.03 3.168-8.07 3.344-11.27.367-3.203-2.984-3.457-7.945-.516-11.19 1.28-1.418 32.64-34.625 141.93-34.625s140.648 33.207 141.93 34.625a8.01 8.01 0 0 1-.555 11.305c-1.535 1.375-3.453 2.063-5.375 2.063zm0 0"/><path d="M304.5 165.273c-4.426 0-8-3.578-8-8V136a8 8 0 1 1 16 0v21.273c0 4.422-3.574 8-8 8zm-240 0c-4.426 0-8-3.578-8-8V136a8 8 0 1 1 16 0v21.273c0 4.422-3.574 8-8 8zM184.5 112c-17.648 0-32-14.352-32-32s14.352-32 32-32 32 14.352 32 32-14.352 32-32 32zm0-48a16.02 16.02 0 0 0-16 16 16.02 16.02 0 0 0 16 16 16.02 16.02 0 0 0 16-16 16.02 16.02 0 0 0-16-16zm0-40a7.99 7.99 0 0 1-8-8V8a8 8 0 1 1 16 0v8a7.99 7.99 0 0 1-8 8zm-24.008 359.992a7.97 7.97 0 0 1-3.559-.84l-32-15.977c-3.953-1.97-5.562-6.777-3.586-10.727 1.977-3.97 6.8-5.54 10.727-3.586l32 15.977c3.953 1.97 5.563 6.777 3.586 10.727-1.398 2.8-4.23 4.426-7.168 4.426zm0 0"/><path d="M160.5 383.992c-3.352 0-6.48-2.13-7.594-5.48a8.01 8.01 0 0 1 5.074-10.12l24-7.977c4.2-1.367 8.72.883 10.12 5.074a8.01 8.01 0 0 1-5.074 10.12l-24 7.977c-.84.27-1.695.406-2.527.406zm48.008 0c-2.937 0-5.77-1.617-7.168-4.434-1.977-3.95-.367-8.758 3.586-10.727l32-15.977c3.95-1.96 8.766-.367 10.727 3.586 1.977 3.95.367 8.758-3.586 10.727l-32 15.977a7.9 7.9 0 0 1-3.559.848zm0 0"/><path d="M208.5 383.992a8.23 8.23 0 0 1-2.52-.406l-24-7.977c-4.2-1.402-6.465-5.922-5.074-10.12 1.402-4.184 5.938-6.44 10.12-5.074l24 7.977c4.2 1.402 6.465 5.922 5.074 10.12a8.03 8.03 0 0 1-7.602 5.48zm-23.762 32c-4.422 0-8.04-3.578-8.04-8s3.535-8 7.953-8h.086c4.418 0 8 3.574 8 8a8 8 0 0 1-8 8zM456.5 496h-184a7.99 7.99 0 0 1-8-8V360.016c0-4.422 3.574-8 8-8h184c4.426 0 8 3.578 8 8V488a7.99 7.99 0 0 1-8 8zm-176-16h168V368.016h-168zm0 0"/><path d="M272.492 366.664a7.91 7.91 0 0 1-4.922-1.703c-3.477-2.723-4.094-7.754-1.367-11.227l24-30.672a7.98 7.98 0 0 1 11.227-1.367c3.477 2.72 4.094 7.754 1.367 11.227l-24 30.672c-1.57 2.016-3.93 3.07-6.305 3.07zm184.016 1.352a7.98 7.98 0 0 1-6.406-3.2l-24-32.023c-2.656-3.527-1.937-8.547 1.598-11.2 3.535-2.664 8.555-1.937 11.2 1.598l24 32.023c2.656 3.53 1.938 8.547-1.598 11.2-1.434 1.082-3.12 1.602-4.785 1.602zm0 0"/><path d="M432.5 335.992h-136c-4.426 0-8-3.578-8-8a7.99 7.99 0 0 1 8-8h136a7.99 7.99 0 0 1 8 8c0 4.422-3.574 8-8 8zm0 0"/><path d="M344.508 367.496a7.97 7.97 0 0 1-1.977-.25c-4.277-1.086-6.87-5.437-5.785-9.72l8-31.488c1.1-4.297 5.473-6.9 9.723-5.78 4.277 1.086 6.87 5.438 5.785 9.72l-8 31.488c-.922 3.625-4.18 6.03-7.746 6.03zm39.984.52a8 8 0 0 1-7.754-6.062l-8-32.023c-1.078-4.28 1.53-8.625 5.824-9.7 4.28-1.086 8.625 1.53 9.7 5.824l8 32.023c1.078 4.28-1.53 8.625-5.824 9.7a8.13 8.13 0 0 1-1.945.238zm0 0"/><path d="M344.5 407.992c-4.426 0-8-3.578-8-8v-40.504a8 8 0 1 1 16 0v40.504c0 4.422-3.574 8-8 8zm40 0c-4.426 0-8-3.578-8-8v-39.977c0-4.422 3.574-8 8-8s8 3.578 8 8v39.977c0 4.422-3.574 8-8 8zm0 0"/><path d="M384.5 407.992h-40c-4.426 0-8-3.578-8-8a7.99 7.99 0 0 1 8-8h40a7.99 7.99 0 0 1 8 8c0 4.422-3.574 8-8 8zm0 0"/></svg>
                            <span>{'Курьером по вашему адресу'|translate}</span>
                        </div>
                    </td>
                    <td id="np-addr-pod">
                        {'по тарифам перевозчика'|translate}
                    </td>
                    <td id="np-addr">
                        по тарифам перевозчика
                    </td>
                </tr>
                </tbody>
            </table>
            </div>

            <div>
                <div id="js-delivery-block-hint"></div>
            </div>
        </div>
    </div>
</div>

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

<div class="h-50"></div>

{if $record->isATP() and $record.type !== 'configurable'}
<div class="main-product-container">
    <div class="main-tab-all">
        <div class="pp-top-details clearfix">
            {include file="details/kits/kits.tpl"}
        </div>
    </div>
</div>
{/if}

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
    {/if}
    {/if}
</div>

{Controller->getChildTabControllerByName name='accessories' assign='accessories_controller'}

{if !empty($accessories_controller)}
{assign var="accessories" value=$accessories_controller->getAccessories(
['name' => 'accessories','limit' => 6, 'onlyATP' => 1, 'order' => 'relations_order']
)}
{/if}

<div class="h-50"></div>

{if !empty($accessories)}
<div class="all-tab-accessories clearfix">
    {include file="details/all-tab-accessories.tpl"}

    <script>
        $$("a[name=switch_to_accessories]").addEvent('click',function(e){
            var event = new DOMEvent(e);
            event.stop();
            $('product-main-block-absolute').setStyle('display', 'none');
            goodTabs.switchTab( $$("li[name=accessories]")[0] );
            new Fx.Scroll(window,{ duration:300 }).toElement($('details-tabs-menu'));
        });
    </script>
</div>

<div class="h-50"></div>
{/if}

<script>
    var User = App.get('User');

    var elem = $('open-one-click-order'),
        oneclick_popup;

    if (elem) {

        oneclick_popup = new Popup_class('{template_js_fetch file="goods/details/_jst/popup-small-overflow.jst"}');

        oneclick_popup.setContent(
            '{template_js_fetch file="goods/details/_jst/popup-one-click.jst"}'
        );

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
                                    message = 'Произошла ошибка, свяжитесь с нами по телефону';
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

<script>
    $$('[data-role="popup-show"]').each(function(button){
        var popup   = new Popup_class('{template_js_fetch file="_jst/popup-light.jst"}');
        var videolink = button.get('data-url');
        if(videolink) {
            var patt = new RegExp(/:\/\//);

            if(patt.test(videolink) == false) {
                videolink = 'https://www.youtube.com/embed/' + videolink;
            } else {
                var patt = new RegExp(/youtu\.be\/(.*)$/);
                if(patt.test(videolink) == true) {
                    var id = patt.exec(videolink);
                    if(id.length > 1) {
                        videolink = 'https://www.youtube.com/embed/' + id[1];
                    }
                }

                var patt = new RegExp(/watch\?v=(.*)$/);
                if(patt.test(videolink) == true) {
                    var id = patt.exec(videolink);
                    if(id.length > 1) {
                        videolink = 'https://www.youtube.com/embed/' + id[1];
                    }
                }
            }

            var content = '<iframe width="650" height="365" src="'+videolink+'" frameborder="0" allowfullscreen></iframe>';
        }

        if (content) {
            popup.setContent(content);
            popup.addEvent('close', function(){
                history.pushState('', document.title, window.location.pathname);
            });

            button.addEvent('click', function (event) {
                popup.overlayON();
                if(event) {
                    event.stop();
                }
                popup.open();
            });
        }
    });
</script>

<script>
    var updateDeliveryBlock = function(city) {
        var text;

        if(!city || city.id == 0) {
            return false;
        }

        new Request({
            url: '/cgi-bin/form.php',
            data: {
                city_id: city.id
            },
            headers: {
                ajaxAction: '{$menu.www.href}cities/#setUserCityAJAX'
            }
        }).send();

        if(city.id == '{$shop_city.id}') {
            $$('#js-delivery-block-content table').hide();

            text = '{$settings.Contacts.delivery_text_pickup_uzh nofilter}';
            $('js-delivery-block-hint').set('html', text);
            $('select-delivery-city').set('html', city.title);
            $('select-delivery-city').set('data-city-id', city.id);

            return;
        } else {
            $$('#js-delivery-block-content table').show();

            $('js-delivery-block-hint').set('html', '');
        }

        $('js-delivery-block-content').show();

        $('js-delivery-block-content').addClass('loading');

        $('select-delivery-city').set('data-city-id', city.id);
        $('select-delivery-city').set('html', city.title);

        new Request({
            url: '/cgi-bin/form.php',
            data: {
                json: 1,
                record_id: '{$record.id}',
                city: city.id,
                pod: 1
            },
            headers: {
                ajaxAction: '{$menu.my.href}cart/#calculateGoodDeliveryCost'
            },
            onSuccess: function (resp) {
                var data = JSON.parse(resp);

                if(data.success == true) {
                    $('np-wh').set('html', data.np_wh);
                    $('np-wh-pod').set('html', data.np_wh_pod);
                    $('np-addr').set('html', data.np_addr);
                    $('np-addr-pod').set('html', data.np_addr_pod);
                }

                $('js-delivery-block-content').removeClass('loading');

            }.bind(this)

        }).send();
    };

    var elem = $('select-delivery-city'),
        delivery_cities_popup;

    new Request({
        url: '/cgi-bin/form.php',
        headers: {
            ajaxAction: '{$menu.www.href}cities/#getUserCityAJAX'
        },
        onSuccess: function (resp) {
            var data = JSON.parse(resp);

            if(data.code === 1) {
                var city = {
                    id: data.content.id,
                    title: data.content.title
                };
                updateDeliveryBlock(city);
            }
        }.bind(this)

    }).send();

    if (elem) {

        delivery_cities_popup = new Popup_class('{template_js_fetch file="goods/details/_jst/popup-delivery.jst"}');

        delivery_cities_popup.setContent(
            '{template_js_fetch file="goods/details/_jst/popup-delivery-content.jst"}'
        );

        elem.addEvent(
            'click', function(e){
                e.stop();
                delivery_cities_popup.open();

                var citySwitcher = new CitySwitcherComponent_class({ });
                citySwitcher.options.name = 'delivery_city_id';
                citySwitcher.options.elements = {
                    countries: {
                        selector: '#countries',
                        element_constructor: SelectListElement_class,
                        options: {
                            default_value: function (countries, element) {
                                return countries && countries.length
                                    ? countries[0][element.options.data_key]
                                    : null;
                            }
                        }
                    },
                    cities: null,
                    cities_suggest: {
                        selector: '#delivery_cities_suggest',
                        element_constructor: CitySuggestElement_class,
                        options: {
                            _show_big_cities: false,
                            suggest_options: {
                                show_on_focus: false,
                                styles: {
                                    'z-index': 200
                                }
                            }
                        }
                    }
                };
                citySwitcher.options.binds = {
                    filter_cities_on_country_change: null,
                    filter_suggest_on_country_change: null,
                    on_suggest_selected: {
                        event_element: 'cities_suggest',
                        event: 'change',
                        callback: function(suggest) {
                            var suggest_data = suggest.getValue(true);

                            var city = {
                                id: suggest_data.id,
                                title: suggest_data.title
                            };

                            updateDeliveryBlock(city);

                            delivery_cities_popup.close();
                        }
                    }
                };

                var new_user_locality = document.id('new_user_locality');
                citySwitcher.init(new_user_locality, []);

                $$('.header-city-i-link').addEvent('click', function(e2){
                    e2.stop();
                    var city = {
                        id: this.get('data-city-id'),
                        title: this.get('html')
                    };

                    updateDeliveryBlock(city);

                    delivery_cities_popup.close();
                });

                $$('.header-city-search-example-link').addEvent('click', function(e2){
                    e2.stop();
                    var city = {
                        id: this.get('data-city-id'),
                        title: this.get('html')
                    };

                    updateDeliveryBlock(city);

                    delivery_cities_popup.close();
                });
            }
        );

    }

</script>

<script>
    var title = $('record-title').get('html');
    var ext_id = $('record-ext-id').get('html');
    var image = '{$record->attachments->images.large.url}';

    var size = $('record-title').getSize();
    $('record-title').setStyle('height', size.y);

    if($('configurable_details')) {
        $('configurable_details').getElements('li.js-variants-l-i').addEvents({
            'mouseenter': function(e) {
                $('record-title').set('html', e.target.get('data-title'));
                $('record-title').addClass('nowrap');

                $('record-ext-id').set('html', e.target.get('data-ext-id'));

                image = $$('.pp-image-i-img img').get('src')[0];
                $$('.pp-image-i-img img').set('src', e.target.get('data-image'));

                $('record-price').hide();
                $('record-main-details').hide();
                $('record-tags').hide();
                //$('additional-btn-wrap').hide();
                $$('.additional-btn-wrap--analog').hide();

                $('variant-price').set('html', e.target.get('data-price-block'));
                $('variant-price').show();

                $('variant-main-details').set('html', e.target.get('data-details'));
                $('variant-main-details').show();

                $('variant-tags').set('html', e.target.get('data-tags-block'));
                $('variant-tags').show();
            },
            'mouseleave': function(e) {
                $('record-title').set('html', title);
                $('record-title').removeClass('nowrap');

                $('record-ext-id').set('html', ext_id);

                $$('.pp-image-i-img img').set('src', image);

                $('record-price').show();
                $('record-main-details').show();
                $('record-tags').show();
                //$('additional-btn-wrap').show();
                $$('.additional-btn-wrap--analog').show();

                $('variant-price').set('html', '');
                $('variant-price').hide();

                $('variant-main-details').set('html', '');
                $('variant-main-details').hide();

                $('variant-tags').set('html', '');
                $('variant-tags').hide();
            }
        });
    }
</script>

<script>
    $('js-open-delivery-tab').addEvent('click', function(e) {
        e.stop();

        window.scrollTo({ top: 0, left: 0, behavior: 'smooth' });

        var tabs = $$('[name="delivery_payments"]');

        if(tabs.length > 0) {
            tabs[0].click();
        } else {
            var tabs2 = $$('[name="guaranty"]');
            if(tabs2.length > 0) {
                tabs2[0].click();
            }
        }
    });
</script>