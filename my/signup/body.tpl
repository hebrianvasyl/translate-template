<section class="b-signup" name="signup">
	<h1 class="b-signup-title">{'Регистрация постоянного клиента'|translate}</h1>
	<div name="app-message"></div>
	<form class="f-signup" method="post" action="/cgi-bin/form.php?r={$menu.my->signup.href|@urlencode}&action=SignUp" name="submit-by-ajax">
		<div class="f-signup-step">
			<label class="f-signup-label basic" for="login">{'Номер телефона'|translate}:</label>
			<input type="text" class="custom-field-error input-field f-signup-field phone-number" id="login" name="login" _required="required" _pattern="{literal}^\+?[0-9\-() ]{9,19}${/literal}" tabindex="1">
			<div class="f-signup-hint right">{'Будет использован в качестве<br>логина для входа на сайт'|translate}</div>
			<div class="f-signup-hint bottom phone">{'Например'|translate}, +38 (0XX) ХХХ-ХХ-ХХ</div>
		</div>

		<div class="f-signup-step">
			<label class="f-signup-label basic" for="password">{'Придумайте пароль'|translate}:</label>
			<input type="password" class="custom-field-error input-field f-signup-field password" name="password" id="password" _required="required" _pattern="{literal}.{6,}{/literal}" tabindex="2">
		</div>

		<div class="f-signup-step third">
			<label class="f-signup-label" for="user_title">{'Имя и фамилия'|translate}:</label>
			<input type="text" class="custom-field-error input-field f-signup-field name" id="user_title" name="title" _required="required" _pattern="{$new_user->first_name.pattern}" tabindex="3">
		</div>

		<div class="f-signup-step check-form-i_town">
			<label class="f-signup-label" for="city_id">{'Город'|translate}:</label>
			<div class="f-i-field" id="new_user_locality">
				<div id="countries"></div>
				<div class="f-i-field-border ">
					<input type="text"
						   id="new_user_locality_cities_suggest"
						   class="f-signup-field city input-field search-text stw-popup-text custom-field-error search-text-default"
						   _required="required"
						   autocomplete="off" />
					<button class="btn-field-list cities-show-default"></button>
				</div>

				<input type="hidden" id="city_id" name="addresses[0][city_id]" value="">
				<input type="hidden" id="city-id-hidden">
			</div>

			{*<select class="f-signup-field city" id="city_id" name="addresses[0][city_id]" tabindex="4">*}
				{*{foreach from=$cities item="city"}*}
					{*<option value="{$city.id}"{if $city->is_default} selected="selected"{/if}>{$city->title}</option>*}
				{*{/foreach}*}
			{*</select>*}
		</div>

		<div class="f-signup-step">
			<label class="f-signup-label" for="street">{'Адрес для службы доставки'|translate}:</label>
			<ul class="f-signup-address-l">
				<li class="f-signup-address-l-i">
					<input type="text" class="input-field f-signup-field street" id="street" name="addresses[0][street]" tabindex="5">
					<div class="f-signup-hint bottom">{'Улица'|translate}</div>
				</li>
				<li class="f-signup-address-l-i">
					<input type="text" class="input-field f-signup-field house" name="addresses[0][house]" tabindex="6">
					<div class="f-signup-hint bottom">{'Дом'|translate}</div>
				</li>
				<li class="f-signup-address-l-i">
					<input type="text" class="input-field f-signup-field flat" name="addresses[0][flat]" tabindex="7">
					<div class="f-signup-hint bottom">{'Квартира'|translate}</div>
				</li>
			</ul>
		</div>

		<div class="f-signup-step optional">
			<div class="f-signup-step-i"><input type="checkbox" class="signup-option-check" name="is_subscribed" id="subscribe_input" tabindex="8" checked value="1"></div>
			<div class="f-signup-step-i">
				<label class="f-signup-label checkbox" for="subscribe_input">{'Я хочу получать по электронной почте уведомления об акциях и распродажах, проводимых интернет-магазином IntexPool.ua'|translate}</label>

			</div>
		</div>
		<div class="f-signup-mail-wrap" id="email_block">
			<label class="f-signup-label" for="email">{'Мой адрес эл. почты'|translate}:</label><input type="text" id="email" class="custom-field-error input-field" name="email" _pattern="{$new_user->email.pattern}" _required="required" class="f-signup-field mail" id="email" tabindex="9">
		</div>

		<div class="f-signup-step last-step">
			<span class="btn-link">
				<button type="submit" class="btn-link-i" tabindex="10">{'Зарегистрироваться'|translate}</button>
			</span>
		</div>

	</form>
</section>