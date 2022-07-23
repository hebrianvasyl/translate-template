<!doctype html>
<html lang="ru">
{include file="head5.tpl"}
<body>
{include file="gtm-code.tpl"}
	<div class="body">
		{include file="content-header.tpl"}
		<div class="content body-layout wrap clearfix sub_menu">

			{Controller->getBody}

		</div>

		{if isset($seo_header)}
			<div class="seo">
				<div class="container">
					<h3>{$seo_header}</h3>
				</div>
			</div>
		{/if}

		{if isset($seo_bottom)}
		<div class="seo">
			<div class="container">
				{$seo_bottom}
			</div>
		</div>
		{/if}
		<!--[if IE 8]><div class="pre-footer"></div><![endif]-->
	</div>

{$head.js.footer nofilter}
<div class="preload"></div>

{include file="content-footer.tpl"}

<a href="#" class="scroll-top-btn hidden" id="scroll-top-button" onclick="document.fireEvent('scrollToTopClick');" style="visibility: visible; zoom: 1;">
    <img src="{$settings.path.design}/scroll-top-btn-icon.png" class="scroll-top-btn-icon" alt="▲">
</a>

<script>
var scroll_fx = new Fx.Scroll(window);
var to_top = $('scroll-top-button');

to_top.addEvent('click', function() {
    scroll_fx.toTop();
});

var checkScroll = function() {
    var body_scroll = document.body.getScroll();
    if(body_scroll.y > 150) {
        to_top.removeClass('hidden');
    } else {
        to_top.addClass('hidden');
    }
};

checkScroll();

window.addEvent('scroll', function(e) {
    checkScroll();
});
</script>

<!-- current time: {$smarty.now|date_format:"%A, %B %e, %Y %T"} -->

<!-- Load Facebook SDK for JavaScript -->
<div id="fb-root"></div>
<script>
    var d = new Date();
    var n = d.getHours();

    if(n > 9 && n < 18) {
        window.fbAsyncInit = function() {
            FB.init({
                xfbml            : true,
                version          : 'v7.0'
            });
        };

        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = 'https://connect.facebook.net/uk_UA/sdk/xfbml.customerchat.js';
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    }
</script>

<!-- Your Chat Plugin code -->
<div class="fb-customerchat"
        attribution=setup_tool
        page_id="379391889115786">
</div>

<script src="/common.js"></script>

</body>
</html>