{*<div class="footer-application-bg">
    <div class="body-layout wrap">
        <div>
            <div class="footer-application clearfix">
                <div class="footer-application-i">
                    <div class="footer-application-img-wrap">
                        <img data-src="https://i.intexpool.ua/design/_.gif" alt="" class="lazylaod footer-application-img sprite">
                    </div>
                </div>
                <div class="footer-application-i">
                    <ul class="footer-application-l">
                        <li class="footer-application-l-i">
                            <a href="https://play.google.com/store/apps/details?id=ua.intexpool" target="_blank">
                                <img width="111" height="36" data-src="https://i.intexpool.ua/design/_.gif" alt="Скачать в Google play" title="Скачать в Google play" class="footer-application-icon-google sprite lazyload">
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="footer-application-i text-center">
                    <div class="footer-application-header h2"> Скачивайте наше мобильное приложение </div>
                </div>
            </div>
        </div>
    </div>
</div>*}

<footer id="footer_wrap" class="footer">
	<div class="body-layout footer-content wrap clearfix justify">
		<div class="footer-i justify-i col-1">
			<div class="footer-i-content footer-text">
				<div class="workTime">
					<div style="margin-bottom: 5px;">
						<img data-src="{$settings.path.design}/icon-work-time.png" class="icon-work-time lazyload"/> <strong style="display: block;padding-left: 25px;">{$settings.Contacts.schedule_call_center nofilter}</strong>
					</div>
					<div>
						<img data-src="{$settings.path.design}/icon-email.png" class="icon-email lazyload"/> <a href="mailto:{$settings.Contacts.email}">{$settings.Contacts.email}</a>
					</div>
				</div>
			</div>
			<div class="h-line"></div>
		</div>

		<div id="footer_contact_phones" class="footer-i justify-i col-2">
			<div class="footer-i-content copyrights footer-text">
                {if $hide_phones === false && count($phones) > 0}
				<div class="phones">
					<img data-src="{$settings.path.design}/icon-phone.png" class="icon-phone lazyload"/>
                    {foreach from=$phones item=phone name=footer_phones}
                        <div class="phone-i">
                            <span class="binct-phone-number-{$phone@iteration}">{$phone}</span>
                        </div>
                    {/foreach}
				</div>
                {/if}
                <div class="viber-phone">
                    <a href="viber://pa?chatURI=intexpool_bot">
                        <i class="icon-viber-old"></i>
                        {'Открыть Viber'|translate}
                    </a>
                </div>
				{*<div class="callback"><a id="callback-header" class="contact-phones-l-i-link xhr" href="#Callback">{'Заказать обратный звонок'|translate}</a></div>*}

				{*используем механизм обратной связи только в случае, когда есть причины для обратной связи*}

				{*
				{Feedback->getCausesOfTreatments assign="causes"}
				{if !empty($causes)}
					<script>
						var Feedback = new Feedback_class().setOptions({
							id: 'feedback-footer',
							parent: 'footer_wrap',
							tpl: '{template_script_fetch file="_jst/feedback/feedback-popup.jst" jst=1}',
							tpl_init: '{template_script_fetch file="_jst/feedback/feedback-header-init.jst" jst=1}',
							tpl_form: '{template_script_fetch file="_jst/feedback/feedback-popup-form.jst" jst=1}',
							tpl_process: '{template_script_fetch file="_jst/process.jst" jst=1}',
							tpl_message: '{template_script_fetch file="_jst/feedback/feedback-popup-message.jst" jst=1}',
							tpl_message_success_in_popup:
											'{template_script_fetch file="_jst/feedback/feedback-popup-message-success.jst" jst=1}',
							headers : { ajaxAction: '{$menu.www.href}feedback#Feedback' },
							hasOverlay: false,
							signature_use_title: false,
							signature: "",
							use_order_id_field: true
						});

						Feedback.init();

						Feedback.getPopup().addEvent('open', function () {

							var causes_selector = $("feedback_causes");

							if (causes_selector) {

								causes_selector.addEvent('change', function () {

									causes_selector.getElement('option').set('html', "—");

									causes_selector.removeEvent('change', arguments.callee);

								});

							}

						});

						new GTMEvents([
							{
								selector: '#feedback-footer',
								event: 'click',
								gtm_data: {
									event: "OWOX",
									eventCategory: 'Communication',
									eventAction: 'feedback',
									eventLabel: { handler: getPageType}
								}
							},
							{ // отправка формы "Обратная связь"
								selector: '#footer_links form',
								event: 'submit',
								gtm_data: {
									event: "OWOX",
									eventCategory: 'Communication',
									eventAction: 'feedbackSubmit',
									eventLabel: { handler: getPageType}
								},
								depend_on_event: {
									object: Feedback,
									event: "feedbackPopupOpen"
								}
							}
						]);

					</script>
				{/if}
				*}
			</div>
			<div class="h-line"></div>
		</div>

		<div class="footer-i justify-i">
			<div class="footer-i-content">
				<nav>
					<ul id="footer_links" class="footer-links">
						{if $menu.www->articles}
							<li><a href="{$menu.www->articles.href}" class="novisited">{'Помощь'|translate}</a></li>
						{/if}
						{if $menu.www->dostavka_i_oplata}
						<li><a href="{$menu.www->dostavka_i_oplata.href}" class="novisited">{'Оплата и доставка'|translate}</a></li>
						{/if}
						{if $menu.www->contacts}
							<li><a href="{$menu.www->contacts.href}" class="novisited">{'Контакты'|translate}</a></li>
						{/if}
                        <li><a href="https://drive.google.com/file/d/1i5V8uYQ9XgS3gXFRfpzNU1ijms1JUy1J/view?usp=sharing" class="novisited" target="_blank">{'Договор оферты'|translate}</a></li>
					</ul>
				</nav>
				<div class="h-line"></div>
			</div>
		</div>

		{if !empty($settings.Contacts.address_for_vk_button)
		or !empty($settings.Contacts.address_for_fb_button)
		or !empty($settings.Contacts.address_for_twitter_button)
		or !empty($settings.Contacts.address_for_google_button)
		or !empty($settings.Contacts.address_for_youtube_button)}
		<div class="footer-i justify-i supplement">
			<div class="social-block" name="in-social-block">
				<ul class="social-block-l clearfix">
					{if !empty($settings.Contacts.address_for_vk_button)}
						<li class="social-block-l-i float-lt">
							<a class="social-block-l-i-link vk-btn" target="_blank"
								href="{$settings.Contacts.address_for_vk_button}"
								gtm-data='{ "eventLabel":"vkontakte"}'
							>
								<img data-src="{$settings.path.design}/_.gif" class="lazyload">
							</a>
						</li>
					{/if}
					{if !empty($settings.Contacts.address_for_fb_button)}
						<li class="social-block-l-i float-lt">
							<a class="social-block-l-i-link fb-btn" target="_blank"
								href="{$settings.Contacts.address_for_fb_button}"
								gtm-data='{ "eventLabel":"facebook"}'
							>
								<img data-src="{$settings.path.design}/_.gif" class="lazyload">
							</a>
						</li>
					{/if}
					{if !empty($settings.Contacts.address_for_twitter_button)}
						<li class="social-block-l-i float-lt">
							<a class="social-block-l-i-link tw-btn" target="_blank"
								href="{$settings.Contacts.address_for_twitter_button}"
								gtm-data='{ "eventLabel":"twitter"}'
							>
								<img data-src="{$settings.path.design}/_.gif" class="lazyload">
							</a>
						</li>
					{/if}
					{if !empty($settings.Contacts.address_for_google_button)}
						<li class="social-block-l-i float-lt">
							<a class="social-block-l-i-link gplus-btn" target="_blank"
								href="{$settings.Contacts.address_for_google_button}"
								gtm-data='{ "eventLabel":"google+"}'
							>
								<img data-src="{$settings.path.design}/_.gif" class="lazyload">
							</a>
						</li>
					{/if}
					{if !empty($settings.Contacts.address_for_youtube_button)}
						<li class="social-block-l-i float-lt">
							<a class="social-block-l-i-link ytube-btn" target="_blank"
								href="{$settings.Contacts.address_for_youtube_button}"
								gtm-data='{ "eventLabel":"youtube"}'
							>
								<img data-src="{$settings.path.design}/_.gif" class="lazyload">
							</a>
						</li>
					{/if}
				</ul>
                <div class="payments-icons">
                    <div class="footer__img">
                        <img class="mcsc_csv lazyload" data-src="{$settings.path.design}/visa.png">
                    </div>
                    <div class="footer__img">
                        <img data-src="{$settings.path.design}/mastercard.png" class="lazyload">
                    </div>
                </div>
			</div>
		</div>

		<script>
			new GTMEvents([
					{ //переход на страницу магазина в соц сетях
						selector: '[name=in-social-block] a',
						event: 'click',
						gtm_data: {
							event: "OWOX",
							eventCategory: 'Communication',
							eventAction: 'socialLink'
						}
					}
				]);
		</script>
		{/if}
		{*<div class="footer-i justify-i supplement">
			<ul class="money-support-l clearfix">
				<li class="float-lt money-support-l-i visa"><img height="20" width="61" src="{$settings.path.design}/visa.png"></li>
				<li class="float-lt money-support-l-i master-card"><img height="19" width="32" src="{$settings.path.design}/master-card.png"></li>
				<li class="float-lt money-support-l-i web-money"><img height="20" width="77" src="{$settings.path.design}/webmoney.png"></li>
				<li class="float-lt money-support-l-i yandex-money"><img height="28" width="58" src="{$settings.path.design}/yandex-money.png"></li>
			</ul>
		</div>*}

		{*<div class="footer-i justify-i" style="display: none;">
			<div class="owox">
				<a href="http://www.owox.ua/" title="Разработка и поддержка интернет-магазинов">{image file="design/owox-webstore.png" alt="OWOX — Разработка и поддержка интернет-магазинов"}</a>
				<div class="text">{'Решение для эффективных<br/> интернет-магазинов'|translate}</div>
			</div>
			{if isset($seo_footer)}
			<div class="seo">
				<div class="container">
					{$seo_footer}
				</div>
			</div>
			{/if}
		</div>*}
	</div>
	<div class="copyright">
		<p>{'Мы работаем по всей Украине. Быстрая доставка в Киев, Львов, Харьков, Одесса, Винница, Запорожье, Днепропетровск и др. города.'|translate}</p>
		<p>&copy;&nbsp;{$settings.Contacts.copyright_year_start|copyright_years_range nofilter} {'Интернет-магазин IntexPool.ua. Все права защищены.'|translate}</p>
	</div>
