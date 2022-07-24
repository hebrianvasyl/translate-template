    <section class="b-static b-static-no-margin clearfix">

        {include file="breadcrumbs.tpl" show_last_breadcrumb=1}

        {include file="static-pages-menu.tpl"}

        <div class="b-static-content">
            <div class="promotions-actual">

            <h1 class="promotions-actual-title b-static-title">{'Акции'|translate}</h1>

                {if isset($catalog_records) && count($catalog_records)}
                    <ul class="promotions-l news-l tile">
                    {foreach $catalog_records as $record}
                        <li class="promotions-l-i news-l-i clearfix">
                            <a href="{$record.external_href}" class="promotions-l-i-link news-l-i-link float-lt">
                                <div class="hover_bg">
                                    <div class="additional-info-block">
                                        <div class="inner">{'Дополнительная информация'|translate}</div>
                                    </div>
                                </div>
                                {if !empty($record->attachments) && count($record->attachments->images_list_hover)}
                                    <div class="icon_hover hidden">
                                        {$record->attachments->images_list_hover.original nofilter}
                                    </div>
                                {elseif $record->banner and count($record->banner->attachments->images_hover)}
                                    {if $record->banner->attachments->images_list_hover}
                                    <div class="icon_hover hidden">
                                        {$record->banner->attachments->images_list_hover.original nofilter}
                                    </div>
                                    {/if}
                                {/if}
                                <div class="icon">
                                    {if count($record->attachments->images_list)}
                                        {$record->attachments->images_list.original nofilter}
                                    {elseif $record->banner and count($record->banner->attachments->images)}
                                        {$record->banner->attachments->images.original nofilter}
                                        {if $record->banner->getPrice()}
                                        <div class="banner-price" style="top:{$record->banner->getRelativeImagesPricePositionTop()}%;left:{$record->banner->getRelativeImagesPricePositionLeft()}%">
                                            <span>{$record->banner->getPrice() nofilter}</span>
                                        </div>
                                        {/if}
                                    {/if}
                                    {if $record->banner->getTemplate()}
                                    <div class="banner-template banner-template-square">
                                        {$record->banner->getTemplate() nofilter}
                                    </div>
                                    {/if}
                                </div>
                                <div class="news-l-i-content">
                                    <h3 class="promotions-l-i-title news-l-i-title">{$record.title|replace:'/*br*/':'<br>' nofilter}</h3>
                                </div>
                            </a>
                        </li>
                    {/foreach}
                    </ul>

                    {if count($menu.active->pages) > 1}
                        <div class="more">
                            <div class="more-text">{'Страницы'|translate}</div>

                            {smart_page_navigation pages=$menu.active->pages midpoint=8 maxpoint=15 var='pages'}
                            <ul class="more-pages-l clearfix">
                                {foreach $pages as $page}
                                    {if $page->isSelected()}
                                        <li class="more-pages-l-i float-lt active">
                                            <span class="more-pages-l-i-link">{$page.title}</span>
                                        </li>
                                    {else}
                                        <li class="more-pages-l-i float-lt" name="2">
                                            <a class="more-pages-l-i-link" name="page-link" href="{$page.href}">{$page.title}</a>
                                        </li>
                                    {/if}
                                {/foreach}
                            </ul>
                        </div>
                    {/if}

                {else}
                    <p>{'На данный момент'|translate} {if $menu.active == 'active'}{'активных'|translate}{else}{'завершенных'|translate}{/if} {'акций нет'|translate}</p>
                {/if}
            </div>
        </div>
    </section>
</div>

<div class="content body-layout wrap overflow-hidden clearfix">
    <div class="body-layout clearfix">
        {include file="my/recent_goods/recent_goods_block.tpl"}

        {include file="block-help.tpl"}

        <div class="h-50"></div>
    </div>