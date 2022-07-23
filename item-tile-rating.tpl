<div class="b-rating clearfix">
	<div itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
        <meta itemprop="ratingValue" content="{if $record.users_rating > 0}{$record.users_rating}{else}5{/if}">
        <meta itemprop="bestRating" content="5">
        <meta itemprop="reviewCount" content="{if $record->users_rating.count_comments > 0}{$record->users_rating.count_comments}{else}1{/if}">
        <meta itemprop="itemreviewed" content="{$record.title}" />
	</div>
	<div class="rating float-lt">
		<div class="rating-i" style="width:{$record.users_rating*20}%"></div>
	</div>

	{if strpos($record.external_href, '#') !== false}
		{$comments_url = "{$record.external_href}tab=comments"}
	{else}
		{$comments_url = "{$record.external_href}#tab=comments"}
	{/if}
	{if $record->users_rating.count_comments}
	<div class="rating-content float-rt">
		<a name="switch_to_comments" class="novisited" href="{$comments_url}">{$record->users_rating.count_comments} отзыв{$record->users_rating.count_comments|@morphology}</a>
	</div>
	{else}
	<div class="rating-content float-rt">
		<a name="switch_to_comments" class="novisited" href="{$comments_url}">оставь отзыв</a>
	</div>
	{/if}
</div>