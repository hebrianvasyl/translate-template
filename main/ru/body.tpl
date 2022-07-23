<div class="body-layout clearfix">

	<div class="site-content main">

		{include file="main/body-bigpromo.tpl"}

		<aside class="sidebar float-rt">

			<div class="banners">
				{include file="main/body-banner-block.tpl"}
			</div>

			{include file="goods/promotions_block.tpl" show_all_promotions_link=true}

			{include file="main/body-articles-block.tpl"}
			{include file="main/body-news-block.tpl"}
			11
			{include file="main/body-videocontent-block.tpl"}
			{include file="goods/catalog/social-widgets.tpl"}

		</aside>

		{include file="main/body-main-container.tpl"}

		{include file="my/recent_goods/recent_goods_block.tpl"}

		{include file="main/body-main-container-footer.tpl"}

	</div>
</div>

{include file="main/clear-cart-if-need.tpl"}
