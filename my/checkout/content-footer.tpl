<footer id="footer_wrap" class="footer">
	<div class="body-layout footer-content wrap clearfix justify">
		<div class="footer-i justify-i col-1">
			<div class="footer-i-content footer-text">
				<div class="workTime">
					<img src="{$settings.path.design}/icon-work-time.png" class="icon-work-time"/> <strong style="display: block;padding-left: 25px;">{$settings.Contacts.schedule_call_center nofilter}</strong><br/>
					<img src="{$settings.path.design}/icon-email.png" class="icon-email"/> <a href="mailto:{$settings.Contacts.email}">{$settings.Contacts.email}</a>
				</div>
			</div>
			<div class="h-line"></div>
		</div>

		<div id="footer_contact_phones" class="footer-i justify-i col-2">
			<div class="footer-i-content copyrights footer-text">
                {if $settings.Contacts.phone && count($settings.Contacts.additional_phones) > 0}
				<div class="phones">
					<img src="{$settings.path.design}/icon-phone.png" class="icon-phone"/>
                    {if $settings.Contacts.phone}
					<span class="binct-phone-number-1">{$settings.Contacts.phone}</span><br>
                    {/if}
                    {if count($settings.Contacts.additional_phones) > 0}
					<span class="binct-phone-number-2">{$settings.Contacts.additional_phones[0]}</span>
                    {/if}
				</div>
                {/if}
                <div class="viber-phone">
                    <a href="viber://pa?chatURI=intexpool_bot">
                        <i class="icon-viber-old"></i>
                        Открыть Viber
                    </a>
                </div>

				{*используем механизм обратной связи только в случае, когда есть причины для обратной связи*}

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
									<img src="{$settings.path.design}/_.gif">
								</a>
							</li>
						{/if}
						{if !empty($settings.Contacts.address_for_fb_button)}
							<li class="social-block-l-i float-lt">
								<a class="social-block-l-i-link fb-btn" target="_blank"
								   href="{$settings.Contacts.address_for_fb_button}"
								   gtm-data='{ "eventLabel":"facebook"}'
								>
									<img src="{$settings.path.design}/_.gif">
								</a>
							</li>
						{/if}
						{if !empty($settings.Contacts.address_for_twitter_button)}
							<li class="social-block-l-i float-lt">
								<a class="social-block-l-i-link tw-btn" target="_blank"
								   href="{$settings.Contacts.address_for_twitter_button}"
								   gtm-data='{ "eventLabel":"twitter"}'
								>
									<img src="{$settings.path.design}/_.gif">
								</a>
							</li>
						{/if}
						{if !empty($settings.Contacts.address_for_google_button)}
							<li class="social-block-l-i float-lt">
								<a class="social-block-l-i-link gplus-btn" target="_blank"
								   href="{$settings.Contacts.address_for_google_button}"
								   gtm-data='{ "eventLabel":"google+"}'
								>
									<img src="{$settings.path.design}/_.gif">
								</a>
							</li>
						{/if}
						{if !empty($settings.Contacts.address_for_youtube_button)}
							<li class="social-block-l-i float-lt">
								<a class="social-block-l-i-link ytube-btn" target="_blank"
								   href="{$settings.Contacts.address_for_youtube_button}"
								   gtm-data='{ "eventLabel":"youtube"}'
								>
									<img src="{$settings.path.design}/_.gif">
								</a>
							</li>
						{/if}
					</ul>
                    <div class="payments-icons">
                        <div class="footer__img">
                            <img class="mcsc_csv" src="{$settings.path.design}/visa.png">
                        </div>
                        <div class="footer__img">
                            <img src="{$settings.path.design}/mastercard.png">
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
	</div>
	<div class="copyright">
		<p>{'Мы работаем по всей Украине. Быстрая доставка в Киев, Львов, Харьков, Одесса, Винница, Запорожье, Днепропетровск и др. города'|translate}</p>
		<p>&copy;&nbsp;{$settings.Contacts.copyright_year_start|copyright_years_range nofilter} {'Интернет-магазин IntexPool.ua. Все права защищены'|translate}.</p>
	</div>
</footer>

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