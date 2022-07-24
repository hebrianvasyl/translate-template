{include file="breadcrumbs.tpl" show_last_breadcrumb=1}

<div class="segment-page">
    <div class="clearfix">
        <h1 class="segment-page-title">{$menu.active.title}</h1>
        {if isset($offers_records) && !empty($offers_records)}
            <div class="segment-page-title-count">{$offers_records|count} {'товар'|translate}{$offers_records|count|@morphology:'':"{'а'|translate}":"{'ов'|translate}"}</div>
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
    <p><br>{'Товаров нет'|translate} :(</p>
    {/if}
</div>

<div class="clearfix">
    <div class="intexpool-help">
        <h4>{'Помощь от IntexPool'|translate}</h4>
        <div class="bg">
            <div class="content">
                <div class="content-title">{'Полезная и необходимая информация'|translate}</div>
                <p>{'О продукции Intex и Bestway'|translate}</p>
            </div>
            <ul>
              <li><a href="{$menu.www->qa.href}">{'Вопросы и ответы'|translate}</a></li>
              <li><a href="{$menu.www->articles.href}">{'Советы - Статьи'|translate}</a></li>
              <li><a href="{$menu.www->videocontent.href}">{'Видеоинструкции'|translate}</a></li>
            </ul>
        </div>
    </div>
</div>