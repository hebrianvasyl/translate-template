{$count_comments = $record->getTotalComments()}
{$rating = $record->getRating()}
<div class="b-rating clearfix">
	<div itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">
		<meta itemprop="ratingValue" content="{if $rating > 0}{$rating}{else}5{/if}">
		<meta itemprop="bestRating" content="5">
		<meta itemprop="reviewCount" content="{if $count_comments > 0}{$count_comments}{else}1{/if}">
        <meta itemprop="itemreviewed" content="{$record.title}" />
	</div>
	<div class="rating float-lt">
		<div class="rating-i" style="width:{$rating*20}%"></div>
	</div>

	{if strpos($record.external_href, '#') !== false}
		{$comments_url = "{$record.external_href}tab=comments"}
	{else}
		{$comments_url = "{$record.external_href}#tab=comments"}
	{/if}
	{if $count_comments}
	<div class="rating-content float-rt">
		<a name="switch_to_comments" class="novisited" href="{$comments_url}">{$count_comments} отзыв{$count_comments|@morphology}</a>
	</div>
	{else}
	<div class="rating-content float-rt">
		<a name="switch_to_comments" class="novisited" href="{$comments_url}">оставь отзыв</a>
	</div>
	{/if}
</div>