</footer>

{if $hide_callback === false}
<div id="callbacks" class="hidden">
    <div class="body-layout wrap clearfix">
        {if (("w"|date) == 0 && ("H"|date) >= 11 && ("H"|date) < 21) || (("w"|date) == 6 && ("H"|date) >= 11 && ("H"|date) < 18) || (("w"|date) >= 1 && ("w"|date) <= 5 && ("H"|date) >= 8 && ("H"|date) <= 17)}
        <p class="text">{'Хотите, перезвоним Вам'|translate}?</p>
        {else}
        <p class="text two-lines">
			{'Хотите, перезвоним Вам'|translate}<br><small>{'завтра в'|translate} <span class="tooltip" title="{'Пн-Пт'|translate}: {'c'|translate} 08:30 {'до'|translate} 21:00, {'Сб'|translate}: {'с'|translate} 11:00 {'до'|translate} 18:00, {'Вс'|translate}: {'с'|translate} 11:00 {'до'|translate} 17:00">{'рабочее время'|translate}</span>?</small>
        </p>
        {/if}

        <div class="right-form">
            <input id="callback-phone" type="text" placeholder="{'Ваш номер телефона'|translate}">
            <div id="callback-phone-error"></div>
            <button id="request-callback">{'Перезвоните'|translate}</button>

            <button class="close"><small>{'Закрыть'|translate}</small> <i>x</i></button>
        </div>
    </div>
