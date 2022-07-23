<div class="item mainpage-social-widgets-col" id="youtube_widget">
    <div class="title"><span>Наш канал</span><img src="{$settings.path.design}/youtube_widget.png"></div>
    <div class="description"><p>Большое количество полезных видеообзоров, рекомендаций<br>и инструкций.</p><p>Подписывайся на наш канал!</p></div>
    <div class="g-ytsubscribe" data-channelid="UC0rzaRCiZVosKaFLkgckTtg" data-layout="full" data-count="default"></div>
</div>
<div class="item mainpage-social-widgets-col fb_item" id="fb_widget_help"></div>

<script src="https://apis.google.com/js/platform.js"></script>
<script>
    App.addOnDomReady(function(){
        var fb = '<iframe scrolling="no" frameborder="0" allowtransparency="true" style="border:medium none;overflow:hidden;width:100%;height:289px;" src="https://www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2FIntexPool.ua%2F&tabs=timeline&width=270&height=289&connections=6&small_header=true&adapt_container_width=true&hide_cover=true&show_facepile=true"></iframe>';

        $('fb_widget_help').set('html', fb);

        window.addEvent('resize', function(){
            $('fb_widget_help').set('html', fb);
        });
    });
</script>
