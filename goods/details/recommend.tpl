<div class="tabs-content-title">{'Рекомендуем новые модели'|translate}</div>

<div class="tabs section-tabs">
    <div class="slider tab-content-scroll catalog" id="recommend_carousel">
        <a class="btn btn-lt" href="#" name="carousel_control_left"><img class="btn-img"  src="{$settings.path.design}/_.gif"></a>
        <a class="btn btn-rt" href="#" name="carousel_control_right"><img class="btn-img" src="{$settings.path.design}/_.gif"></a>
        <div class="scroll-block slider-i g hits g-tile">
            <ul class="g-l catalog-l clearfix" name="carousel_container">
                {foreach $record -> getGoodsRelations('like') as $item}
                    <li class="g-l-i float-lt" id="goods{$purchase_goods_id}" name="carousel_element">
                        {include file="goods/catalog/goods-tile.tpl" record=$item}
                    </li>
                {/foreach}
            </ul>
        </div>
    </div>
</div>

<script type="text/javascript">
    var Carousel = new Carousel_class('recommend_carousel');
    {literal}
    Carousel.setOptions({
        control_size: 0,
        controls_css: {
            prev: 'carousel_control_left_disabled',
            next: 'carousel_control_right_disabled'
        }
    });
    {/literal}
    Carousel.run();
</script>