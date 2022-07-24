{include file='goods/purchase_goods_id.tpl' scope=parent}

{* флаг, уцененный ли это товар *}
{Goods->getNewGoods goods_record=$record assign='record_new_goods'}
{$is_mark_down = !empty($record_new_goods)}

<script type="text/javascript">
    var IsMarkDown = '{$is_mark_down}';
</script>

{$analog = $record->getSuggestRecord('kupit-analog')}

<script type="text/javascript">
    /* <![CDATA[ */
    goog_snippet_vars = function() {
        var w = window;
        w.google_conversion_id = 986507359;
        w.google_conversion_label = "EQtCCPeKhGcQ39Cz1gM";
        w.google_remarketing_only = false;
    };
    // DO NOT CHANGE THE CODE BELOW.
    goog_report_conversion = function(url) {
        goog_snippet_vars();
        window.google_conversion_format = "3";
        var opt = new Object();
        opt.onload_callback = function() {
            if (typeof(url) != 'undefined') {
                window.location = url;
            }
        };
        var conv_handler = window['google_trackConversion'];
        if (typeof(conv_handler) == 'function') {
            conv_handler(opt);
        }
    };
    /* ]]> */
</script>
<script type="text/javascript"
        src="//www.googleadservices.com/pagead/conversion_async.js">
</script>

<script src="https://apis.google.com/js/platform.js"></script>

<section itemscope itemtype="http://schema.org/Product" id="goods{$purchase_goods_id}" class="goods-details {if $record.sell_status == 'archive'}is-archive{/if} {if $analog && $analog.sell_status == 'available' && $analog.price > 0}with-similar-product{/if}">
    <header>
        <div>
            {include file="breadcrumbs.tpl" show_producer_breadcrumb=1}

            <div>
                <span>
                    {'Код товара'|translate}: <span id="record-ext-id">{if !empty($record.ext_id)}{$record->ext_id}{else}{$record->id}{/if}</span>
                </span>
            </div>
        </div>

        <h1 itemprop="name" id="record-title">
            {$record.title|@mnemonics_convert nofilter}
        </h1>
    </header>

    {include file="details/tabs-menu.tpl" record_node=$record_node_updated current_tab=$tab}

    <div itemprop="offers" itemscope itemtype="http://schema.org/Offer">
        {if $record->isATP()}
        <meta itemprop="availability" content="http://schema.org/InStock">
        {else}
        <meta itemprop="availability" content="http://schema.org/OutOfStock">
        {/if}

        <meta itemprop="priceCurrency" content="UAH" />
        <meta itemprop="price" content="{$record->getPrice()}" />
    </div>

    <script type="text/javascript">
        var google_tag_params = {
            "dynx_itemid": "{$record.id}",
            "dynx_pagetype": "product",
            "dynx_totalvalue": "{$record->getPrice()}"
        };
    </script>

    <div class="hidden">
        <span id="adwords_price_block">{if $record->sell_status.value == "available" or $record->sell_status.value == "call" or $record->sell_status.value == "limited" or $record->sell_status.value == "customized"}{$record.price|number_format:0:',':' '}{else}0{/if}</span>
        <script>
            {if !($record->sell_status.value == "available" or $record->sell_status.value == "call" or $record->sell_status.value == "limited" or $record->sell_status.value == "customized")}
            var OUT_OF_STOCK_TEXT = 'ADWORDS_OUT_OF_STOCK';
            {/if}
        </script>
    </div>

    <script>
        var good = {
            "name": "{$record.title}",
            "id": "{$record.id}",
            "price": "{$record->price->getValueByDecimals(0, '.', '')}",
            "brand": "{$record->producer}",
            "category": "{$record->parent}"
        };

        EEProcessor.productDetails([good]);
    </script>

    <script>
        if(typeof fbq !== 'undefined') {
            fbq('track', 'ViewContent', {
                content_type: 'product',
                content_ids: ['{$record.id}']
            });
        }
    </script>
</section>

<div class="overflow-hidden mob-hidden">
    {include file="my/recent_goods/recent_goods_block.tpl"}

    {*include file="block-help.tpl"*}

    <div class="h-50"></div>
</div>

<script type="text/javascript">
    var recent_goods = {ldelim}{rdelim};
    recent_goods['id'] = {$record.id};
    recent_goods['to_purchase_id'] = {$purchase_goods_id};
    recent_goods['href'] = '{$record.external_href}';
    recent_goods['title'] = '{$record.title|escape:'javascript'}';
    recent_goods['sub_title_big'] = '{$record.sub_title_big|escape:'javascript'}';
    recent_goods['sub_title_small'] = '{$record.sub_title_small|escape:'javascript'}';
    recent_goods['type'] = '{$record['type']}';
    {if $record['type'] !== 'configurable'}
    recent_goods['price'] = {$record->getPrice()};
    {else}
    recent_goods['min_price'] = {if $record -> isATP()}{$record->getPrice()}{else}null{/if};
        {/if}
            {if $record->old_price}
            recent_goods['old_price'] = {$record.old_price};
            {/if}
                recent_goods['users_rating'] = {intval($record->users_rating->getValue())};
                recent_goods['count_comments'] = '{$record->users_rating.count_comments}';
                recent_goods['docket'] = '{str_replace(array("\r\n", "\r", "\n"), '', nl2br($record->docket.value))}';
                recent_goods['sell_status'] = '{$record->sell_status->getValue()}';
                recent_goods['attachments']={ldelim}{rdelim};
                recent_goods['attachments']['images']=
                    {ldelim}
                medium: {ldelim}
                url: '{$record->attachments->images.large.url}',
                    width: '{$record->attachments->images.large.width}',
                height: '{$record->attachments->images.large.height}'
                {rdelim}
                {rdelim};
                recent_goods['images']=
                    {ldelim}
                medium: {ldelim}
                url: '{$record->attachments->images.large.url}',
                    width: '{$record->attachments->images.large.width}',
                height: '{$record->attachments->images.large.height}'
                {rdelim}
                {rdelim};

                recent_goods['goods_icons']=[];
                {foreach $record->getGoods()->relations->goods_icons->getActiveRecords() as $relation}
                {$icon = $relation->to}
                {if $icon.show_in_category == 1}
                recent_goods['goods_icons'].push({ldelim}
                'title': '{str_replace(array("/*br*/", "<br>"), " ", $icon.title)}',
                'image': '{$icon->attachments->image.small.url}'
                {rdelim});
                {/if}
                    {/foreach}

                        recent_goods['left_top_tags']=[];
                        {foreach $record->getCatalogTags('left_top_side') as $tag}
                        recent_goods['left_top_tags'].push({ldelim}
                        'title': '{$tag.title}',
                        'class': '{$tag.class}',
                        'bg_color': '{$tag.bg_color}',
                        'text_color': '{$tag.text_color}',
                        'image': '{$tag.image}'
                        {rdelim});
                        {/foreach}

    recent_goods["details"] = '';

    RecentGoods.add(recent_goods);
</script>