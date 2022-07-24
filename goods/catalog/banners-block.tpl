<div class="sidebar-i banners">
	<div id="catalog_final1" name="banner-block"></div>
</div>
<script type="text/javascript">
	var b1 = {Banners->getBanners slot="category_small_banner"};
	var time, index = 0;

	if (b1 && b1.length) {
        var html = '';

        if(b1.length == 1) {
            var banner = b1.getRandom();

            var alt = banner['alt'];
            alt = '{'Категория. Правая колонка'|translate}. №1 - ' + alt.replace(/<br>/g, ' ');
            banner['alt'] = alt;

            html += App.getHTML("{template_js_fetch file='_jst/banner.jst'}", banner);

            $('catalog_final1').addClass('banners-i-link banners-i-link-img').set('html', html);
        } else {
            var get2banners = function(){
                var html = '';

                if(index == b1.length) {
                    index = 0;
                }
                var banner1 = b1[index];
                index++;

                if(index == b1.length) {
                    index = 0;
                }
                var banner2 = b1[index];
                index++;

                var canonical_alt1 = banner1['alt'];
				var alt1 = '{'Категория. Правая колонка'|translate}. №1 - ' + canonical_alt1.replace(/<br>/g, ' ');
                banner1['alt'] = alt1;

                var canonical_alt2 = banner2['alt'];
                var alt2 = '{'Категория. Правая колонка'|translate}. №1 - ' + canonical_alt2.replace(/<br>/g, ' ');
                banner2['alt'] = alt2;

                html += App.getHTML("{template_js_fetch file='_jst/banner.jst'}", banner1);
                html += App.getHTML("{template_js_fetch file='_jst/banner.jst'}", banner2);

                banner1['alt'] = canonical_alt1;
                banner2['alt'] = canonical_alt2;

                $('catalog_final1').addClass('two-banners banners-i-link banners-i-link-img').set('html', html);
			};

            get2banners();

            if(b1.length > 2) {
                time = setInterval(get2banners, 10000);

                $('catalog_final1').addEvents({
                    mouseenter: function() {
                        clearInterval(time);
                    },
					mouseleave: function() {
                        time = setInterval(get2banners, 10000);
					}
				});
            }
        }
	} else {
		$('catalog_final1').addClass('hidden');
	}


	/*{* Enhanced события  *}*/
	new GTMEvents([
		{ //клик по баннерам
			selector: '[name=banner-block] a',
			event: 'click',
			gtm_data: {
				event: "EnhancedOWOX",
				eventCategory: 'Banner',
				eventAction: 'promotionClick'
			}
		}
	]).setOptions({ "gtm_attribute_name": "enhanced-gtm-data"});

</script>
