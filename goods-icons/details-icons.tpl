{*$icons = $record_tmp->getGoods()->getGoodsIcons(false, $record_tmp)*}
{if count($icons) > 0}
    {strip}
        {capture name="goods_icons"}
            {foreach $icons as $icon}
                {capture name="goods_icons_img"}
                    <div class="goods-icons-b-i-img">
                        {if $icon.has_ref_product}
                        <a href="{$icon.ref_product_link}" target="_blank">
                            <img alt="{$icon.title|replace:'<br>':''|replace:'/*br*/':''|escape:'quotes'}"
                                    title="{$icon.title|replace:'<br>':''|replace:'/*br*/':''|escape:'quotes'}"
                                    src="{$icon.url}"
                                    width="{$icon.width}"
                                    height="{$icon.height}"
                                    class="lazyload"
                            >
                        </a>
                        {else}
                        <img alt="{$icon.title|replace:'<br>':''|replace:'/*br*/':''|escape:'quotes'}"
                                title="{$icon.title|replace:'<br>':''|replace:'/*br*/':''|escape:'quotes'}"
                                src="{$icon.url}"
                                width="{$icon.width}"
                                height="{$icon.height}"
                                class="lazyload"
                        >
                        {/if}
                    </div>
                    <div class="goods-icons-b-i-title {if !empty($icon.docket)}with_docket{/if}">
                        <table>
                            <tr>
                                <td>
                                    {if !empty($icon.url_link)}
                                        <a href="{$icon.url_link}"
                                           target="{if $icon.url_target}_blank{/if}"
                                           class="anchor"
                                           title="{if !empty($icon.url_title)}{$icon.url_title}{else}{$icon.title|replace:'<br>':''|replace:'/*br*/':''|escape:'quotes'}{/if}"
                                        >
                                            <span class="icon-title" title="{$icon.title|replace:'<br>':''|replace:'/*br*/':''|escape:'quotes'}">{$icon.title|replace:'/*br*/':'<br>'|escape:'quotes' nofilter}</span>
                                        </a>
                                    {else}
                                    <span class="icon-title" title="{$icon.title|replace:'<br>':''|replace:'/*br*/':''|escape:'quotes'}">
                                        {if $icon.has_ref_product}
                                        <a href="{$icon.ref_product_link}" target="_blank">
                                            {$icon.title|replace:'/*br*/':'<br>'|escape:'quotes'|html_entity_decode nofilter}
                                        </a>
                                        {else}
                                        {$icon.title|replace:'/*br*/':'<br>'|escape:'quotes'|html_entity_decode nofilter}
                                        {/if}
                                    </span>
                                    {/if}
                                </td>
                            </tr>
                        </table>
                    </div>
                    {if !empty($icon.docket)}
                        {if isset($record_tmp)}
                            {$pid = "r"|cat:$record_tmp.id|cat:"t"|cat:$icon.id}
                        {else}
                            {$pid = "t"|cat:$icon.id}
                        {/if}
                        <a class="info-link" id="gi_popup_button_details_{$pid}" href="#" name="info-link" title="{$icon.title|replace:'<br>':''|replace:'/*br*/':''|escape:'quotes'}">
                            <img class="info-link-img lazyload" src="{$settings.path.design}/_.gif">
                        </a>
                    {/if}
                {/capture}

                {strip}
                {capture name="goods_icons_popup_content"}
                    {if !empty($icon.docket) && $hide_docket != true}
                        {$docket = $icon.docket|regex_replace:"/[\r\n]/":" "}
                        {$docket|html_entity_decode nofilter}
                    {/if}
                    {if !empty($icon.url_link) and !empty($icon.url_title)}
                        <a href="{$icon.url_link}" target="{if $icon.url_target}_blank{/if}">
                            {if !empty($icon.url_title)}
                                {$icon.url_title}
                            {else}
                                {$icon.url_link}
                            {/if}
                        </a>
                    {/if}
                {/capture}
                {/strip}

                <div class="goods-icons-b-i" id="goods-icons-{$icon.id}">
                    {if !empty($smarty.capture.goods_icons_popup_content)}
                        {if isset($record_tmp)}
                            {$pid = "r"|cat:$record_tmp.id|cat:"t"|cat:$icon.id}
                        {else}
                            {$pid = "t"|cat:$icon.id}
                        {/if}

                        <div class="goods-icons-b-i-wrap" id="gi_popup_button{$pid}">
                            {$smarty.capture.goods_icons_img nofilter}
                            {include
                            file="goods-icons/popup.tpl"
                            button_id="gi_popup_button_details_{$pid}"
                            parent_id="gi_popup_parent{$pid}"
                            content=$smarty.capture.goods_icons_popup_content}
                        </div>
                    {else}
                        <div class="goods-icons-b-i-wrap">
                            {$smarty.capture.goods_icons_img nofilter}
                        </div>
                    {/if}
                </div>

            {/foreach}
        {/capture}
    {/strip}

    {$goods_icons = trim($smarty.capture.goods_icons)}
    {if !empty($goods_icons)}
        <div class="goods-icons-b goods-icons-details-b">
            {$goods_icons nofilter}
        </div>
    {/if}
{/if}