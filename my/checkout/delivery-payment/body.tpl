<script>
    var payment_cash_max_total = {$settings.Orders_Checkout.cash_max_total|intval};
</script>

<div id="loader" class="loader__element hidden"></div>

{OrdersCart->getCart assign="cart"}

<div id="checkout-show-cart-popup"></div>

{literal}
<script data-pagespeed-no-defer type="text/javascript">//<![CDATA[
    (function(){for(var g="function"==typeof Object.defineProperties?Object.defineProperty:function(b,c,a){if(a.get||a.set)throw new TypeError("ES3 does not support getters and setters.");b!=Array.prototype&&b!=Object.prototype&&(b[c]=a.value)},h="undefined"!=typeof window&&window===this?this:"undefined"!=typeof global&&null!=global?global:this,k=["String","prototype","repeat"],l=0;l<k.length-1;l++){var m=k[l];m in h||(h[m]={});h=h[m]}var n=k[k.length-1],p=h[n],q=p?p:function(b){var c;if(null==this)throw new TypeError("The 'this' value for String.prototype.repeat must not be null or undefined");c=this+"";if(0>b||1342177279<b)throw new RangeError("Invalid count value");b|=0;for(var a="";b;)if(b&1&&(a+=c),b>>>=1)c+=c;return a};q!=p&&null!=q&&g(h,n,{configurable:!0,writable:!0,value:q});var t=this;function u(b,c){var a=b.split("."),d=t;a[0]in d||!d.execScript||d.execScript("var "+a[0]);for(var e;a.length&&(e=a.shift());)a.length||void 0===c?d[e]?d=d[e]:d=d[e]={}:d[e]=c};function v(b){var c=b.length;if(0<c){for(var a=Array(c),d=0;d<c;d++)a[d]=b[d];return a}return[]};function w(b){var c=window;if(c.addEventListener)c.addEventListener("load",b,!1);else if(c.attachEvent)c.attachEvent("onload",b);else{var a=c.onload;c.onload=function(){b.call(this);a&&a.call(this)}}};var x;function y(b,c,a,d,e){this.h=b;this.j=c;this.l=a;this.f=e;this.g={height:window.innerHeight||document.documentElement.clientHeight||document.body.clientHeight,width:window.innerWidth||document.documentElement.clientWidth||document.body.clientWidth};this.i=d;this.b={};this.a=[];this.c={}}function z(b,c){var a,d,e=c.getAttribute("data-pagespeed-url-hash");if(a=e&&!(e in b.c))if(0>=c.offsetWidth&&0>=c.offsetHeight)a=!1;else{d=c.getBoundingClientRect();var f=document.body;a=d.top+("pageYOffset"in window?window.pageYOffset:(document.documentElement||f.parentNode||f).scrollTop);d=d.left+("pageXOffset"in window?window.pageXOffset:(document.documentElement||f.parentNode||f).scrollLeft);f=a.toString()+","+d;b.b.hasOwnProperty(f)?a=!1:(b.b[f]=!0,a=a<=b.g.height&&d<=b.g.width)}a&&(b.a.push(e),b.c[e]=!0)}y.prototype.checkImageForCriticality=function(b){b.getBoundingClientRect&&z(this,b)};u("pagespeed.CriticalImages.checkImageForCriticality",function(b){x.checkImageForCriticality(b)});u("pagespeed.CriticalImages.checkCriticalImages",function(){A(x)});function A(b){b.b={};for(var c=["IMG","INPUT"],a=[],d=0;d<c.length;++d)a=a.concat(v(document.getElementsByTagName(c[d])));if(a.length&&a[0].getBoundingClientRect){for(d=0;c=a[d];++d)z(b,c);a="oh="+b.l;b.f&&(a+="&n="+b.f);if(c=!!b.a.length)for(a+="&ci="+encodeURIComponent(b.a[0]),d=1;d<b.a.length;++d){var e=","+encodeURIComponent(b.a[d]);131072>=a.length+e.length&&(a+=e)}b.i&&(e="&rd="+encodeURIComponent(JSON.stringify(B())),131072>=a.length+e.length&&(a+=e),c=!0);C=a;if(c){d=b.h;b=b.j;var f;if(window.XMLHttpRequest)f=new XMLHttpRequest;else if(window.ActiveXObject)try{f=new ActiveXObject("Msxml2.XMLHTTP")}catch(r){try{f=new ActiveXObject("Microsoft.XMLHTTP")}catch(D){}}f&&(f.open("POST",d+(-1==d.indexOf("?")?"?":"&")+"url="+encodeURIComponent(b)),f.setRequestHeader("Content-Type","application/x-www-form-urlencoded"),f.send(a))}}}function B(){var b={},c;c=document.getElementsByTagName("IMG");if(!c.length)return{};var a=c[0];if(!("naturalWidth"in a&&"naturalHeight"in a))return{};for(var d=0;a=c[d];++d){var e=a.getAttribute("data-pagespeed-url-hash");e&&(!(e in b)&&0<a.width&&0<a.height&&0<a.naturalWidth&&0<a.naturalHeight||e in b&&a.width>=b[e].o&&a.height>=b[e].m)&&(b[e]={rw:a.width,rh:a.height,ow:a.naturalWidth,oh:a.naturalHeight})}return b}var C="";u("pagespeed.CriticalImages.getBeaconData",function(){return C});u("pagespeed.CriticalImages.Run",function(b,c,a,d,e,f){var r=new y(b,c,a,e,f);x=r;d&&w(function(){window.setTimeout(function(){A(r)},0)})});})();pagespeed.CriticalImages.Run('/mod_pagespeed_beacon','http://intex.freedomain.thehost.com.ua/page_main.html?email_entry=&password_entry=&entry=entry','h8CMBwZIcy',true,false,'EfxedyjRgH0');
