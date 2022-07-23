    <section class="b-static b-static-no-margin online-consultant clearfix {if ($menu.active != $menu.www->articles) && $menu.active.record->isRecord()}article-one{/if}" id="articles-parent">

        {include file="breadcrumbs.tpl" show_last_breadcrumb=1}

        {if ($menu.active != $menu.www->articles) && $menu.active.record->isRecord()}

            {if $menu.active.record->parseTextAsTemplate()|count_characters > 0}
                <div class="details b-rich-text">
                    {$menu.active.record->parseTextAsTemplate() nofilter}
                </div>
            {else}
                <h1 class="b-static-title">{$menu.active.record.title|replace:'/*br*/':''}</h1>

                <div class="details b-rich-text">
                    {$menu.active.record->text nofilter}
                </div>
            {/if}

            {$menu.active.record->goods_description->getRelatedArticlesByTags() assign="related_articles"}

            {if count($related_articles) > 0}
            <div class="related-articles-block">
                <h3>Вместе с <strong>{$menu.active.record.title}</strong> часто ищут:</h3>
                <ul>
                {foreach from=$related_articles item=related_article}
                    <li><a href="{$related_article.external_href}">{$related_article.title}</a></li>
                {/foreach}
                </ul>
            </div>
            {/if}

            <div class="clearfix pt-30">
                <div class="return-to-list float-rt">
                <span class="btn-link btn-link-blue">
                    <a class="btn-link-i" href="{$menu.www->articles.href}">Вернуться к списку</a>
                </span>
                </div>

                <div class="float-lt" style="margin-top: 3px;">
                    <div class="grey news-date" style="margin: 4px 0px;">
                        {$menu.active.record.created|@date_format:"%e"}
                        {$menu.active.record.created|@date_format:"%m"|@month_title:genitive}
                        {$menu.active.record.created|@date_format:"%Y"}
                    </div>

                    {include file="social-buttons.tpl"}
                </div>
            </div>
        {else}
            {include file="static-pages-menu-help.tpl"}

            <div class="b-static-content">

                {*{include file="help/menu.tpl"}*}

                <div class="articles">
                    {*{include file="help/categories-menu.tpl" item=$menu.www->articles}*}

                    <ul class="news-l tile" name="articles_list">
                        {include file="articles/body-list.tpl"}
                    </ul>

                    {include file="body-page-navigation.tpl" pos='articles'}
                </div>
            </div>
        {/if}
    </section>
</div>

<div class="content body-layout wrap overflow-hidden clearfix">
    <div class="body-layout clearfix">
        {include file="my/recent_goods/recent_goods_block.tpl"}

        {include file="block-help.tpl"}

        <div class="h-50"></div>
    </div>