<div class="content body-layout clearfix">
    <div class="catalog-banners clearfix product-description-slider" id="banners_carousel_{$slide_id}">
        <a href="#" class="btn btn-lt carousel_control_left pp-videos-left-btn" name="carousel_control_left" style="left: 0; top: 50%; margin-top: -32px;">
            <img class="btn-img" alt="" src="{$settings.path.design}/_.gif">
        </a>
        <a href="#" class="btn btn-rt carousel_control_right pp-videos-right-btn" name="carousel_control_right" style="right: 0; top: 50%; margin-top: -32px;">
            <img class="btn-img" alt="" src="{$settings.path.design}/_.gif">
        </a>

        <div class="banners_carousel_wrap">
            <ul name="carousel_container">
                {foreach from=$slides item=slide}
                <li name="carousel_element">
                    <a href="{$slide.href}" target="_blank" style="text-decoration: none;">
                        <div style="padding: 20px;" class="blue-price">
                            <div class="image-wrap">
                                <img src="{$slide.image}" alt="{$slide.title}" style="max-width: 100%; max-height: 100%; width: auto; height: auto;" >
                                <div class="show-more">
                                    {'Подробнее'|translate}
                                </div>
                            </div>
                            <div class="g-details-title">
                                {$slide.sub_title_big}
                            </div>
                            <div class="price-block">
                                <span>{'Цена'|translate}:</span>
                                <span class="price">{$slide.price nofilter}</span>
                            </div>
                        </div>
                    </a>
                </li>
                {/foreach}
            </ul>
        </div>
    </div>
</div>
<script type="text/javascript">
    var Carousel_{$slide_id} = new Carousel_class('banners_carousel_{$slide_id}');
    Carousel_{$slide_id}.setOptions(
    {literal}
    {
        control_size: 0,
        controls_css: {
            prev: 'carousel_control_left_disabled',
            next: 'carousel_control_right_disabled'
        },
        scroll_count: 1
    }
    {/literal}
    );
    Carousel_{$slide_id}.run();
</script>