<div id="contact_phones" class='contact-phones-b {if $position == "product_page"}pp-contact-phones{/if}'>
    <p>{$settings.Contacts.schedule_call_center nofilter}</p>
    <ul class="contact-phones-l clearfix" style="overflow: hidden;">
        {if $settings.Contacts.phone}
        <li id="partners-phone" class="contact-phones-l-i binct-phone-number-1">+38 {$settings.Contacts.phone}{if !empty($settings.Contacts.additional_phones)}{/if}</li>
        {/if}
        {if !empty($settings.Contacts.additional_phones)}
            {foreach from=$settings.Contacts.additional_phones item=phone name=header_phones}
                <li class="contact-phones-l-i binct-phone-number-{$phone@iteration + 1}" name="additional_phone">+38 {$phone}</li>
                {if $position == "product_page"}
                    {break}
                {/if}
            {/foreach}
        {/if}
        <li class="contact-phones-l-i" name="additional_phone" style="float: right;">
            <a href="viber://pa?chatURI=intexpool_bot">
                <i class="icon-viber-old"></i>
                Открыть Viber
            </a>
        </li>
    </ul>
    {if $position == "header"}
        <script>
            headerCallback.init();
            headerCallback.setPopupParent('contact_phones');

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
                }
            ]);
        </script>
    {/if}
</div>