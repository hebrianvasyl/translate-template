{if $banner && count($banner->attachments->images) > 0}
<div class="left-col goods-promo-banner">
    <a href="{$banner.url}">
        <img src="{$banner->attachments->images.original.url}" alt="{$banner.title}">
    </a>
</div>
{/if}