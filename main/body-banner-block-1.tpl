<div class="sidebar-i" id="main1" name="banner-block"></div>
<script type="text/javascript">
	var b1 = {Banners->getBanners slot="main_small_banner"};

    if (b1 && b1.length) {
        var html = '';

        if(b1.length == 1) {
            var banner = b1.getRandom();
            banner['alt'] = '{'Главная'|translate}. №1 - ' + banner['alt'].replace(/<br>/g, ' ');

            html += App.getHTML("{template_js_fetch file='_jst/banner.jst'}", banner);
            $('main1').addClass('banners-i-link banners-i-link-img').set('html', html);
        } else if(b1.length == 2) {
            var html = '';

            b1[0]['alt'] = '{'Главная'|translate}. №1 - ' + b1[0]['alt'].replace(/<br>/g, ' ');
            b1[1]['alt'] = '{'Главная'|translate}. №1 - ' + b1[1]['alt'].replace(/<br>/g, ' ');

            html += App.getHTML("{template_js_fetch file='_jst/banner.jst'}", b1[0]);
            html += App.getHTML("{template_js_fetch file='_jst/banner.jst'}", b1[1]);

            $('main1').addClass('banners-i-link banners-i-link-img').set('html', html);
        } else {
            var generateRandom = function (min, max, except) {
                var num = Math.floor(Math.random() * (max - min)) + min;
                return (num === except) ? generateRandom(min, max, except) : num;
            };

            var get2banners = function(){
                var length = b1.length - 1;

                var html = '';

                var index1 = generateRandom(0, length, -1);
                var banner1 = b1[index1];
                banner1['alt'] = '{'Главная'|translate}. №1 - ' + banner1['alt'].replace(/<br>/g, ' ');

                var index2 = generateRandom(0, length, index1);
                var banner2 = b1[index2];
                banner2['alt'] = '{'Главная'|translate}. №1 - ' + banner2['alt'].replace(/<br>/g, ' ');

                html += App.getHTML("{template_js_fetch file='_jst/banner.jst'}",banner1);
                html += App.getHTML("{template_js_fetch file='_jst/banner.jst'}",banner2);

                $('main1').addClass('banners-i-link banners-i-link-img').set('html', html);
            };

            get2banners();
        }
    } else {
        $('main1').addClass('hidden');
    }

	// var banner = b1.getRandom();
    // banner['alt'] = 'Главная. №1 - ' + banner['alt'].replace(/<br>/g, ' ');
    //
	// if (b1 && b1.length) {
    //     $('main1').addClass('banners-i-link').set('html', App.getHTML("{template_js_fetch file='_jst/banner.jst'}", banner));
    // } else {
    //     $('main1').addClass('hidden');
	// }
</script>