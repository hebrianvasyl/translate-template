<div class="slider tab-content-scroll catalog" id="{$id}_carousel">
	<a href="#" class="btn btn-rt carousel_control_right" name="carousel_control_right"><img class="btn-img sprite lazyload" width="57" height="57" alt="_" data-src="{$settings.path.design}/_.gif"></a>
	<a href="#" class="btn btn-lt carousel_control_left" name="carousel_control_left"><img class="btn-img sprite lazyload" width="57" height="57" alt="_" data-src="{$settings.path.design}/_.gif"></a>
	<div class="scroll-block slider-i g hits g-tile">
		<ul class="g-l catalog-l clearfix" name="carousel_container">
			{if count($items)}
				{foreach from=$items item="record"}
					<li class="g-l-i float-lt" name="carousel_element">
                        {include file="goods/catalog/goods-tile.tpl" record=$record}
					</li>
				{/foreach}
			{/if}
		</ul>
	</div>
</div>
