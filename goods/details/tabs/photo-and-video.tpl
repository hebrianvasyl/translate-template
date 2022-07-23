{assign var="videos" value=$record->getVideos('product')}
<div class="tabs-content-wrap tab-photo-and-video">
    {if count($videos)}
		<h2 class="detail-tab-i-title">Видео товара <span class="pp-characteristics-tab-product-name">{$record.title|@mnemonics_convert nofilter}</span></h2>

		<div class="b-video clearfix" name="video">
			{foreach $videos as $video}
				<div class="b-video-i float-lt">
					<div id="video_{$video.id}">
                        <div class="b-video-i-content">
                            <iframe width="363" height="214" src="https://www.youtube.com/embed/{$video.ext_video_id}" frameborder="0" allowfullscreen></iframe>
                            <div class="b-video-i-title">
                                {if !empty($video.title2)}
                                {$video.title2}
                                {else}
                                {$video.title}
                                {/if}
                            </div>
                        </div>
                    </div>
				</div>
			{/foreach}
		</div>
    {/if}

    {if count($record->getGoods()->relations->tech_videos->getActiveRecords())}
    <div class="b-tech-video">
        <h2 class="detail-tab-i-title">Видеоконсультация <span class="pp-characteristics-tab-product-name">Обслуживания: технические вопросы</span></h2>

        <div class="b-video clearfix" name="video">
            {foreach $record->getGoods()->relations->tech_videos->getActiveRecords() as $relation}
            {$video = $relation -> to}
            <div class="b-video-i float-lt">
                <div id="video_{$video.id}">
                    <div class="b-video-i-content">
                        <iframe width="363" height="214" src="https://www.youtube.com/embed/{$video.ext_video_id}" frameborder="0" allowfullscreen></iframe>
                        <div class="b-video-i-title">
                            {if !empty($video.title2)}
                            {$video.title2}
                            {else}
                            {$video.title}
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
            {/foreach}
        </div>
    </div>
    {/if}

    {if count($record->getGoods()->relations->videos->getActiveRecords()) == 0 and count($record->getGoods()->relations->tech_videos->getActiveRecords()) == 0}
		<p>На данный момент видео нет.</p>
    {/if}

    <div class="clearfix">
        <div class="youtube-subscribe">
            <hr>
            <div class="title">
                <strong>Подпишись на наш канал!</strong>
                <em>Нужная информация без рекламы и спама</em>
            </div>
            <div class="embed" id="yt-button-container-go">
                <div class="g-ytsubscribe" data-channelid="UC0rzaRCiZVosKaFLkgckTtg" data-layout="full" data-count="default"></div>
            </div>
        </div>

        <script>
            var containerId = "yt-button-container-go";
            gapi.ytsubscribe.go(containerId);
        </script>
    </div>
</div>