    <section class="b-static b-static-no-margin clearfix">

        {include file="breadcrumbs.tpl" show_last_breadcrumb=1}

        {include file="static-pages-menu.tpl"}

        {assign var="record" value=$menu.active.record}

        <div class="promotions-content">
            <div class="b-static-content promotion-details">

                <div class="promotions-l-i">
                    <div class="promotions-i-date">
                        {include file="promotions/promotion_period.tpl" record=$record}
                    </div>
                    <div class="b-promotion-timer before after">
                        <div class="b-promotion-timer-title-container">
                            <h1 class="b-promotion-timer-title">
                                {$menu.active.title|replace:'/*br*/':'<br>' nofilter}
                                <svg id="bg" height="100%" width="150" viewBox="0 0 150 100" preserveAspectRatio="none" shape-rendering="geometricPrecision">
                                    <path d="M0,0 h110 l40,50 l-40,50 h-110z" fill="#44aae6" />
                                </svg>
                            </h1>
                        </div>

                        {$days = round(($record->period_end->getTimestamp()-time())/86400)}

                        <div id="promotion_countdown_timer"></div>
                    </div>


                    <div class="promotions-l-i-desc b-rich-text">
                        {if !empty($record.text)}
                            {$record->text|@html_entity_decode nofilter}
                        {else}
                            {$record->summary|@html_entity_decode nofilter}
                        {/if}
                    </div>
                </div>

                {include file="promotions/details-goods.tpl"}

                <div class="border-top sicial-b">
                    {include file="social-buttons.tpl"}
                </div>

                <div class="return-to-list">
                    <span class="btn-link btn-link-blue">
                        <a class="btn-link-i" href="{$menu.www->promotions.href}">{'Вернуться к списку'|translate}</a>
                    </span>
                </div>
            </div>
        </div>
    </section>

    <script>
        var promotion_days = '{$days}';
        var hide_counter = parseInt('{$record.hide_counter}');
        var project_options = {
            timer_template: '{template_script_fetch file="promotions/_jst/promotion_timer.jst" jst=1}',
            ended_template: '{template_script_fetch file="promotions/_jst/promotion_ended.jst" jst=1}',
            animation_status: false,
            display_mode: 'days'
        };
        var CountdownTimer = new CountdownTimer_class(
                'promotion_countdown_timer',
                {$record->period_end->getTimestamp()}000,
                project_options
        );
        CountdownTimer.run();
    </script>
</div>

<div class="content body-layout wrap overflow-hidden clearfix">
    <div class="body-layout clearfix">
        {include file="my/recent_goods/recent_goods_block.tpl"}

        {include file="block-help.tpl"}

        <div class="h-50"></div>
    </div>
