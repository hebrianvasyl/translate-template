{if isset($catalog_records) && count($catalog_records)}
	{foreach $catalog_records as $record}
		<li class="news-l-i clearfix">
			<a href="{$record.external_href}" class="news-l-i-link float-lt">
                <div class="hover_bg">
                    <div class="additional-info-block">
                        <div class="inner">Дополнительная информация</div>
                    </div>
                </div>
				{if $record->goods_description and !empty($record->goods_description->attachments) && count($record->goods_description->attachments->icon_hover)}
                    <div class="icon_hover hidden">
                        {$record->goods_description->attachments->icon_hover.original nofilter}
                    </div>
				{elseif !empty($record->attachments) && count($record->attachments->icon_hover)}
					<div class="icon_hover hidden">
						{$record->attachments->icon_hover.original nofilter}
					</div>
				{/if}
				<div class="icon">
                    {if $record->goods_description and count($record->goods_description->attachments->icon)}
                        {$record->goods_description->attachments->icon.original nofilter}
					{elseif count($record->attachments->icon)}
						{$record->attachments->icon.original nofilter}
					{/if}

                    {if $record->goods_description and $record->goods_description->getBanner()}
                    <div class="banner-template banner-template-square">
                        {$record->goods_description->getBanner() nofilter}
                    </div>
                    {/if}
				</div>
				<div class="news-l-i-content">
					<h3 class="news-l-i-title">{$record.title|replace:'/*br*/':'<br>' nofilter}</h3>
				</div>
			</a>
		</li>
	{/foreach}
{else}
	На данный момент статей и обзоров нет
{/if}