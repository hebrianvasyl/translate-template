{Promotions->getLast goods_record=$record relation_name="goods" limit=1 only_active_promotions="1" assign="promotion_record"}

{if count($promotion_record)}
	<div class="tag tag-action big"><img src="{$settings.path.design}/_.gif" alt=""></div>
{elseif $record->getFirstTag()}
	<div class="tag tag-{$record->getFirstTag()} big"><img src="{$settings.path.design}/_.gif" alt=""></div>
{/if}

<div class="pp-image-wrap">
	{if !$record->attachments->images.original->isDefault()}
		<div class="pp-image-i-block">
			<div class="pp-image-i">
				<div name="image" class="pp-image-i-img">
					{if $zoom_link}
						<a href="{$record->attachments->images.original.url}" target="_blank">
							<img
								alt="{$record.title|escape:'quotes'}"
								title="{$record.title|escape:'quotes'}"
								src="{$record->attachments->images.large.url}"
								width="{$record->attachments->images.large.width}"
								height="{$record->attachments->images.large.height}"
								class="magnifier-thumb"
								data-large-img-url="{$record->attachments->images.original.url}"
							>
						</a>
					{else}
						<img
							alt="{$record.title|escape:'quotes'}"
							title="{$record.title|escape:'quotes'}"
							src="{$record->attachments->images.large.url}"
							width="{$record->attachments->images.large.width}"
							height="{$record->attachments->images.large.height}"
							class="magnifier-thumb"
							data-large-img-url="{$record->attachments->images.original.url}"
						>
					{/if}
				</div>
			</div>
		</div>
	{else}
		{$record->attachments->images.large nofilter}
	{/if}
</div>

{*<div id="magnifier" class="magnifier-preview" style="width: 200px; height: 200px;"></div>*}
{*<script>*}
	{*var e = new jsClasses.Event(),*}
		{*m = new jsClasses.Magnifier(e);*}

	{*m.attach({*}
		{*thumb: '.magnifier-thumb',*}
		{*mode: 'outside',*}
		{*largeWrapper: 'magnifier'*}
	{*});*}
{*</script>*}