</div>

<script type="text/javascript">
var hide_callbacks = Cookie.read('hide_callbacks');

if(hide_callbacks != 'true') {
    setTimeout(function(){
        $('callbacks').show();
    }, 30000);
}

$('request-callback').addEvent('click', function () {
    $('callback-phone-error').set('html', '');
    $('callback-phone').removeClass('error');

    var phone = $('callback-phone').value;
    phone = phone.replace( /\D/g, '');

    if(phone.length > 3) {
        new Request({
            url: '/cgi-bin/form.php',
            data: {
                json: 1,
                phone: phone,
                url: window.location.href
            },
            headers: {
                ajaxAction: '{$menu.www.href}callbacks/#sendRequest'
            },
            onSuccess: function (resp) {

                var data = JSON.parse(resp);

                if(data.success == false) {
                    $('callback-phone-error').set('html', data.message);
                    $('callback-phone').addClass('error');
                } else {
                    $$('#callbacks .wrap').set('html', '<div class="callbacks-success">{'Заявка на обратный звонок принята. В ближайшее время вам перезвонит менеджер магазина<br>и ответит на все интересующие вас вопросы'|translate}<br><a href="#" class="close">{'Спасибо, жду звонка'|translate}</a></div>');
                    {literal}
                    Cookie.write('hide_callbacks', true, {duration: 28});
                    {/literal}
                }

            }.bind(this)

        }).send();
    } else {
        $('callback-phone-error').set('html', "{'Неверный формат телефона'|translate}");
        $('callback-phone').addClass('error');
    }

    return false;
});

$(document.body).addEvent("click:relay(#callbacks .close)", function(event, element) {
    event.preventDefault();

    {literal}
    Cookie.write('hide_callbacks', true, {duration: 28});
    {/literal}

    $('callbacks').hide();

    return false;
});
</script>
{/if}

<script type="text/javascript">
	/* <![CDATA[ */
    var google_conversion_id = 986507359;
    var google_custom_params = window.google_tag_params;
    var google_remarketing_only = true;
	/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
	<div style="display:inline;">
		<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/986507359/?guid=ON&amp;script=0"/>
	</div>
</noscript>