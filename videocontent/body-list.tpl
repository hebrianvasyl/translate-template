{if isset($catalog_records) && count($catalog_records)}
	{foreach $catalog_records as $record}
		<li class="news-l-i clearfix">
			<a href="#{$record.id}" id="video-{$record.id}" data-role="popup-show" data-url="{$record.videolink}" class="news-l-i-link float-lt">
                <div class="hover_bg">
                    <div class="additional-info-block">
                        <div class="inner">Смотреть видео</div>
                    </div>
                </div>
				{if $record.image_hover}
                <div class="icon_hover hidden">
                    <img src="{$record.image_hover}" alt="{$record.title|replace:'/*br*/':' '|replace:'<br>':' '}">
                </div>
				{/if}
				<div class="icon">
					{if $record.image}
                        <img src="{$record.image}" alt="{$record.title|replace:'/*br*/':' '|replace:'<br>':' '}">
					{/if}

                    {if $record.goods_video and $record.goods_video->getBanner()}
                    <div class="banner-template banner-template-square">
                        {$record.goods_video->getBanner() nofilter}
                    </div>
                    {/if}
				</div>
				<div class="news-l-i-content">
					<h3 class="news-l-i-title">
                        {$record.title|replace:'/*br*/':'<br>'|escape:'quotes' nofilter}
                    </h3>
				</div>
			</a>
		</li>
	{/foreach}
{else}
	На данный момент видео нет
{/if}