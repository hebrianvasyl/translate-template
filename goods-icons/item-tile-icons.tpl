{if !empty($record->getGoods()->relations->goods_icons)}
    {strip}
        {capture name="goods_icons"}
            {foreach $record->getGoods()->relations->goods_icons->getActiveRecords() as $relation}
                {$icon = $relation->to}
                {if count($icon->attachments->image) == 0}
                    {continue}
                {/if}

                {if $icon.show_in_category == 0}
                    {continue}
                {/if}

                {capture name="goods_icons_img"}
                    <div class="goods-icons-b-i-img">
                        <img alt="{$icon->getTitle($record)|escape:'quotes'}"
                             title="{$icon->getTitle($record)|escape:'quotes'}"
                             src="{$icon->attachments->image.small.url}"
                             width="{$icon->attachments->image.small.width}"
                             height="{$icon->attachments->image.small.height}">
                    </div>
                    <div class="goods-icons-b-i-title">
                        {*{$icon->getTitle($record)|escape:'quotes'}*}
                        {$icon->getTitle($record)|replace:'/*br*/':' '|escape:'quotes' nofilter}
                    </div>
                {/capture}

                {strip}
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
                {/strip}

                <div class="goods-icons-b-i">
                    {if !empty($smarty.capture.goods_icons_popup_content)}
                        {$pid = "r"|cat:$record.id|cat:"t"|cat:$icon.id}

                        <div class="goods-icons-b-i-wrap" {*id="gi_popup_button{$pid}"*} href="#">
                            {$smarty.capture.goods_icons_img nofilter}
                            {*{include*}
                            {*file="goods-icons/popup.tpl"*}
                            {*button_id="gi_popup_button{$pid}"*}
                            {*parent_id="gi_popup_parent{$pid}"*}
                            {*content=$smarty.capture.goods_icons_popup_content}*}
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
        <div class="goods-icons-b goods-icons-catalog-b">
            {$goods_icons nofilter}
        </div>
    {/if}
{/if}