//]]></script>
{/literal}
<div class="hidden" id="redirect_code_block"></div>

<div id="checkout-wrap" class="wrapper fix-footer">
    <header class="header">
        <div class="container">
            <div class="header__logo">
                {include file="content-header-logo.tpl"}
            </div>
            <div class="header__menu" onclick="popupOpen('popup_callback_1')">
                <div class="header__menu_1">Чат центр</div>
                <div class="header__menu_dash">|</div>
                <div class="header__menu_2">Колл центр</div>
            </div>
        </div>
    </header>
    <section class="content">
        <div class="container">
            <h1 class="content__title">{$menu.active.h1|@default:$menu.active.title}</h1>

            {if $user}
                <div name="app-message"></div>
            {else}
                <div id="phone-error-message"></div>
            {/if}

            <form id="checkout-block" method="post" action="/cgi-bin/form.php" autocomplete="off">
                <div id="context-hidden" class="hidden" disabled></div>

                <div class="content__section">
                    <div class="content__1">
                        <div class="part">
                            <h2 class="part__title">Контактные данные</h2>
                            <div class="tabs">
                                {if !$user}
                                    <input type="radio" name="checkout_user_mode" value="new_user" id="checkout_user_mode_new" checked="checked"/>
                                    <label class="tab" for="checkout_user_mode_new" href="#checkout_new_user">
                                        <div class="tab__icon tab__icon_1"></div>
                                        <div class="tab__text">Я новый покупатель</div>
                                    </label>
                                    <input type="radio" name="checkout_user_mode" value="member_user" id="checkout_user_mode_member"/>
                                    <label class="tab" for="checkout_user_mode_member" href="#checkout_member_user">
                                        <div class="tab__icon tab__icon_2"></div>
                                        <div class="tab__text">Я постоянный клиент</div>
                                    </label>
                                {else}
                                    <input type="radio" name="checkout_user_mode" value="new_user" id="checkout_user_mode_new" checked="checked"/>
                                    <label class="tab" for="checkout_user_mode_new" href="#checkout_new_user">
                                        <div class="tab__icon tab__icon_1"></div>
                                        <div class="tab__text">
                                            {if $user && $user.user_type == 'dealer'}
                                                Контактые данные получателя
                                            {else}
                                                Ваши контактные данные
                                            {/if}
                                        </div>
                                    </label>
                                {/if}
                            </div>
                            <div class="tab_inner">
                                <div id="checkout_user">
                                    <input type="hidden" id="authorized_last_name" value="{if $user && $user.user_type != 'dealer'}{$user.last_name}{/if}">
                                    <input type="hidden" id="authorized_first_name" value="{if $user && $user.user_type != 'dealer'}{$user.first_name}{/if}">
                                    <input type="hidden" id="authorized_second_name" value="{if $user && $user.user_type != 'dealer'}{$user.second_name}{/if}">
                                    <input type="hidden" id="authorized_phone" value="{if $user && $user.user_type != 'dealer'}{$user.login}{/if}">
                                    <input type="hidden" id="authorized_city" value="{if $user && $user.user_type != 'dealer'}{$user->city_id}{else}{/if}">
                                    <input type="hidden" id="authorized_email" value="{if $user}{$user.email}{/if}">
                                    <input type="hidden" id="city-id-hidden" value="{if $user}{$user->city_id}{else}{/if}">
                                    <input type="hidden" id="user_id" value="{if $user}{$user.id}{/if}">
                                    <input type="hidden" id="user_type" value="{if $user}{$user.user_type}{else}user{/if}">

                                    <input type="hidden" name="dealer_user[price]" id="dealer-user-price" value="0" />
                                    <div class="hidden">
                                        <textarea name="dealer_user[price_json]" id="dealer-user-price-json"></textarea>
                                    </div>

                                    <div class="inner" id="new_customer">
                                        <div>
                                        <div id="checkout_new_user">
                                            <div class="inner__block">
                                                <div>
                                                    <input
                                                            class="inner__item input-required"
                                                            type="text"
                                                            name="new_user[last_name]"
                                                            id="reg_surname"
                                                            placeholder="Фамилия"
                                                            autocorrect="off"
                                                            autocapitalize="on"
                                                            _required="required"
                                                            _pattern="^[А-ЩЬЮЯҐЄІЇЁЪЭЫа-щьюяґєіїёъэы'`’ʼ\- ]{literal}{2,}{/literal}$"
                                                    />
                                                    <div name="message" id="new_user_last_name_error"></div>
                                                </div>

                                                <div>
                                                    <input
                                                            class="inner__item input-required"
                                                            type="text"
                                                            name="new_user[first_name]"
                                                            id="reg_name"
                                                            placeholder="Имя"
                                                            autocorrect="off"
                                                            autocapitalize="on"
                                                            _required="required"
                                                            _pattern="^[А-ЩЬЮЯҐЄІЇЁЪЭЫа-щьюяґєіїёъэы'`’ʼ\- ]{literal}{2,}{/literal}$"
                                                    />
                                                    <div name="message" id="new_user_first_name_error"></div>
                                                </div>

                                                <div>
                                                    <input
                                                            class="inner__item input-required"
                                                            type="text"
                                                            name="new_user[second_name]"
                                                            id="reg_patronymic"
                                                            placeholder="Отчество"
                                                            autocorrect="off"
                                                            autocapitalize="on"
                                                            _required="required"
                                                            _pattern="^[А-ЩЬЮЯҐЄІЇЁЪЭЫа-щьюяґєіїёъэы'`’ʼ\- ]{literal}{2,}{/literal}$"
                                                    />
                                                    <div name="message" id="new_user_second_name_error"></div>
                                                </div>
                                            </div>
                                            <div class="inner__block">
                                                <div>
                                                    {literal}
                                                    <input
                                                            class="inner__item input-required"
                                                            type="text"
                                                            name="new_user[login]"
                                                            id="reg_tel"
                                                            _required="required"
                                                            _pattern="^\+?[0-9\-() ]{10,19}$"
                                                            placeholder="Моб. телефон"
                                                    />
                                                    {/literal}
                                                    <div name="message" id="new_user_login_error"></div>
                                                </div>

                                                <div class="f-i-field" id="new_user_locality">
                                                    <div id="new_user_locality_countries" class="select-country-tabs"></div>
                                                    <div class="f-i-field-border select">
                                                        <input type="text"
                                                               name="search"
                                                               id="new_user_locality_cities_suggest"
                                                               class="input-field search-text stw-popup-text custom-field-error search-text-default select-input inner__item input-required"
                                                               _required="required"
                                                               autocomplete="off"
                                                               placeholder="Введите свой город"
                                                        />
                                                    </div>
                                                </div>

                                                <div>
                                                    <input
                                                            class="inner__item input-required"
                                                            type="email"
                                                            name="new_user[email]"
                                                            id="reg_email"
                                                            placeholder="Ваш E-mail"
                                                            autocorrect="off"
                                                            autocapitalize="off"
                                                            autocomplete="new-password"
                                                            _pattern='^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{literal}{2,}{/literal})$'
                                                    />
                                                    <div name="message" id="new_user_email_error"></div>
                                                </div>
                                            </div>
                                            <div id="checkout_recipient" class="{if $user && $user.user_type == 'dealer'}hidden{/if}">
                                                <div class="row_acc show_recipient">
                                                    <input type="checkbox" value="1" name="recipient_other" id="showRecipient"/>
                                                    <label for="showRecipient">
                                                        <div class="row_acc__text">
                                                            <div class="row_acc__text_left">
                                                                <div>
                                                                    Получатель другой человек
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </label>
                                                </div>

                                                <div id="checkout_recipient_block" class="hidden">
                                                    <p style="color: red;font-style: italic;">* все поля обязательны для заполнения</p>
                                                    <div class="inner__block">
                                                        <div>
                                                            <input class="inner__item input-required"
                                                                   type="text"
                                                                   name="recipient[last_name]"
                                                                   placeholder="Фамилия"
                                                                   autocorrect="off"
                                                                   autocapitalize="on"
                                                                   _pattern="^[А-ЩЬЮЯҐЄІЇЁЪЭЫа-щьюяґєіїёъэы'`’ʼ\- ]{literal}{2,}{/literal}$"
                                                            />
                                                            <div name="message" id="recipient_last_name_error"></div>
                                                        </div>

                                                        <div>
                                                            <input class="inner__item input-required"
                                                                   type="text"
                                                                   name="recipient[first_name]"
                                                                   placeholder="Имя"
                                                                   autocorrect="off"
                                                                   autocapitalize="on"
                                                                   _pattern="^[А-ЩЬЮЯҐЄІЇЁЪЭЫа-щьюяґєіїёъэы'`’ʼ\- ]{literal}{2,}{/literal}$"
                                                            />
                                                            <div name="message" id="recipient_first_name_error"></div>
                                                        </div>

                                                        <div>
                                                            <input class="inner__item input-required"
                                                                   type="text"
                                                                   name="recipient[second_name]"
                                                                   placeholder="Отчество"
                                                                   autocorrect="off"
                                                                   autocapitalize="on"
                                                                   _pattern="^[А-ЩЬЮЯҐЄІЇЁЪЭЫа-щьюяґєіїёъэы'`’ʼ\- ]{literal}{2,}{/literal}$"
                                                            />
                                                            <div name="message" id="recipient_second_name_error"></div>
                                                        </div>
                                                    </div>
                                                    <div class="inner__block">
                                                        <div>
                                                            {literal}
                                                                <input class="inner__item input-required"
                                                                       type="text"
                                                                       name="recipient[phone]"
                                                                       placeholder="Моб. телефон"
                                                                       autocorrect="off"
                                                                       _pattern='^\+?[0-9\-() ]{1,19}$'
                                                                />
                                                            {/literal}
                                                            <div name="message" id="recipient_phone_error"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </div>
                                    </div>

                                    <div class="tab_inner inner hidden" id="checkout_member_user" name="checkout_user_panel">
                                        <div class="inner__block">
                                        <div>
                                            <div class="check-form-i f-i">
                                                <div class="f-i-text hidden">
                                                    <span class="check-form-i-text">Мобильный телефон</span>
                                                </div>
                                                <div class="f-i-field">
                                                    <p class="f-i-field-border">
                                                        {literal}
                                                            <input type="text"
                                                                   name="member_user[login]"
                                                                   class="inner__item custom-field-error input-field"
                                                                   placeholder="Моб. телефон"
                                                                   _pattern="^\+?[0-9\-() ]{9,19}$"
                                                                   autocomplete="off"
                                                            >
                                                        {/literal}
                                                    </p>
                                                    <div name="login_message"></div>
                                                </div>
                                            </div>

                                        <div id="authorization">
                                            <div class="check-form-i f-i">
                                                <div class="f-i-text hidden">
                                                    <span class="check-form-i-text">Пароль</span>
                                                </div>
                                                <div class="f-i-field">
                                                    <p class="f-i-field-border">
                                                        {literal}
                                                            <input type="password"
                                                                   name="member_user[password]"
                                                                   placeholder="Введите пароль"
                                                                   class="inner__item custom-field-error input-field">
                                                        {/literal}
                                                    </p>
                                                    <div name="message"></div>
                                                </div>
                                            </div>
                                            <div class="check-form-i btn-checkout_magrin f-i">
                                                <div class="f-i-field text-center">
                                                    {literal}
                                                        <a name="remind_password_link" class="forget forgot-pass-link" href="#remind_password">Забыли пароль?</a>
                                                        <button type="button" class="submit btn-checkout" name="member_user[sign_in]">Войти</button>
                                                    {/literal}
                                                </div>
                                            </div>
                                        </div>
                                        <div id="remind_password" class="check-form-i  btn-checkout_magrin f-i">
                                            <div class="f-i-field text-center">
                                                {literal}
                                                    <button type="button" class="submit btn-checkout btn-checkout_send" name="member_user[send_password]">Отправить</button>
                                                    <a id="remembered_password_link" class="forget forgot-pass-link" href="#authorization">Я вспомнил пароль</a>
                                                {/literal}
                                            </div>
                                        </div>
                                        </div>

                                            <aside class="clearfix check-social">
                                                <div class="user-enter-social-b">
                                                    <div class="user-enter-social-b-content">
                                                        <div class="check-social__main">
                                                            <p class="user-enter-social-b-text">Войти через аккаунт:</p>
                                                            <ul class="user-enter-social-l">
                                                                <li class="user-enter-social-l-i facebook">
                                                                    <div class="social-big-btn" name="social_button_auth" type="facebook"></div>
                                                                </li>
                                                                <li class="user-enter-social-l-i google">
                                                                    <div class="social-big-btn" name="social_button_auth" type="google"></div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </aside>
                                        </div>
                                        {*                                <div class="inner__block">*}
                                        {*                                    <input class="inner__item inner__button input-required" type="email" name="member_user[login]" placeholder="Ваш E-mail" data-placeholder="Введите корректный E-mail" id="email_entry"/>*}
                                        {*                                </div>*}

                                        {*                                <div id="authorization">*}
                                        {*                                    <div class="inner__block">*}
                                        {*                                        <input class="inner__item inner__button input-required" type="text" name="member_user[password]" placeholder="Введите пароль" data-placeholder="Неверый пароль" id="password_entry"/>*}
                                        {*                                    </div>*}

                                        {*                                    <div name="message"></div>*}

                                        {*                                    <a class="forget" onclick="tabChoice(2)" name="remind_password_link" href="#remind_password">Забыли пароль?</a>*}
                                        {*                                    <button class="submit" type="button" name="member_user[sign_in]" value="entry" id="entry">Вход</button>*}
                                        {*                                </div>*}

                                        {*                                <div id="remind_password">*}
                                        {*                                    <button class="submit" type="button" name="member_user[send_password]" value="restore" id="restore">Восстановить</button>*}

                                        {*                                    <a id="remembered_password_link" class="forgot-pass-link" href="#authorization">Я вспомнил пароль</a>*}
                                        {*                                </div>*}
                                    </div>
                                </div>

                                <div id="checkout_second_step">
                                    <div class="line"></div>

                                    <div id="checkout_delivery_payment">

                                        <div class="part">
                                            <h2 class="part__title">Доставка</h2>
                                            <div class="part__row">
                                                <div class="part__left">
                                                    <div class="part__left_item hidden">Количество мест:
                                                        <p>5 шт.</p>
                                                    </div>
                                                    <div id="weight_container" class="part__left_item">Вес:
                                                        <span id="weight_value">2.555</span>
                                                    </div>
                                                    <div id="volume_container" class="part__left_item">Объем:
                                                        <span id="volume_value">0,168 м³</span>
                                                    </div>
                                                </div>
                                                <div class="part__right">Стоимость доставки</div>
                                            </div>
                                            <div id="checkout_delivery" class="part__accordion delivery">
                                                <div id="delivery-methods" class="f-i-field"></div>
                                                <div id="uzh-pickup-block" class="hidden"></div>

                                                <div class="check-form-i" id="delivery-requirement"></div>
                                            </div>
                                        </div>
                                        <div class="line"></div>
                                        <div class="part">
                                            <h2 class="part__title">Оплата</h2>
                                            <div class="part__row">
                                                <div id="law-notice" class="part__left">Получение заказа</div>
                                                <div class="part__right">Комисия за платёж</div>
                                            </div>
                                            <div class="part__accordion pay">
                                                <div id="payment-method-cash-disabled" class="row_acc inactive hidden">
                                                    <input type="radio" disabled="disabled"/>
                                                    <label for="in_parts">
                                                        <div class="row_acc__text">
                                                            <div class="row_acc__text_left">
                                                                Оплата при получении недоступна (минимальный заказ от {$settings.Orders_Checkout.cash_max_total|intval} грн)
                                                            </div>
                                                        </div>
                                                    </label>
                                                    <div></div>
                                                </div>

                                                <div id="checkout_payment_methods" class="f-i-field"></div>

                                                <div class="row_acc inactive">
                                                    <input type="radio" disabled="disabled"/>
                                                    <label for="in_parts">
                                                        <div class="row_acc__text">
                                                            <div class="row_acc__text_left">Оплата частями недоступна</div>
                                                        </div>
                                                    </label>
                                                    <div></div>
                                                </div>

                                                {if $cart->has_customized_goods}
                                                    <div class="hidden">
                                                        <input type="hidden" name="cashless_business[title]">
                                                        <input type="hidden" name="cashless_business[code]">
                                                    </div>
                                                {/if}

                                                {if $user && $user.user_type == 'dealer'}
                                                <div class="row_acc inactive">
                                                    <input type="radio" disabled="disabled"/>
                                                    <label for="in_parts">
                                                        <div class="row_acc__text">
                                                            <div class="row_acc__text_left">Отправка по Вашему ТТН - недоступна</div>
                                                        </div>
                                                    </label>
                                                    <div></div>
                                                </div>

                                                    {if $user.balance < 0}
                                                        <div class="row_acc inactive">
                                                            <input type="radio" disabled="disabled"/>
                                                            <label for="in_parts">
                                                                <div class="row_acc__text">
                                                                    <div class="row_acc__text_left">Оплата при получении - недоступна</div>
                                                                </div>
                                                            </label>
                                                            <div></div>
                                                        </div>
                                                    <div class="dealer-price-error-balance">Внимание! Оплата при получении недоступна, ожидаем пополнение баланса!</div>
                                                    {/if}
                                                {/if}
                                            </div>
                                        </div>
                                    </div>

                                    <script>
                                        var call_confirmation_disabled = {$settings.Orders_Checkout.disable_call_confirmation|intval};
                                    </script>
                                    <div id="call-confirmation-disabled">
                                        {if $settings.Orders_Checkout.disable_call_confirmation}
                                            <div>
                                                <p>Ваш заказ будет обработан <strong>без звонка</strong>, ожидайте информацию в SMS уведомлении.</p>
                                                <p>Внимание! Остались вопросы, нужна консультация?<br>Воспользуйтесь полем "Добавить комментарий к заказу".</p>
                                            </div>
                                        {/if}
                                    </div>

                                    <div class="line"></div>

                                    <div id="check-form-i-call-block" class="part">
                                        <h2 class="part__title">Подтверждение</h2>

                                        <details id="comment-wrap">
                                            <summary class="summary">
                                                <div class="summary__row">
                                                    <div class="summary__icon summary__icon_2"></div>
                                                    <div id="add_comment" class="summary__text">
                                                        {if $user && $user.user_type == 'dealer'}
                                                            <strong>Трудности с оформление заказа?</strong><br>
                                                            Запрос на тех. поддержку, отправка через 24 часа
                                                        {else}
                                                            <strong>Добавить комментарий к заказу</strong>
                                                        {/if}
                                                    </div>
                                                    <div class="summary__chevron"></div>
                                                </div>
                                            </summary>
                                            <textarea name="comment" id="comment" cols="100%" rows="max-content" placeholder="Комментарий к заказу"></textarea>
                                        </details>

                                        <div class="{if $settings.Orders_Checkout.disable_call_confirmation == 1 || $user.user_type == 'dealer'}hidden{/if}">
                                            <div id="call" class="part__accordion"></div>
                                        </div>
                                    </div>

                                    <div class="row_acc agree">
                                        <input type="checkbox" value="agree" name="agree" id="agree" checked="checked"/>
                                        <label for="agree">
                                            <div class="row_acc__text">
                                                <div class="row_acc__text_left">
                                                    <div>
                                                        {if $menu.www->guaranty}
                                                            Подтверждая заказ, я принимаю <a href="{$menu.www->guaranty.href}" target="_blank">условия гарантии</a> интернет-магазина IntexPool.ua
                                                        {else}
                                                            Подтверждая заказ, я принимаю условия гарантии интернет-магазина IntexPool.ua
                                                        {/if}
                                                    </div>
                                                </div>
                                            </div>
                                        </label>
                                    </div>

                                    <div style="margin: 10px 0 0 54px;">
                                        <div id="agree-error" class="text-error"></div>
                                    </div>

                                    <button class="submit disabled" type="submit" id="order-submit" disabled="disabled">
                                        Заказ подтверждаю
                                    </button>

                                    <div class="error-text hidden">Проверьте все обязательные поля</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="content__2">
                        <section id="cart">
                            <div class="part">
                                <div class="part__row">
                                    <h2 class="part__title">Корзина</h2>
                                    <a class="part__button" href="javascript:history.go(-1);">
                                        <span>Продолжить покупки</span>
                                        <span class="chevron__right"></span>
                                    </a>
                                </div>
                            </div>

                            <div id="cart-error" class="checkout-error-message hidden"></div>

                            {include file="checkout/order.tpl" cart=$cart}
                        </section>
                        <div id="not_available_purchases" class="hidden"></div>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <div class="overlay hidden" id="popup_callback_1">
        <div class="overflow">
            <div class="overflow__box popup">
                <div class="overflow__box_close" onclick="popupClose('popup_callback_1')"></div>
                <div class="screen_callback">
                    <div class="screen_callback__box_1">
                        <h2 class="screen_callback__title">Чат центр | Колл центр</h2>
                        <div>
                            {if $user && $user.user_type == 'dealer'}
                                {GoodsDescriptions->getRecord id=3753}
                            {else}
                                {GoodsDescriptions->getRecord id=3897}
                            {/if}
                        </div>
                    </div>
                </div>
            </div>
            <div class="overflow__close" onclick="popupClose('popup_callback_1')"></div>
        </div>
    </div>

    <div class="overlay hidden" id="popup_uzhhorod_map">
        <div class="overflow">
            <div class="overflow__box popup">
                <div class="overflow__box_close" onclick="popupClose('popup_uzhhorod_map')"></div>
                <div class="screen_callback">
                    <div class="screen_callback__box_1">
                        <h2 class="screen_callback__title">Точка выдачи интернет магазина IntexPool</h2>
                        <div>
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1318.852722486893!2d22.27477960159068!3d48.615481281864696!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47391855d2c973df%3A0x72812a7e2e099016!2sIntexPool!5e0!3m2!1sru!2sua!4v1637012784435!5m2!1sru!2sua" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                        </div>
                    </div>
                </div>
            </div>
            <div class="overflow__close" onclick="popupClose('popup_uzhhorod_map')"></div>
        </div>
    </div>
