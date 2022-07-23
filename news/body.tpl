    <section class="b-static b-static-no-margin clearfix" id="news-parent">

        {include file="breadcrumbs.tpl" show_last_breadcrumb=1}

        {include file="static-pages-menu.tpl"}

        <div class="b-static-content">

            {*{include file="help/menu.tpl"}*}

            <div class="news">
                {if $menu.active.record}
                    {include file="news/body-details.tpl"}
                {else}
                    <ul class="news-l tile" name="news_list">
                        {include file="news/body-list.tpl"}
                    </ul>

                    {include file="body-page-navigation.tpl" pos="news"}
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
