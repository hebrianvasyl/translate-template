<div id="recent_goods"></div>

{*
{RecentGoods->getGoods assign="recent_goods"}
<div class="content" name="recent-goods-block">
    <section class="g slider padding-in">
        <header class="recent-viewed-head">
            <div class="recent-viewed-title">Товары, которые вы смотрели</div>
        </header>
        <div class="slider tab-content-scroll catalog" id="recent_goods_carousel">
            <a href="#" class="btn btn-rt carousel_control_right" name="carousel_control_right"><img class="btn-img sprite" width="57" height="57" alt="" src="{$settings.path.design}/_.gif"></a>
            <a href="#" class="btn btn-lt carousel_control_left" name="carousel_control_left"><img class="btn-img sprite" width="57" height="57" alt="" src="{$settings.path.design}/_.gif"></a>
            <div class="scroll-block slider-i g hits g-tile">
                <ul class="g-l catalog-l clearfix recent-carousel" name="carousel_container">
                    {foreach from=$recent_goods item="record"}

                    {include file='goods/purchase_goods_id.tpl' scope=parent}

                    <li class="goods-l-i goods-l-i-in-tabs g-l-i g-l-i-list float-lt" id="goods{$purchase_goods_id}" name="carousel_element">
                        {include file='goods/catalog/goods-tile.tpl' scope=parent}
                    </li>
                    {/foreach}
                </ul>
            </div>
        </div>

        <script>
            var Carousel = new Carousel_class('recent_goods_carousel');
            {literal}
            Carousel.setOptions({
                control_size: 0,
                scroll_count: 5,
                controls_css: {
                    prev: 'carousel_control_left_disabled',
                    next: 'carousel_control_right_disabled'
                }
            });
            {/literal}
            Carousel.run();
        </script>
    </section>
</div>
*}