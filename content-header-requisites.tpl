<div id="contact_phones" class='contact-phones-b {if $position == "product_page"}pp-contact-phones{/if}'>
<ul class="contact-phones-l clearfix">
	<li id="partners-phone" class="contact-phones-l-i">{$settings.Contacts.phone}{if !empty($settings.Contacts.additional_phones)}<span class="sign">,<span>{/if}</li>
	{if !empty($settings.Contacts.additional_phones)}
		{foreach $settings.Contacts.additional_phones as $phone}
			<li class="contact-phones-l-i" name="additional_phone">{$phone}<span class="sign">,</span></li>
            {if $position == "product_page"}
                {break}
            {/if}
		{/foreach}
	{/if}
</ul>
	{if $position == "header"}
		<script>
			headerCallback.init();
			headerCallback.setPopupParent('contact_phones');

			headerCallback.getPopup().addEvent('open', function () {
				var phone_number = document.id('phone_number');
				var masked_phone = new TextMaskedInputElement_class({ });

				masked_phone.options.mask = '+xx (xxx) xxx-xx-xx';
				masked_phone.options.forcePrefix = '380';
				masked_phone.options.iPlaceholderChar = '';
				masked_phone.options.mPlaceholderChar = '';
				masked_phone.options.name = 'contact';

				 if(User.auth == 1) {
				     var phone = '';
				     for (phone_id in User.S.phones) break;

				     masked_phone.options.default_value = User.S.phones[phone_id].title;
				 }

				masked_phone.init(phone_number);
				masked_phone.setDefaultValue();
			});

			new GTMEvents([
					{ //Клик на "Обратный звонок"
						selector: '#callback-header',
						event: 'click',
						gtm_data: {
							event: "OWOX",
							eventCategory: 'Communication',
							eventAction: 'callback',
							eventLabel: { handler: getPageType}
						}
					},
					{ // отправка формы "перезвонить мне"
						selector: '#contact_phones form',
						event: 'submit',
						gtm_data: {
							event: "OWOX",
							eventCategory: 'Communication',
							eventAction: 'callbackSubmit',
							eventLabel: { handler: getPageType}
						},
						depend_on_event: {
							object: headerCallback,
							event: "feedbackPopupOpen"
						}
					}
				]);
			
		</script>
	{/if}
</div>