{Banners->getBanners slot="also_need" goods=$section limit="5" assign="banners"}
{assign var=banners value=$banners|json_decode:1}
{if count($banners) > 0}
<div class="catalog-banners-wrap">
	<div class="content body-layout wrap clearfix">
		<div class="title">{'Также Вам понадобится'|translate}</div>

		<div class="catalog-banners clearfix" id="banners_carousel">
			<a href="#" class="btn btn-lt carousel_control_left pp-videos-left-btn" name="carousel_control_left"><img class="btn-img lazyload" alt="" data-src="{$settings.path.design}/_.gif"></a>
			<a href="#" class="btn btn-rt carousel_control_right pp-videos-right-btn" name="carousel_control_right"><img class="btn-img lazyload" alt="" data-src="{$settings.path.design}/_.gif"></a>

			<div class="banners_carousel_wrap">
				<ul name="carousel_container">
					{foreach $banners as $banner}
						<li name="carousel_element">
							<a  href="{$banner.url}"
                                target="_blank"
                                enhanced-gtm-data='{
                                    "eventLabel": "{'Раздел. Футер.'|translate} №1 - {$banner.alt|replace:'/*br*/':' '|replace:'<br>':' '|escape:'quotes' nofilter}",
                                    "ecommerce": {
                                        "promoClick": {
                                            "promotions": [
                                                {
                                                    "id": {$banner.id},
                                                    "name": "{$banner.alt|replace:'/*br*/':' '|replace:'<br>':' '|escape:'quotes' nofilter}"
                                                }]
                                        }
                                    }
                                }'
                            >
								<div class="hover_bg"></div>
								{if $banner.src_hover}
								<div class="icon_hover hidden">
									<img data-src="{$banner.src_hover}" alt="{$banner.alt|replace:'/*br*/':' '|escape:'quotes' nofilter}" class="lazyload">
								</div>
								{/if}
								<div class="icon">
                                    {if $banner.template}
                                    <div class="banner-template banner-template-square">
                                        {$banner.template nofilter}
                                    </div>
                                    {else}
										{if $banner.price}
											<div class="banner-price" style="top:{$banner.images_price_position_top}%;left:{$banner.images_price_position_left}%">
												<span>{$banner.price nofilter}</span>
											</div>
										{/if}
										{if $banner.src}
											<img data-src="{$banner.src}" alt="{$banner.alt|replace:'/*br*/':' '|escape:'quotes' nofilter}" class="lazyload">
										{/if}
                                    {/if}
								</div>
								{*if !$banner.template}
								<h5>{$banner.alt|replace:'/*br*/':'<br>'|escape:'quotes' nofilter}</h5>
								{/if*}
							</a>
						</li>
					{/foreach}
				</ul>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var Carousel = new Carousel_class('banners_carousel');
	{literal}
	Carousel.setOptions({
		control_size: 0,
		controls_css: {
			prev: 'carousel_control_left_disabled',
			next: 'carousel_control_right_disabled'
		},
		scroll_count: 1
	});
	{/literal}
	Carousel.run();

    new GTMEvents([
        { //клик по баннерам
            selector: '[name=carousel_element] a',
            event: 'click',
            gtm_data: {
                event: "EnhancedOWOX",
                eventCategory: 'Banner',
                eventAction: 'promotionClick'
            }
        }
    ]).setOptions({ "gtm_attribute_name": "enhanced-gtm-data"});
</script>
{/if}