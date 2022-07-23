{Promotions->getLast goods_record=$record relation_name="goods" limit=1 only_active_promotions="1" assign="promotion_record"}

{if count($promotion_record)}
<div class="left-col">
	{$promotion_record = $promotion_record.0}

    {if $promotion_record.hide_counter == '1'}
        {$days = (3 - date('w'))}
        {if $days < 0}
            {$days = $days + 7}
        {/if}
    {else}
        {$days = round(($promotion_record->period_end->getTimestamp()-time())/86400)}
    {/if}

	<article class="action-prize before after" name="promotion">
        <a href="{$promotion_record.href}" class="action-prize-link" >
            <div class="prize-right">
                <span class="title">До конца акции:</span>
                {if $days > 0}
                <span class="days">
                    {$days} {$days|morphology:"день":"дня":"дней"}
                </span>
                {/if}

                <div class="b-promotion-timer before after">
                    <div id="promotion_countdown_timer"></div>
                </div>

                {if !empty($promotion_record->attachments) and count($promotion_record->attachments->goods_details_page)}
                <figure class="action-prize-img">

                        <img
                                class="action-prize-link-img"
                                src="{$promotion_record->attachments->goods_details_page.original.url}"
                                width="{$promotion_record->attachments->goods_details_page.original.width}"
                                height="{$promotion_record->attachments->goods_details_page.original.height}"
                        >
                </figure>
                {/if}

                {if !empty($promotion_record.details_text)}
                    {$promotion_record.details_text nofilter}
                {/if}

                {*
                <h4 class="prize-right-title"><a href="{$promotion_record.href}">{$promotion_record.title|replace:'/*br*/':'<br>' nofilter}</a></h4>

                {strip}
                    {capture name="promotion_popup_content"}
                        <h3>{$promotion_record.title|replace:'/*br*/':'<br>' nofilter}</h3>
                        {if !empty($promotion_record.details_text)}
                            {$promotion_record.details_text nofilter}
                        {else}
                            {$promotion_record.summary nofilter}
                        {/if}
                        <a href="{$promotion_record.href}" class="novisited prize-right-link-full">Перейти на страницу акции&nbsp;→</a>
                    {/capture}
                {/strip}
                <div class="cut">
                    <a more_hide name="more_actions" href="#" class="novisited prize-right-link underline">Подробнее об акции</a>
                </div>
                *}
            </div>
        </a>
	</article>

    <script>
        var project_options = {
            timer_template: '{template_script_fetch file="promotions/_jst/good_promotion_timer.jst" jst=1}',
            ended_template: '{template_script_fetch file="promotions/_jst/good_promotion_ended.jst" jst=1}',
            animation_status: false,
            display_mode: 'days'
        };
        var CountdownTimer = new CountdownTimer_class(
            'promotion_countdown_timer',
                {$promotion_record->period_end->getTimestamp()}000,
            project_options
        );
        CountdownTimer.run();
    </script>

    {*
    <script type="text/javascript">

        var more_actions = $$('[name="more_actions"]');

        var promotion_popup = new Popup_class('{template_js_fetch file="goods/details/_jst/popup-promotion.jst"}');

        promotion_popup.setContent('{$smarty.capture.promotion_popup_content nofilter}');

        more_actions.addEvent(
            'click', function(e) {
                e.stop();
                promotion_popup.open();
            }
        );

    </script>
    *}
</div>
{/if}