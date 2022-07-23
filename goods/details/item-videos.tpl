{*assign var="videos" value=$record->getVideos('product')*}

{assign var="consultation" value=''}
{assign var="warranty" value=''}
{assign var="delivery" value=''}

{if count($videos)}
<div class="b-videos-container hidden">
    <div class="b-videos">
        {foreach from=$videos item=video}
            {if in_array('consultation', $video.tags)}
                {assign var="consultation" value=$video}
                {continue}
            {elseif in_array('warranty', $video.tags)}
                {assign var="warranty" value=$video}
                {continue}
            {elseif in_array('delivery', $video.tags)}
                {assign var="delivery" value=$video}
                {continue}
            {/if}

            {$href = "#video_container_"|cat:$video.id}

            {if !empty($video.title2)}
                {$title = $video.title2}
            {else}
                {$title = $video.title}
            {/if}

            <div class="b-video-title" name="carousel_element">
                <a class="video-review" href="{$href}" title="{$title|escape:'quotes'}">
                    <div class="video-icon-images-wrap">
                        {if !empty($video->attachments) && count($video->attachments->image)}
                            <img alt="{$title|escape:'quotes'}"
                                 title="{$title|escape:'quotes'}"
                                 src="{$video->attachments->image.small.url}">
                        {/if}
                    </div>
                    <span class="video-review-text">{$title}</span>
                </a>
            </div>
        {/foreach}
    </div>
</div>
{/if}

{assign var="consultation" value=$record->getVideo('consultation')}
{assign var="warranty" value=$record->getVideo('warranty')}
{assign var="delivery" value=$record->getVideo('delivery')}

{if $consultation || $warranty || $delivery}
<div class="goods-details__consultation">
    {if $consultation}
    <a href="#" data-role="popup-show" data-url="{$consultation.url}">
        <svg height="472pt" viewBox="0 -87 472 472" width="472pt" xmlns="http://www.w3.org/2000/svg"><path d="m467.101562 26.527344c-3.039062-1.800782-6.796874-1.871094-9.898437-.179688l-108.296875 59.132813v-35.480469c-.03125-27.601562-22.398438-49.96875-50-50h-248.90625c-27.601562.03125-49.96875 22.398438-50 50v197.421875c.03125 27.601563 22.398438 49.96875 50 50h248.90625c27.601562-.03125 49.96875-22.398437 50-50v-34.835937l108.300781 59.132812c3.097657 1.691406 6.859375 1.625 9.894531-.175781 3.039063-1.804688 4.898438-5.074219 4.898438-8.601563v-227.816406c0-3.53125-1.863281-6.796875-4.898438-8.597656zm-138.203124 220.898437c-.015626 16.5625-13.4375 29.980469-30 30h-248.898438c-16.5625-.019531-29.980469-13.4375-30-30v-197.425781c.019531-16.558594 13.4375-29.980469 30-30h248.90625c16.558594.019531 29.980469 13.441406 30 30zm123.101562-1.335937-103.09375-56.289063v-81.535156l103.09375-56.285156zm0 0"/></svg>
        <span>Онлайн консультант</span>
    </a>
    {/if}
    {if $warranty}
    <a href="#" data-role="popup-show" data-url="{$warranty.url}">
        <svg height="374pt" viewBox="-41 0 374 374.10622" width="374pt" xmlns="http://www.w3.org/2000/svg"><path d="m287.664062 75.746094-140.605468-74.921875c-2.085938-1.113281-4.585938-1.097657-6.65625.039062l-136.714844 74.921875c-2.242188 1.230469-3.6328125 3.582032-3.6328125 6.140625v97.867188c.0820315 80.449219 47.7460935 153.230469 121.4570315 185.460937l18.976562 8.269532c1.773438.773437 3.792969.777343 5.570313.007812l21.382812-9.234375c75.078125-31.53125 123.921875-105.015625 123.929688-186.445313v-95.925781c0-2.585937-1.425782-4.964843-3.707032-6.179687zm-10.292968 102.105468c-.015625 75.816407-45.503906 144.226563-115.410156 173.566407l-.046876.023437-18.621093 8.039063-16.179688-7.058594c-68.613281-30-112.984375-97.742187-113.0625-172.628906v-93.722657l129.761719-71.117187 133.558594 71.167969zm0 0"/><path d="m92.167969 175.253906c-2.511719-2.941406-6.929688-3.289062-9.871094-.777344-2.941406 2.507813-3.289063 6.929688-.777344 9.867188l36.976563 43.300781c2.46875 2.890625 6.792968 3.285157 9.738281.886719l86.117187-70.0625c3-2.4375 3.453126-6.847656 1.011719-9.847656-2.4375-2.996094-6.847656-3.453125-9.847656-1.011719l-80.8125 65.742187zm0 0"/></svg>
        <span>Условия гарантии</span>
    </a>
    {/if}
    {if $delivery}
    <a href="#" data-role="popup-show" data-url="{$delivery.url}">
        <svg id="Capa_1" enable-background="new 0 0 512.001 512.001" height="512" viewBox="0 0 512.001 512.001" width="512" xmlns="http://www.w3.org/2000/svg"><g><path d="m474.662 105c-7.313 0-240.418 0-247.725 0-18.97 0-34.915 14.218-37.09 33.073l-26.205 227.294c-2.553 22.154 14.779 41.633 37.089 41.633h247.725c18.97 0 34.915-14.218 37.09-33.073l26.205-227.294c2.553-22.153-14.778-41.633-37.089-41.633zm-94.114 30-7.545 53.692h-55.944l7.545-53.692zm101.4 8.198-26.205 227.293c-.428 3.711-3.561 6.509-7.287 6.509h-247.725c-4.402 0-7.788-3.846-7.286-8.197l26.205-227.293c.428-3.711 3.561-6.509 7.287-6.509h67.371l-9.359 66.605c-1.267 9.029 5.753 17.087 14.854 17.087h86.239c7.478 0 13.813-5.508 14.854-12.913l9.945-70.78h63.819c4.404 0 7.79 3.846 7.288 8.198z"/><path d="m119.983 305.107h-104.983c-8.284 0-15 6.716-15 15s6.716 15 15 15h104.983c8.284 0 15-6.716 15-15s-6.715-15-15-15z"/><path d="m119.983 241.107h-88.004c-8.284 0-15 6.716-15 15s6.716 15 15 15h88.004c8.284 0 15-6.716 15-15s-6.715-15-15-15z"/><path d="m119.983 177.107h-72.003c-8.284 0-15 6.716-15 15s6.716 15 15 15h72.003c8.284 0 15-6.716 15-15s-6.715-15-15-15z"/></g></svg>
        <span>Быстрый заказ</span>
    </a>
    {/if}
</div>
{/if}