{$icons = $record->getGoods()->getGoodsIcons(true)}
{if count($icons) > 0}
    {strip}
        {capture name="goods_icons"}
            {foreach $icons as $icon}
                {capture name="goods_icons_img"}
                    <div class="goods-icons-b-i-img">
                        <img alt="{$icon.title|html_entity_decode|replace:'<br>':''|replace:'/*br*/':''|escape:'quotes'}"
                                title="{$icon.title|html_entity_decode|replace:'<br>':''|replace:'/*br*/':''|escape:'quotes'}"
                                data-src="{$icon.url}"
                                width="{$icon.width}"
                                height="{$icon.height}"
                                class="lazyload"
                        >
                    </div>
                    <div class="goods-icons-b-i-title" id="goods-icon-{$icon.id}">
                        {$icon.title|html_entity_decode|replace:'<br>':''|replace:'/*br*/':''|escape:'quotes' nofilter}
                    </div>
                {/capture}

                {*strip}
                    {capture name="goods_icons_popup_content"}
                        {if !empty($icon.docket)}
                            {$docket = $icon.docket|regex_replace:"/[\r\n]/":" "}
                            {$docket nofilter}
                            {if !empty($icon.url_link)}
                                <a href="{$icon.url_link}" target="{if $icon.url_target}_blank{/if}">
                                    {if !empty($icon.url_title)}
                                        {$icon.url_title}
                                    {else}
                                        {$icon.url_link}
                                    {/if}
                                </a>
                            {/if}
                        {/if}
                    {/capture}
                {/strip*}

                <div class="goods-icons-b-i">
                    {*if !empty($smarty.capture.goods_icons_popup_content)}
                        {$pid = "r"|cat:$record.id|cat:"t"|cat:$icon.id}

                        <div class="goods-icons-b-i-wrap" href="#">
                            {$smarty.capture.goods_icons_img nofilter}
                        </div>
                    {else}
                        <div class="goods-icons-b-i-wrap">
                            {$smarty.capture.goods_icons_img nofilter}
                        </div>
                    {/if*}

                    <div class="goods-icons-b-i-wrap">
                        {$smarty.capture.goods_icons_img nofilter}
                    </div>
                </div>
            {/foreach}
        {/capture}
    {/strip}

    {$goods_icons = trim($smarty.capture.goods_icons)}
    {if !empty($goods_icons)}
        <div class="goods-icons-b goods-icons-catalog-b">
            {$goods_icons nofilter}
        </div>
    {/if}
{/if}