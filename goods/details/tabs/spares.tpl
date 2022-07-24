<div class="tabs-content-wrap">
    {assign var="tech_videos" value=$record->getVideos('tech')}
    {if count($tech_videos) > 0}
    <div class="tech_videos">
        {foreach $tech_videos as $video}
        <div id="tech_video_{$video.id}" class="tech_videos-item">
            <div class="tech_videos-item-image">
                <img src="{$video->attachments->image.small.url}">
            </div>
            <div class="tech_videos-item-title">
                {if !empty($video.title2)}
                {$video.title2}
                {else}
                {$video.title}
                {/if}
            </div>
            <script type="text/javascript">
                var button{$video.id} = document.getElementById('tech_video_{$video.id}');

                var popup{$video.id} = new Popup_class('{template_js_fetch file="_jst/popup-light.jst"}');
                popup{$video.id}.overlayON();
                popup{$video.id}.setContent('<div style="text-align: center;"><iframe width="540" height="315" src="https://www.youtube.com/embed/{$video.ext_video_id}" frameborder="0" allowfullscreen></iframe></div>');

                button{$video.id}.addEvent('click', function (event) {
                    event.stop();
                    popup{$video.id}.open()
                });
            </script>
        </div>
        {/foreach}
    </div>
    {/if}

    {if count($record->getGoods()->getSpares())}
    <div class="spares">
        {foreach $record->getGoods()->getSpares() as $spare}
        <div class="spare-item">

            <h2 class="detail-tab-i-title">{'Запчасти к товару'|translate} <span class="pp-characteristics-tab-product-name">{$spare.title}</span></h2>

            {if count($spare->attachments->downloads)}
            <div class="spare-downloads">
                {foreach $spare->attachments->downloads as $download}
                <div class="spare-download-item">
                    <a href="{$download.url}" target="_blank">
                        <span>
                            {'Скачать руководство'|translate} <small class="filename">({$download.name})</small>
                        </span>
                    </a>
                </div>
                {/foreach}
            </div>
            {/if}

            {if $spare->attachments->images.original.url != ''}
            <div class="spare-schema-image">
                <img src="{$spare->attachments->images.original.url}">
            </div>
            {/if}

            {if count($spare -> relations -> spares -> getActiveRecords())}
            <div class="goods g-tile g-tile-with-separate">
                <ul class="goods-l goods-l-in-tabs clearfix g-l catalog-l" name="accessories_items">
                {foreach $spare -> relations -> spares -> getActiveRecords() as $spares_relation}
                    {$spare_record = $spares_relation -> to}
                    {$record = $spare_record}

                    {include file='goods/purchase_goods_id.tpl' scope=parent}

                    <li class="goods-l-i goods-l-i-in-tabs g-l-i g-l-i-list" id="goods{$purchase_goods_id}">
                        {include file="goods/details/tabs/accessories-item-tile.tpl" list="Tab_Spares" record=$spare_record}
                    </li>

                    {if count($spare_record -> relations -> spares_goods -> getActiveRecords())}
                        {foreach $spare_record -> relations -> spares_goods -> getActiveRecords() as $spare_goods_relation}
                            {$spare_goods_record = $spare_goods_relation -> to}
                            {$record = $spare_goods_record}

                            {include file='goods/purchase_goods_id.tpl' scope=parent}

                            <li class="goods-l-i goods-l-i-in-tabs g-l-i g-l-i-list" id="goods{$purchase_goods_id}">
                                {include file="goods/details/tabs/accessories-item-tile.tpl" list="Tab_Spares" record=$spare_goods_record}
                            </li>
                        {/foreach}
                    {/if}
                {/foreach}
                </ul>
            </div>
            {/if}
        </div>
        {/foreach}
    </div>
    {else}
    <p>{'На данный момент данных по запчастям нет'|translate}.</p>
    {/if}
</div>