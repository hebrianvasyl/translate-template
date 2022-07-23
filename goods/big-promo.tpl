{Banners->getBannerBigPromo slot="section_slider" goods="{$record}" attachment_name="banner_slider" limit="10" assign="banners"}
<div class="b-promo {if $banners == 'null'}without-banner{/if}">
	{if $banners != 'null'}
		<div id="big-promo" class="b-promo"></div>
		<script type="text/javascript">
			var BigPromo = new BigPromo_class('big-promo',{$banners nofilter}).setOptions({
				image_selector:'ul[name=images] li',
				pages: 'ul[name=pages] li',
				navigator: true,
				paginator: true,
                tpl: '{template_script_fetch file="goods/_jst/big-promo.jst" jst=1}'
			}).init();
		</script>
	{/if}
</div>
<script>

	/*{* Enhanced события  *}*/
	new GTMEvents([
		{ //клик по баннерам bigPromo
			selector: '#big-promo [name=image_block] a',
			event: 'click',
			gtm_data: {
				event: "EnhancedOWOX",
				eventCategory: 'Banner',
				eventAction: 'promotionClick'
			}
		}
	]).setOptions({ "gtm_attribute_name": "enhanced-gtm-data"});

	new GTMEvents([
		{ //перелистывание стрелками
			selector: '#big-promo #navigator_left, #big-promo #navigator_right',
			event: 'click',
			gtm_data: {
				event: "OWOX",
				eventCategory: 'Banner',
				eventAction: 'scroll',
				eventLabel:null
			}
		},
		{ //переключание через radio-buttons
			selector: '#big-promo [name=pages] a',
			event: 'click',
			gtm_data: {
				event: "OWOX",
				eventCategory: 'Banner',
				eventAction: 'scroll',
				eventLabel:null
			}
		}
	]);


</script>