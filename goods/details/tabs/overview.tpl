<aside class="sidebar float-rt">
	{include file="details/sidebar-accessories.tpl"}
</aside>

<div class="tabs-content-wrap {if !empty($accessories) and count($accessories)}tabs-content-with-sidebar{/if}">

	{Articles->getRecords goods_record=$record assign='goods_article'}

		<div class="b-overview">{$goods_article.0.text nofilter}</div>

</div>

{include file="details/similar-models.tpl"}