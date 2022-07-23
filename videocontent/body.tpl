    <section class="b-static b-static-no-margin online-consultant clearfix" id="articles-parent">

        {include file="breadcrumbs.tpl" show_last_breadcrumb=1}

        {include file="static-pages-menu-help.tpl"}

        <div class="b-static-content">

            <div class="videocontent">
                {if ($menu.active != $menu.www->videocontent) && $menu.active.record->isRecord()}

                    <div class="grey news-date">
                         {$menu.active.record.created|@date_format:"%e"}
                         {$menu.active.record.created|@date_format:"%m"|@month_title:genitive}
                         {$menu.active.record.created|@date_format:"%Y"}
                    </div>

                    <h1 class="b-static-title">{$menu.active.record.title}</h1>

                    {if isset($menu.active.record) && !empty($menu.active.record->videolink)}
                    <div class="details-video">
                        <iframe width="840" height="470" src="{$menu.active.record->videolink}" frameborder="0" allowfullscreen></iframe>
                    </div>
                    {/if}

                    <div class="details b-rich-text">
                        {$menu.active.record->text|@html_entity_decode nofilter}
                    </div>

                    <div class="return-to-list">
                        <span class="btn-link btn-link-blue">
                            <a class="btn-link-i" href="{$menu.www->videocontent.href}">Вернуться к списку</a>
                        </span>
                    </div>

                    {include file="social-buttons.tpl"}

                {else}

                    <ul class="tile news-l" name="videocontent_list">
                        {include file="videocontent/body-list.tpl"}
                    </ul>

                    {include file="body-page-navigation.tpl" pos='videocontent'}

                {/if}
            </div>
        </div>
    </section>
    <script type="text/javascript" src="/{$menu.www->videocontent}/NewPopup.class.js"></script>
    <script>
        $$('[data-role="popup-show"]').each(function(button){
            var popup   = new NewPopup_class('{template_js_fetch file="_jst/popup-light.jst"}');
            var videolink = button.get('data-url');
            if(videolink) {
                var patt = new RegExp(/:\/\//);

                if(patt.test(videolink) == false) {
                    videolink = 'https://www.youtube.com/embed/' + videolink;
                } else {
                    var patt = new RegExp(/youtu\.be\/(.*)$/);
                    if(patt.test(videolink) == true) {
                        var id = patt.exec(videolink);
                        if(id.length > 1) {
                            videolink = 'https://www.youtube.com/embed/' + id[1];
                        }
                    }

                    var patt = new RegExp(/watch\?v=(.*)$/);
                    if(patt.test(videolink) == true) {
                        var id = patt.exec(videolink);
                        if(id.length > 1) {
                            videolink = 'https://www.youtube.com/embed/' + id[1];
                        }
                    }
                }

                var content = '<iframe width="650" height="365" src="'+videolink+'" frameborder="0" allowfullscreen></iframe>';
            }

            if (content) {
                popup.setContent(content);
                popup.addEvent('close', function(){
                    history.pushState('', document.title, window.location.pathname);
                });

                button.addEvent('click', function (event) {
                    popup.overlayON();
                    if(event) {
                        event.stop();
                    }
                    popup.open();

                    window.location.hash = button.get('href');
                });
            }
        });
        if(window.location.hash) {
            var id = window.location.hash;
            while(id.charAt(0) === '#')
                id = id.substr(1);

            if(isNaN(id) === false) {
                var button = $('video-' + id);

                {literal}
                button.fireEvent('click', {
                    stop: function(){}
                });
                {/literal}
            }
        }
    </script>
</div>

<div class="content body-layout wrap overflow-hidden clearfix">
    <div class="body-layout clearfix">
        {include file="my/recent_goods/recent_goods_block.tpl"}

        {include file="block-help.tpl"}

        <div class="h-50"></div>
    </div>