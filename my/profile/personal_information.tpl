<div class="cabinet personal">
    {include file="breadcrumbs.tpl" show_last_breadcrumb=1}

    {include file="profile/agreements_block.tpl"}

    {include file="profile/body-menu.tpl"}
    <section class="content-wrapper">
        <form class="personal-information check-lt" action="/cgi-bin/form.php?r={$menu.active.href|@urlencode}&action=editProfile" method="POST">
            <div name="app-message"></div>
            <div class="user-info">

                <div class="check-form-i" id="phones_block"></div>

                <div class="check-form-i">
                    <span class="check-form-i-text valigned-top"></span>
                    <div class="checkout-fields">
                        <div style="text-align: right;">
                            <a href="#" name="change_password_link">{'Сменить пароль'|translate}</a>
                        </div>

                        <div class="new-password hidden" name="change_password_block">
                            <input class="custom-field-error input-field new-password-input" name="password" disabled="disabled" required="required" pattern="{$user->password.pattern}" type="password">
							<span class="btn-link btn-grey submit-btn">
								<input class="btn-link-i" type="submit" name="change_password_button" value="{'Сохранить'|translate}">
							</span>
                            <p class="checkout-fields-i-options">{'Придумайте новый пароль'|translate}</p>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>

                <div class="check-form-i">
                    <span class="check-form-i-text valigned-middle">{'Имя и фамилия'|translate}</span>
                    <input value="{$user.title}" name="title" class="custom-field-error input-field enter-field big-field" type="text" _required="required" _pattern={literal}"^[a-zA-ZА-Яа-яіїёєІЇЁЄ\d\._-]{1,50}( [a-zA-ZА-Яа-яіїёєІЇЁЄ\d\.\s_-]{2,50})*$"{/literal}>
                    <div class="clear"></div>
                </div>

                {*<div class="check-form-i">*}
                    {*<span class="check-form-i-text valigned-middle">Город</span>*}
                    {*<select class="input-field enter-field city-select" name="city_id">*}
                        {*{UsersSignUp->getCities assign="cities"}*}
                        {*{foreach from=$cities item="city"}*}
                            {*<option value="{$city.id}" {if $city.id == $user.city_id} selected="selected"{/if}>{$city.title}</option>*}
                        {*{/foreach}*}
                    {*</select>*}
                    {*<div class="clear"></div>*}
                {*</div>*}

                <div class="check-form-i check-form-i_town">
                    <span class="check-form-i-text valigned-middle">{'Город'|translate}</span>
                    <div class="f-i-field" id="new_user_locality">
                        <div id="countries"></div>
                        <div class="f-i-field-border">
                            <input type="text"
                                   id="new_user_locality_cities_suggest"
                                   class="input-field search-text stw-popup-text custom-field-error search-text-default"
                                   _required="required"
                                   autocomplete="off" />
                            <button class="btn-field-list cities-show-default"></button>
                        </div>
                    </div>
                    <div class="clear"></div>

                    <input type="hidden" name="city_id" value="{$user.city_id}">
                    <input type="hidden" id="city-id-hidden">
                </div>

                <div class="check-form-i" style="overflow: visible; position: relative;">
                    <div>
                        <span class="check-form-i-text valigned-middle">{'Эл. почтa'|translate}</span>
                        <div class="popup_wrap">
                            <a class="info popup" href="#" id="checkout_email_popup" name="info-link"></a>
                            <div class="popup_body checkout_email_popup_body">{'Указывая свой электронный адрес, Вы с легкостью сможете отслеживать статус своего заказа и узнавать о новых акционных предложениях на нашем сайте'|translate}.</div>
                        </div>
                    </div>
                    <input type="text" name="email" {if !empty($user.email)}value="{$user.email}"{/if} class="input-field enter-field big-field" pattern="{$user->email.pattern}">
                    <div class="clear"></div>
                </div>


                <div class="check-form-i {if count($addresses) == 0}hidden{/if}">
                    <span class="check-form-i-text valigned-top field-text">{'Адрес'|translate}{if count($addresses) > 1}{'а'|translate}{/if} {'доставки'|translate}</span>
                    <div class="checkout-fields valigned-middle">
                        {if count($addresses)}

                            {foreach from=$addresses item="address"}
                                {$i = $address@index}
                                <div class="addresses clearfix" id="address{$address.id}">
                                    <input type="hidden" name="addresses[{$i}][id]" value="{$address.id}">
                                    {* <div class="checkout-fields-i">
                                        <select class="input-field enter-field city-select" name="addresses[{$i}][city_id]">
                                            {UsersSignUp->getCities assign="cities"}
                                            {foreach from=$cities item="city"}
                                                <option value="{$city.id}" {if $city.title == $address->city.title} selected="selected"{/if}>{$city.title}</option>
                                            {/foreach}
                                        </select>
                                    </div> *}

                                    <input type="hidden" class="addresses_city_id" name="addresses[{$i}][city_id]" value="{$address->city.id}">

                                    <div class="checkout-fields-i float-lt">
                                        <input class="custom-field-error input-field enter-field check-form-input street" name="addresses[{$i}][street]" type="text" value="{$address->street|htmlspecialchars}">
                                        <span class="checkout-fields-i-options">{'Улица'|translate}</span>
                                    </div>

                                    <div class="checkout-fields-i house-checkout-fields-i float-lt">
                                        <input class="custom-field-error input-field enter-field check-form-input house" name="addresses[{$i}][house]" type="text" value="{$address->house|htmlspecialchars}">
                                        <span class="checkout-fields-i-options">{'Дом'|translate}</span>
                                    </div>
                                    <div class="checkout-fields-i flat-checkout-fields-i float-lt">
                                        <input class="input-field enter-field check-form-input flat" name="addresses[{$i}][flat]" type="text" value="{$address->flat|htmlspecialchars}">
                                        <span class="checkout-fields-i-options">{'Квартира'|translate}</span>
                                    </div>
                                    {if $user.user_type == 'dealer'}
                                    <a class="delete" href="{$menu.active.href}?action=removeAddress&data[address_id]={$address.id}" name="remove"><span class="underline">{'Удалить'|translate}</span></a>
                                    {/if}
                                    <div class="clear"></div>

                                </div>
                                <script>AddressesCollection.addExisting({$address.id})</script>
                            {/foreach}


                        {/if}

                        <script>AddressesCollection.init({$addresses|count})</script>

                    </div>
                    <div class="clear"></div>
                </div>

            </div>

            <div class="check-form-i">
                <span class="check-form-i-text valigned-top"></span>
				<span class="btn-link btn-grey submit-btn">
					<input class="btn-link-i" type="submit" value="{'Сохранить'|translate}">
				</span>
                <div class="clear"></div>
            </div>
        </form>
    </section>

</div>
<script>
    $$('.cabinet').getParent('.body-layout').addClass('overflow-visible');
</script>