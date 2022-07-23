<div class="social-widgets">
    <div class="container">
        <div class="item" id="youtube_widget">
            <div class="title"><span>Наш канал</span><img src="{$settings.path.design}/youtube_widget.png"></div>
            <div class="g-ytsubscribe" data-channelid="UC0rzaRCiZVosKaFLkgckTtg" data-layout="full" data-count="default"></div>
        </div>
        <div class="item" id="vk_widget"></div>
        <div class="item" id="fb_widget"></div>
    </div>
</div>

<script src="https://apis.google.com/js/platform.js"></script>
<script>

App.addOnDomReady(function(){
//	var vk = '<iframe name="fXD20877147" width="100%" scrolling="no" height="247" frameborder="0" style="overflow: hidden; height: 247px;" src="http://vk.com/widget_groups.php?app=0&amp;width=224px&amp;gid=129740351&amp;mode=1&amp;height=247&amp;no_cover=1"></iframe>';
//	var vkL = '<iframe name="fXD20877147" width="100%" scrolling="no" height="247" frameborder="0" style="overflow: hidden; height: 247px;" src="http://vk.com/widget_groups.php?app=0&amp;width=224px&amp;gid=129740351&amp;mode=1&amp;height=247&amp;no_cover=1"></iframe>';

//	var fb = '<iframe scrolling="no" frameborder="0" allowtransparency="true" style="border:medium none;overflow:hidden;width:100%;height:330px;" src="https://www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2FIntexPool.ua&width=200&height=295&connections=6&stream=false&header=true"></iframe>';
//	var fbL = '<iframe scrolling="no" frameborder="0" allowtransparency="true" style="border:medium none;overflow:hidden;width:100%;height:300px;" src="https://www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2FIntexPool.ua&width=238&height=265&connections=8&stream=false&header=true"></iframe>';

	if (document.body.clientWidth <= '1600'){
//		$('vk_widget').set('html', vk);
//		$('fb_widget').set('html', fb);
	  }else{
//		$('vk_widget').set('html', vkL);
//		$('fb_widget').set('html', fbL);
	}

	window.addEvent('resize', function(){
		if (document.body.clientWidth <= '1600'){
//			$('vk_widget').set('html', vk);
//			$('fb_widget').set('html', fb);
		  }else{
//			$('vk_widget').set('html', vkL);
//			$('fb_widget').set('html', fbL);
		}
	})

});

 </script>