</div>

<script>
    // function selectClose() {
    //     for (let i = 0; i < document.querySelectorAll('.select').length; i++) {
    //         document.querySelectorAll('.select')[i].classList.remove('active');
    //     }
    // }

    // function selectList(e) {
    //     let element = e.target;
    //     let select = element.classList.contains('select') ? element : element.closest('.select');
    //     if (!select.classList.contains('active')) {
    //         select.classList.add('active');
    //     } else {
    //         if (element.tagName == 'li' || element.closest('li')) {
    //             select.querySelector('input').value = element.innerText;
    //         }
    //         if (!select.querySelector('input:focus')) {
    //             select.classList.remove('active');
    //         }
    //     }
    // }

    // function selectSearch(e) {
    //     let find = e.target.value.toLowerCase();
    //     let list = e.target.closest('.select').querySelectorAll('.select-list li')
    //     let arr_list = [];
    //     for (let i = 0; i < list.length; i++) {
    //         if (list[i].innerText.toLowerCase().indexOf(find) === 0) {
    //             list[i].classList.remove('hidden');
    //         } else {
    //             list[i].classList.add('hidden');
    //         }
    //
    //     }
    // }

    // if (document.querySelector('.select')) {
    //     for (let i = 0; i < document.querySelectorAll('.select').length; i++) {
            // document.querySelectorAll('.select')[i].addEventListener('click', selectList);
            // document.querySelectorAll('.select')[i].querySelector('.select-input').addEventListener('keyup', selectSearch);
            // document.querySelectorAll('.select')[i].querySelector('.select-input').addEventListener('change', selectSearch);
        // }
    // }


    // function documentClicks() {
    //     document.addEventListener('click', function (e) {
    //
    //         // Все действия с этом блоке зависят от element
    //         let element = e.target;
    //
    //         if (document.querySelector('.select')) {
    //             if (element.classList.contains('select') || element.closest('.select')) {
    //             } else {
    //                 selectClose();
    //             }
    //         }
    //     });
    // }
    "use strict";

    /* BEGIN BASE FUNCTIONS */

    // Модальные окна.
    function popupOpen(eID) {
        document.querySelector('body').classList.add('overflow-hidden');
        let element = document.getElementById(eID);
        element.classList.remove('hidden');
    }
    function popupClose(eID) {
        document.querySelector('body').classList.remove('overflow-hidden');
        let element = document.getElementById(eID);
        element.classList.add('hidden');
    }

    //табы
    function tabChoice(num) {
        let elements = document.querySelectorAll('.tab_inner');
        for (let i = 0; i < elements.length; i++) {
            elements[i].classList.add('hidden');
        }
        switch (num) {
            case 0:
                elements[0].classList.remove('hidden');
                break;
            case 1:
                elements[1].classList.remove('hidden');
                break;
            case 2:
                elements[2].classList.remove('hidden');
                break;
        }
    }

    // Циклические ссылки
    function circularReference() {
        // Против циклических ссылок на главной
        if (document.querySelector('.home')) {
            let home = document.querySelectorAll('.home');
            for (let i = 0; i < home.length; i++) {
                home[i].addEventListener('click', function () {
                    window.location.pathname = '/';
                });
            }
        }
        // Против циклических ссылок на других страницах
        if (document.querySelector('.self')) {
            let self = document.querySelectorAll('.self');
            for (let i = 0; i < self.length; i++) {
                self[i].addEventListener('click', function () {
                    window.location = window.location;
                });
            }
        }
    }

    //invalid input
    // function invalid(e) {
    //     if (e.target.value == '') {
    //         e.target.placeholder = e.target.dataset.placeholder;
    //         e.target.classList.add('input-invalid');
    //     } else {
    //         e.target.classList.remove('input-invalid');
    //     }
    // }
    // let input_required = document.querySelectorAll('.input-required');
    // for (let i = 0; i < input_required.length; i++) {
    //     input_required[i].addEventListener('change', invalid);
    //     input_required[i].addEventListener('click', invalid);
    //     input_required[i].addEventListener('keyup', invalid);
    // }

    //счётчик товаров
    function addHandlers(count) {
        let minus = count.querySelector(".quantity__minus");
        let number = count.querySelector(".quantity__number");
        let plus = count.querySelector(".quantity__plus");
        let quantity = number.value;

        plus.addEventListener("click", function () {
            quantity++;

            number.value = quantity;
        });
        minus.addEventListener("click", function () {
            if(quantity <= 1) {
                return;
            }

            quantity--;

            number.value = quantity;

            if(quantity === 1) {
                minus.classList.add('inactive');
            } else {
                minus.classList.remove('inactive');
            }
        });
    }

    let counts = document.querySelectorAll(".quantity");
    counts.forEach(addHandlers);
    /* END BASE FUNCTIONS */

    // Основной код после загрузки страницы.
    document.addEventListener('DOMContentLoaded', function () {



        (function () { // Базовые функции
            circularReference();
            // documentClicks();
        }());
    });
