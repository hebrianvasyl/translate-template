{if count($record->relations->videos->getActiveRecords())}
    <div class="b-videos-container-wrap">
        <div class="b-videos-container" id="videos_carousel">
            <a href="#" class="btn btn-lt carousel_control_left pp-videos-left-btn" name="carousel_control_left"><img class="btn-img" alt="" src="{$settings.path.design}/_.gif"></a>
            <a href="#" class="btn btn-rt carousel_control_right pp-videos-right-btn" name="carousel_control_right"><img class="btn-img" alt="" src="{$settings.path.design}/_.gif"></a>

            <div class="b-videos" name="carousel_container">
                {foreach from=$record->relations->videos->getActiveRecords() item=item name=videos}
                    {assign var=video value=$item->record_to}
                    {if isset($section)}
                        {$href = $record.external_href|cat:"#video_container_"|cat:$video.id}
                    {else}
                        {$href = "#video_container_"|cat:$video.id}
                    {/if}
                    {if !empty($video.title2)}
                        {$title = $video.title2}
                    {else}
                        {$title = $video.title}
                    {/if}
                    <div class="b-video-title" name="carousel_element">
                        <a class="video-review" href="{$href}">
                            <div class="video-icon-images-wrap">
                                {if !empty($video->attachments) && count($video->attachments->image)}
                                    <img alt="{$title|escape:'quotes'}"
                                         title="{$title|escape:'quotes'}"
                                         src="{$video->attachments->image.small.url}">
                                {/if}
                            </div>
                            <span class="video-review-text">
                                {$title}
                            </span>
                        </a>
                    </div>
                {/foreach}
            </div>
        </div>
    </div>
    <script>
        var Carousel = new Carousel_class('videos_carousel');
        {literal}
        Carousel.setOptions({
            control_size: 0,
            controls_css: {
                prev: 'carousel_control_left_disabled',
                next: 'carousel_control_right_disabled'
            },
            scroll_count: 1,
            is_centered: false
        });
        {/literal}
        Carousel.run();
    </script>
{/if}