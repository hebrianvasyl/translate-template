{Videocontent->getRecords goods_section=$section->getGoodsSection() is_section=$smarty.const.OWOX_RECORD relation_name="video_section_to_goods_sections" limit=3 assign="video"}


{if !empty($video)}
	<div class="sidebar-i sidebar-i-content">
		<h2 class="sidebar-i-content-title clearfix">
			<a class="sidebar-i-content-title-link" href="{$menu->videocontent.href}">{'Видео'|translate}</a>
		</h2>
		<ul class="sidebar-i-content-l">
			{foreach $video as $video_record}
				<li class="sidebar-i-content-l-i clearfix" class="item">
					{if $video_record->attachments->icon|@count}
						<a class="sidebar-i-content-l-i-text-img" href="{$video_record.external_href}">
							{if isset($video_record->attachments->icon.small.url) and !empty($video_record->attachments->icon.small.url) and ($video_record->attachments->icon.small.url != 'https://i.intexpool.ua/videocontent/0/_.gif')}
								<span class="small-icon">
									{$video_record->attachments->icon.small nofilter}
								</span>
							{else}
								<span class="original-icon">
									{$video_record->attachments->icon.original nofilter}
								</span>
							{/if}
						</a>
					{/if}
					<a class="sidebar-i-content-l-i-text" href="{$video_record.external_href}">{$video_record.title}</a>
				</li>
			{/foreach}
		</ul>
		<a class="show-more-link" href="{$menu->videocontent.href}"><span>{'Все видео'|translate}</span> &#8594;</a>
	</div>
{/if}