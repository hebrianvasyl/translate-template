<div class="tabs-content-wrap">
    <div class="articles">
        <h2 class="detail-tab-i-title">{'Вопросы и ответы к товару'|translate} <span class="pp-characteristics-tab-product-name">{$record.title}</span></h2>

        <ul class="news-l tile" name="articles_list">
            {foreach $record->getGoods()->getFaqArticles() as $description}
            <li id="description-{$description.id}" class="news-l-i clearfix">
                <a href="{$description->article.external_href}" class="news-l-i-link float-lt" target="_blank">
                    <div class="hover_bg">
                        <div class="additional-info-block">
                            <div class="inner">{'Дополнительная информация'|translate}</div>
                        </div>
                    </div>
                    {if !empty($description->attachments) && count($description->attachments->icon_hover)}
                    <div class="icon_hover hidden">
                        {$description->attachments->icon_hover.original nofilter}
                    </div>
                    {/if}
                    <div class="icon">
                        {if count($description->attachments->icon)}
                        {$description->attachments->icon.original nofilter}
                        {/if}

                        {if $description->getBanner()}
                        <div class="banner-template banner-template-square">
                            {$description->getBanner() nofilter}
                        </div>
                        {/if}
                    </div>
                    <div class="news-l-i-content">
                        <h3 class="news-l-i-title">{$description->article.title|replace:'/*br*/':'<br>' nofilter}</h3>
                    </div>
                </a>
            </li>
            {/foreach}
        </ul>
    </div>
</div>