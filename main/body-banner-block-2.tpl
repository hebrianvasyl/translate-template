<div class="sidebar-i mainpage-social-widgets-col" id="main2" name="banner-block"></div>
<script type="text/javascript">
	var b2 = {Banners->getBanners slot="main_small_banner"};
    var index = 0;

	if (b2 && b2.length) {
        var html = '';

        if(b2.length == 1) {
            var banner = b2.getRandom();
            banner['alt'] = 'Главная. №2 - ' + banner['alt'].replace(/<br>/g, ' ');

            html += App.getHTML("{template_js_fetch file='_jst/banner.jst'}", banner);
            $('main2').addClass('banners-i-link banners-i-link-img').set('html', html);
        } else if(b2.length == 2) {
            var html = '';

            b2[0]['alt'] = 'Главная. №2 - ' + b2[0]['alt'].replace(/<br>/g, ' ');
            b2[1]['alt'] = 'Главная. №2 - ' + b2[1]['alt'].replace(/<br>/g, ' ');

            html += App.getHTML("{template_js_fetch file='_jst/banner.jst'}", b2[0]);
            html += App.getHTML("{template_js_fetch file='_jst/banner.jst'}", b2[1]);

            $('main2').addClass('banners-i-link banners-i-link-img').set('html', html);
        } else {
            var generateRandom = function (min, max, except) {
                var num = Math.floor(Math.random() * (max - min)) + min;
                return (num === except) ? generateRandom(min, max, except) : num;
            };

            var get2banners = function(){
                var length = b2.length - 1;

                var html = '';

                var index1 = generateRandom(0, length, -1);
                var banner1 = b2[index1];
                banner1['alt'] = 'Главная. №2 - ' + banner1['alt'].replace(/<br>/g, ' ');

                var index2 = generateRandom(0, length, index1);
                var banner2 = b2[index2];
                banner2['alt'] = 'Главная. №2 - ' + banner2['alt'].replace(/<br>/g, ' ');

                html += App.getHTML("{template_js_fetch file='_jst/banner.jst'}",banner1);
                html += App.getHTML("{template_js_fetch file='_jst/banner.jst'}",banner2);

                $('main2').addClass('banners-i-link banners-i-link-img').set('html', html);
            };

            get2banners();
        }
    } else {
        $('main2').addClass('hidden');
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