{Articles->getRecords goods_section=$section->getGoodsSection() is_section=$smarty.const.OWOX_RECORD relation_name="article_record_to_goods_sections" limit=5 assign="articles"}

{if !empty($articles)}

	{$all_articles_href = $menu.www->articles.href}

	<div class="sidebar-i sidebar-i-content">
		<div class="sidebar-i-content-title clearfix">
			<a class="sidebar-i-content-title-link" href="{$menu.www->articles.href}">{'Советы от IntexPool'|translate}</a>
		</div>
		<ul class="sidebar-i-content-l">

			{foreach $articles as $article}

				{*Ссылка на все статьи и обзоры ведет в категорию первой статьи*}
				{if $article@first}
					{$all_articles_href = $article -> menu_node -> parent.href}
				{/if}

				<li class="sidebar-i-content-l-i clearfix item">
					{if $article->goods_description and count($article->goods_description->attachments->icon)}
                        <a class="sidebar-i-content-l-i-text-img" href="{$article.external_href}" name="sidebar_article_item" title="{$article.title|replace:'/*br*/':' '|replace:'<br>':' '|escape:'quotes' nofilter}">
                            {if isset($article->goods_description->attachments->icon.small.url) and !empty($article->goods_description->attachments->icon.small.url) and ($article->goods_description->attachments->icon.small.url != 'https://i.intexpool.ua/articles/0/_.gif')}
                            <span class="small-icon">
                                <img class="lazyload"
                                        alt="{$article.title|replace:'/*br*/':' '|replace:'<br>':' '|escape:'quotes'}"
                                        title="{$article.title|replace:'/*br*/':' '|replace:'<br>':' '|escape:'quotes'}"
                                        name="article-{$article.id}"
                                        data-src="{$article->goods_description->attachments->icon.small.url}"
                                        width="{$article->goods_description->attachments->icon.small.width}"
                                        height="{$article->goods_description->attachments->icon.small.height}"
                                />
                            </span>
                            {else}
                            <span class="original-icon">
                                <img class="lazyload"
                                        alt="{$article.title|replace:'/*br*/':' '|replace:'<br>':' '|escape:'quotes'}"
                                        title="{$article.title|replace:'/*br*/':' '|replace:'<br>':' '|escape:'quotes'}"
                                        name="article-{$article.id}"
                                        data-src="{$article->goods_description->attachments->icon.original.url}"
                                        width="{$article->goods_description->attachments->icon.original.width}"
                                        height="{$article->goods_description->attachments->icon.original.height}"
                                />
                            </span>
                            {/if}
                        </a>
					{elseif count($article->attachments->icon)}
						<a class="sidebar-i-content-l-i-text-img" href="{$article.external_href}" name="sidebar_article_item" title="{$article.title|replace:'/*br*/':' '|replace:'<br>':' '|escape:'quotes' nofilter}">
							{if isset($article->attachments->icon.small.url) and !empty($article->attachments->icon.small.url) and ($article->attachments->icon.small.url != 'https://i.intexpool.ua/articles/0/_.gif')}
								<span class="small-icon">
                                    <img class="lazyload"
                                            alt="{$article.title|replace:'/*br*/':' '|replace:'<br>':' '|escape:'quotes'}"
                                            title="{$article.title|replace:'/*br*/':' '|replace:'<br>':' '|escape:'quotes'}"
                                            name="article-{$article.id}"
                                            data-src="{$article->attachments->icon.small.url}"
                                            width="{$article->attachments->icon.small.width}"
                                            height="{$article->attachments->icon.small.height}"
                                    />
								</span>
							{else}
								<span class="original-icon">
                                    <img class="lazyload"
                                            alt="{$article.title|replace:'/*br*/':' '|replace:'<br>':' '|escape:'quotes'}"
                                            title="{$article.title|replace:'/*br*/':' '|replace:'<br>':' '|escape:'quotes'}"
                                            name="article-{$article.id}"
                                            data-src="{$article->attachments->icon.original.url}"
                                            width="{$article->attachments->icon.original.width}"
                                            height="{$article->attachments->icon.original.height}"
                                    />
								</span>
							{/if}
						</a>
					{/if}
					<a class="sidebar-i-content-l-i-text" href="{$article.external_href}" name="sidebar_article_item" title="{$article.title|replace:'/*br*/':' '|replace:'<br>':' '|escape:'quotes' nofilter}">{$article.title|replace:'/*br*/':'<br>' nofilter}</a>
				</li>

			{/foreach}

		</ul>
		<a class="show-more-link" href="{$all_articles_href}"><span>{'Просмотреть все советы'|translate}</span></a>
	</div>

    <script>
        new GTMEvents([
            { //переход на вариант товара
                selector: '[name="sidebar_article_item"]',
                event: 'click',
                gtm_data: {
                    event: "OWOX",
                    eventCategory: 'Catalog',
                    eventAction: 'clickOnArticle',
                    eventLabel: { handler: function (event_object) {
                        return event_object.target.getProperty('title');
                    }}
                }
            }
        ]);
    </script>

{/if}