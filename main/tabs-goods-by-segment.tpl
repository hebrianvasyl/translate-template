{if !empty($records) and count($records)}
{assign var=records value=$records|array_slice:0:10}

<div class="g hits g-tile">
	<ul class="g-l catalog-l clearfix">
	{foreach from=$records item="record"}
		<li class="g-l-i">
			{include file="goods/catalog/goods-tile.tpl" record=$record pos='segments'}
		</li>
	{/foreach}
	</ul>
</div>
<div id="goods-tabs-content-all-link"></div>
{/if}