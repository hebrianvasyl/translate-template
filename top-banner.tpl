{Banners->getBanners slot="top" limit="1" assign="banners"}
{if $banners != 'null'}
{$banners = json_decode($banners, true)}
{$banner = array_shift($banners)}
<style>
    .banner-top {
        display: block;
        height: 50px;
        width: 100%;
        background-repeat: repeat-x;
        background-size: cover;
        background-position: center center;
        font-size: 0;
        text-indent: -99999px;
    }
</style>
<a href="{$banner.url}" class="banner-top" style="background-image: url('{$banner.src}');"
    enhanced-gtm-data='{
        "eventLabel": "{$banner.alt}",
        "ecommerce": {
            "promoClick": {
                "promotions": [
                    {
                        "id": {$banner.id},
                        "name": "{$banner.alt}"
                    }
                ]
            }
        }
    }'
>{$banner.alt}</a>

<script>
new GTMEvents([
    { //клик по баннерам
        selector: '.banner-top',
        event: 'click',
        gtm_data: {
            event: "EnhancedOWOX",
            eventCategory: 'Banner',
            eventAction: 'promotionClick'
        }
    }
]).setOptions({ "gtm_attribute_name": "enhanced-gtm-data"});
</script>
{/if}