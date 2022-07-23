    <script type="text/javascript">
        var google_tag_params = {
            dynx_pagetype: 'home'
        };
    </script>

    <div class="body-layout clearfix">

        <div class="site-content main">

            <div class="mainpage-top-wrap">

                <div style="display: flex; justify-content: space-between;">
                    <div class="mainpage-big-promo-wrap">
                        {include file="main/body-bigpromo.tpl"}
                    </div>

                    <div class="catalog-item-menu" onclick="CatalogOpen()">
                        <div class="catalog-item-menu-icon"><svg viewBox="0 0 24 24" id="icon-catalog">
                                <g clip-rule="evenodd" fill-rule="evenodd">
                                    <path
                                            d="m17 2.75735-4.2427 4.24264 4.2427 4.24261 4.2426-4.24261zm-5.6569 2.82843c-.7811.78104-.7811 2.04738 0 2.82842l4.2426 4.2427c.7811.781 2.0475.781 2.8285 0l4.2426-4.2427c.781-.78104.781-2.04738 0-2.82842l-4.2426-4.24264c-.781-.781048-2.0474-.781048-2.8285 0z">
                                    </path>
                                    <path
                                            d="m7 4h-4c-.55228 0-1 .44772-1 1v4c0 .5523.44772 1 1 1h4c.55228 0 1-.4477 1-1v-4c0-.55228-.44772-1-1-1zm-4-2c-1.65685 0-3 1.34315-3 3v4c0 1.6569 1.34315 3 3 3h4c1.65685 0 3-1.3431 3-3v-4c0-1.65685-1.34315-3-3-3z">
                                    </path>
                                    <path
                                            d="m7 16h-4c-.55228 0-1 .4477-1 1v4c0 .5523.44772 1 1 1h4c.55228 0 1-.4477 1-1v-4c0-.5523-.44772-1-1-1zm-4-2c-1.65685 0-3 1.3431-3 3v4c0 1.6569 1.34315 3 3 3h4c1.65685 0 3-1.3431 3-3v-4c0-1.6569-1.34315-3-3-3z">
                                    </path>
                                    <path
                                            d="m19 16h-4c-.5523 0-1 .4477-1 1v4c0 .5523.4477 1 1 1h4c.5523 0 1-.4477 1-1v-4c0-.5523-.4477-1-1-1zm-4-2c-1.6569 0-3 1.3431-3 3v4c0 1.6569 1.3431 3 3 3h4c1.6569 0 3-1.3431 3-3v-4c0-1.6569-1.3431-3-3-3z">
                                    </path>
                                </g>
                            </svg>
                        </div>
                        <div class="catalog-item-menu-text">Каталог товаров</div>
                    </div>

                    <div class="banners">
                        {include file="main/body-banner-block-1.tpl"}
                    </div>
                </div>

                {include file="main/body-top_sections-block.tpl"}

            </div>

            {Banners->getHelpBanners slot="help" limit="5" assign="help_banners"}

            {Videos->getOnlineConsultantHomepageVideos assign="videos"}

            {if count($videos) > 0}
            <div id="mainpage-help-banners" class="mainpage-top-wrap">
                <section class="m-filter">
                    <div class="m-filter-title">Онлайн консультант</div>
                    <nav>
                        <ul class="m-filter-l">

                            {foreach $videos as $video}
                            <li class="m-filter-l-i">
                                <a href="#" class="m-filter-l-i-link" data-role="popup-show" data-url="{$video.url}">
                                    <div class="m-filter-l-i-img">
                                        <img alt="{$video.title|replace:'/*br*/':' '|replace:'<br>':' '}" title="{$video.title|replace:'/*br*/':' '|replace:'<br>':' '}" src="{$video.image}" width="auto" height="auto">
                                    </div>
                                    <span class="m-filter-l-i-link-text">
                                        {$video.title|replace:'/*br*/':'<br>'|escape:'quotes' nofilter}
                                    </span>
                                </a>
                            </li>
                            {/foreach}

                        </ul>
                    </nav>
                </section>
            </div>

            <script type="text/javascript" src="/{$menu.www->videocontent}/NewPopup.class.js"></script>

            <script>
                var popup   = new NewPopup_class('{template_js_fetch file="_jst/popup-light.jst"}');
                var wrap = $('mainpage-help-banners');

                wrap.getElements('a[data-role="popup-show"]').each(function(element) {
                    element.addEvent('click', function(event) {
                        event.preventDefault();

                        var videolink = element.get('data-url');

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

                        if(content) {
                            popup.setContent(content);
                            popup.addEvent('close', function(){
                                history.pushState('', document.title, window.location.pathname);
                            });

                            popup.overlayON();
                            if(event) {
                                event.stop();
                            }
                            popup.open();
                        }

                        return false;
                    });
                });
            </script>
            {/if}

        </div>

    </div>

</div>

<div class="content body-layout wrap overflow-hidden clearfix">

    <div class="body-layout clearfix">

        <div class="site-content main">
            <div class="mainpage-middle-wrap clearfix">

                <div class="mainpage-middle-left-column">

                    {include file="my/recent_goods/recent_goods_block.tpl"}

                    {include file="main/body-main-container.tpl"}

                </div>

            </div>

        </div>

        <div class="site-content main">

            <div class="clearfix">

                <div class="intexpool-help">
                    <h4>Помощь от IntexPool</h4>
                    <div class="bg">
                        <div class="content">
                          <div class="content-title">Полезная и необходимая информация</div>
                          <p>О продукции Intex и Bestway</p>
                        </div>
                        <ul>
                          <li><a href="{$menu.www->qa.href}">Вопросы и ответы</a></li>
                          <li><a href="{$menu.www->articles.href}">Советы - Статьи</a></li>
                          <li><a href="{$menu.www->videocontent.href}">Видеоинструкции</a></li>
                        </ul>
                    </div>
                </div>

                <div class="mainpage-social-widgets clearfix">

                    {include file="main/social-widgets.tpl"}

                    {include file="main/body-banner-block-2.tpl"}

                </div>

            </div>

            {include file="main/body-main-container-footer.tpl"}

        </div>

    </div>

    {include file="main/clear-cart-if-need.tpl"}
