{include file="breadcrumbs.tpl" show_last_breadcrumb=1}

<div class="segment-page">
    <div class="clearfix">
        <h1 class="segment-page-title">{$menu.active.title}</h1>
        {if isset($offers_records) && !empty($offers_records)}
            <div class="segment-page-title-count">{$offers_records|count} товар{$offers_records|count|@morphology:'':'а':'ов'}</div>
        {/if}
    </div>

    {if isset($offers_records) && !empty($offers_records)}
    <div class="catalog">
        <div id="goods-parent">

            <div class="goods g-tile g-tile-with-separate" >

                <div class="g-l catalog-l" name="goods_list">

                    {foreach from=$offers_records item=record}

                        {include file="goods/catalog/goods-tile.tpl"}

                    {/foreach}

                </div>

            </div>

        </div>
    </div>
    {else}
    <p><br>Товаров нет :(</p>
    {/if}
</div>

<div class="clearfix">
    <div class="intexpool-help">
        <h4>Помощь от IntexPool</h4>
        <div class="bg">
            <div class="content">
                <div class="content-title">Полезная и необходимая информация</div>
                <p>О продукции Intex и Bestway</p>
            </div>
            <ul>
              <li><a href="{$menu.www->qa.href}">Вопросы и ответы</a></li>
              <li><a href="{$menu.www->articles.href}">Советы - Статьи</a></li>
              <li><a href="{$menu.www->videocontent.href}">Видеоинструкции</a></li>
            </ul>
        </div>
    </div>
</div>