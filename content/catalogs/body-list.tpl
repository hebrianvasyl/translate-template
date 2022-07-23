{if isset($catalog_records) && count($catalog_records)}
	{foreach $catalog_records as $record}
        {if !empty($record.link)}
		<li class="news-l-i clearfix">
			<a href="{$record.link}" class="news-l-i-link float-lt" target="_blank">
					<div class="hover_bg">
						<div class="additional-info-block">
							<div class="inner">Скачать каталог</div>
						</div>
					</div>
				{if !empty($record->attachments) && count($record->attachments->icon_hover)}
					<div class="icon_hover hidden">
						{$record->attachments->icon_hover.original nofilter}
					</div>
				{/if}
				<div class="icon">
					{if count($record->attachments->icon)}
						{$record->attachments->icon.original nofilter}
					{/if}
				</div>
				<div class="news-l-i-content">
					<h3 class="news-l-i-title">{$record.title|replace:'/*br*/':'<br>' nofilter}</h3>
				</div>
			</a>
		</li>
        {/if}
	{/foreach}
{else}
	На данный момент каталогов нет
{/if}