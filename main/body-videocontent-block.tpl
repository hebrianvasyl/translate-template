{Videocontent->getLast assign=video limit=3}
{if count($video)}
	<div class="sidebar-i sidebar-i-content news">
		<h2 class="sidebar-i-content-title clearfix">
			<a class="sidebar-i-content-title-link" href="{$menu->videocontent.href}">{'Видео'|translate}</a>
		</h2>
		<ul class="sidebar-i-content-l">
			{foreach $video as $video_record}
				<li class="sidebar-i-content-l-i clearfix" class="item">
					{if !empty($video_record->attachments) && count($video_record->attachments->icon)}
						<a class="sidebar-i-content-l-i-text-img" href="{$video_record.external_href}">
							{$video_record->attachments->icon.small nofilter}
						</a>
					{/if}
					<a class="sidebar-i-content-l-i-text" href="{$video_record.external_href}">{$video_record.title}</a>
				</li>
			{/foreach}
		</ul>
		<a class="show-more-link" href="{$menu->videocontent.href}"><span>{'Все видео'|translate}</span> &#8594;</a>
	</div>
{/if}