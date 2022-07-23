{Videocontent->getRecords goods_section=$section->getGoodsSection() is_section=$smarty.const.OWOX_RECORD relation_name="goods_sections" limit=5 assign="videos"}

{if !empty($videos)}

	{$all_videos_href = $menu.www->videocontent.href}

	<div class="sidebar-i sidebar-i-content">
		<h2 class="sidebar-i-content-title clearfix">
			<a class="sidebar-i-content-title-link" href="{$menu.www->videocontent.href}">ВИДЕОинструкции</a>
		</h2>
		<ul class="sidebar-i-content-l">

			{foreach $videos as $video}

				<li class="sidebar-i-content-l-i item clearfix">
					{if $video->goods_video and count($video->goods_video->attachments->icon)}
                        <a class="sidebar-i-content-l-i-text-img" href="{$all_videos_href}#{$video.id}" name="sidebar_videocontent_item" title="{$video.title|replace:'/*br*/':' '|replace:'<br>':' ' nofilter}">
                            {if isset($video->goods_video->attachments->icon.small.url) and !empty($video->goods_video->attachments->icon.small.url) and ($video->goods_video->attachments->icon.small.url != 'https://i.intexpool.ua/videocontent/0/_.gif')}
                            <span class="small-icon">
                                <img class="lazyload"
                                        alt="{$video.title|replace:'/*br*/':' '|replace:'<br>':' '|escape:'quotes'}"
                                        title="{$video.title|replace:'/*br*/':' '|replace:'<br>':' '|escape:'quotes'}"
                                        name="videocontent-{$video.id}"
                                        data-src="{$video->goods_video->attachments->icon.small.url}"
                                        width="{$video->goods_video->attachments->icon.small.width}"
                                        height="{$video->goods_video->attachments->icon.small.height}"
                                />
                            </span>
                            {else}
                            <span class="original-icon">
                                <img class="lazyload"
                                        alt="{$video.title|replace:'/*br*/':' '|replace:'<br>':' '|escape:'quotes'}"
                                        title="{$video.title|replace:'/*br*/':' '|replace:'<br>':' '|escape:'quotes'}"
                                        name="videocontent-{$video.id}"
                                        data-src="{$video->goods_video->attachments->icon.original.url}"
                                        width="{$video->goods_video->attachments->icon.original.width}"
                                        height="{$video->goods_video->attachments->icon.original.height}"
                                />
                            </span>
                            {/if}
                        </a>
					{elseif count($video->attachments->icon)}
						<a class="sidebar-i-content-l-i-text-img" href="{$all_videos_href}#{$video.id}" name="sidebar_videocontent_item" title="{$video.title|replace:'/*br*/':' '|replace:'<br>':' ' nofilter}">
							{if isset($video->attachments->icon.small.url) and !empty($video->attachments->icon.small.url) and ($video->attachments->icon.small.url != 'https://i.intexpool.ua/videocontent/0/_.gif')}
								<span class="small-icon">
                                    <img class="lazyload"
                                            alt="{$video.title|replace:'/*br*/':' '|replace:'<br>':' '|escape:'quotes'}"
                                            title="{$video.title|replace:'/*br*/':' '|replace:'<br>':' '|escape:'quotes'}"
                                            name="videocontent-{$video.id}"
                                            data-src="{$video->attachments->icon.small.url}"
                                            width="{$video->attachments->icon.small.width}"
                                            height="{$video->attachments->icon.small.height}"
                                    />
								</span>
							{else}
								<span class="original-icon">
                                    <img class="lazyload"
                                            alt="{$video.title|replace:'/*br*/':' '|replace:'<br>':' '|escape:'quotes'}"
                                            title="{$video.title|replace:'/*br*/':' '|replace:'<br>':' '|escape:'quotes'}"
                                            name="videocontent-{$video.id}"
                                            data-src="{$video->attachments->icon.original.url}"
                                            width="{$video->attachments->icon.original.width}"
                                            height="{$video->attachments->icon.original.height}"
                                    />
								</span>
							{/if}
						</a>
					{/if}
					<a class="sidebar-i-content-l-i-text" href="{$all_videos_href}#{$video.id}" name="sidebar_videocontent_item" title="{$video.title|replace:'/*br*/':' '|replace:'<br>':' ' nofilter}">{$video.title|replace:'/*br*/':'<br>' nofilter}</a>
				</li>

			{/foreach}

		</ul>
		<a class="show-more-link" href="{$all_videos_href}"><span>Просмотреть все советы</span></a>
	</div>

    <script>
        new GTMEvents([
            { //переход на вариант товара
                selector: '[name="sidebar_videocontent_item"]',
                event: 'click',
                gtm_data: {
                    event: "OWOX",
                    eventCategory: 'Catalog',
                    eventAction: 'clickOnVideocontent',
                    eventLabel: { handler: function (event_object) {
                        return event_object.target.getProperty('title');
                    }}
                }
            }
        ]);
    </script>
{/if}