</script>

{include file="main/clear-cart-if-need.tpl"}

{Users->getUser assign="user"}
{Users->getAgreements assign="agreements"}
{if $user.user_type == 'dealer' && count($agreements) > 0}
    <div class="overlay hidden" id="popup_callback_3">
        <div class="overflow">
            <div class="overflow__box popup">
                <div class="screen_callback">
                    <div class="screen_callback__box_1">
                        <h3 class="screen_callback__title">Внимание! Изменения на сайте!</h3>
                        <p>
                            Пожалуйста, чтоб продолжить работу (оформить заказ), ознакомьтесь с информацией:
                        </p>
                        {foreach from=$agreements item=item name=agreements}
                            <div style="font-size: 15px; margin-bottom: 8px;">
                                <a href="{$menu.my->profile->agreements.href}?id={$item.id}">{$item.title}</a>&nbsp;&mdash;&nbsp;Ожидаем Ваше подтверждение, кнопка "Я ознакомился"
                            </div>
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        popupOpen('popup_callback_3');
        var checkbox = $('rules');

        checkbox.addEvent('change', function() {
            checkbox.set('disabled', true);
            checkbox.addClass('disabled');

            new Request({
                url: '/cgi-bin/form.php',
                data: {
                    json: 1,
                },
                headers: {
                    ajaxAction: '{$menu.www.href}users/#applyAllAgreements'
                },
                onSuccess: function () {
                    popupClose('popup_callback_3')
                }.bind(this),
                onFailure: function () {
                    checkbox.set('disabled', false);
                    checkbox.removeClass('disabled');

                    alert('Ошибка на сервере');
                }.bind(this)
            }).send();
        });
    </script>
{/if}