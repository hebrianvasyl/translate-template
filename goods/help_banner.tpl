{$help_banner = $record->getHelpBanner()}

{if $help_banner}
<div class="sidebar-block">
    <a id="help-popup-link" href="#" class="help-banner" data-role="popup-show" data-url="{$help_banner.url}">
        <img data-src="{$help_banner->attachments->images.original.url}" class="lazyload" />
    </a>
</div>
<script type="text/javascript" src="/{$menu.www->videocontent}/NewPopup.class.js"></script>
<script>
    var button = $('help-popup-link');
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

        var content = '<iframe width="650" height="365" src="'+videolink+'?rel=0" frameborder="0" allowfullscreen></iframe>';
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
        });
    }
</script>
{/if}