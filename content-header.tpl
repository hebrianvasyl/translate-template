{Goods->hidePhones record=$menu.active assign=hide_phones}
{assign var="hide_phones" value=$hide_phones scope="global"}

{Goods->hideCallback record=$menu.active assign=hide_callback}
{assign var="hide_callback" value=$hide_callback scope="global"}

{Goods->getPhones record=$menu.active assign=phones}
{assign var="phones" value=$phones scope="global"}

{include file="top-banner.tpl"}
<header class="header">
	<div class="menu-top">
    <div class="menu__overlay" onclick="BurgerMenuClose()"></div>
    <div class="menu-top-intro">
      <div class="close-menu">
        <div class="close-menu-block" onclick="BurgerMenuClose()">
          <svg width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M1 15L15 1M1 1l14 14L1 1z" stroke="#191A1C" />
          </svg>
        </div>
      </div>
      <div class="body-layout wrap clearfix">
        <div class="logo float-lt">
            {include file="content-header-logo.tpl"}
        </div>
        <nav>
          <ul class="cite-map-l float-lt clearfix">
            {*
					{if $menu.www->about}
              <li class="cite-map-l-i float-lt"{if $menu.www->about->isMediate()} class="active"{/if}>
                {if $menu.www->about->isMediate()}
                  {$menu.www->about.title}
                {else}
                  <a href="{$menu.www->about.href}">{$menu.www->about.title}</a>
                {/if}
              </li>
            {/if}

					{if $menu.www->news}
						<li class="cite-map-l-i float-lt"{if $menu.www->news->isMediate()} class="active"{/if}>
							{if $menu.www->news->isMediate()}
								{$menu.www->news.title}
							{else}
								<a href="{$menu.www->news.href}">{$menu.www->news.title}</a>
							{/if}
						</li>
					{/if}
					*}

            {if $menu.www->promotions}
              <li class="cite-map-l-i float-lt"{if $menu.www->promotions->isMediate()} class="active"{/if}>
                {if $menu.www->promotions->isMediate()}
                  {$menu.www->promotions.title}
                {else}
                  <a href="{$menu.www->promotions.href}">{$menu.www->promotions.title}</a>
                {/if}
              </li>
            {/if}
                      {if $menu.www->catalogs}
                      <li class="cite-map-l-i float-lt"{if $menu.www->catalogs->isMediate()} class="active"{/if}>
                          {if $menu.www->catalogs->isMediate()}
                          {$menu.www->catalogs.title}
                          {else}
                          <a href="{$menu.www->catalogs.href}">{$menu.www->catalogs.title}</a>
                          {/if}
                      </li>
                      {/if}
            {if $menu.www->help}
              <li class="cite-map-l-i float-lt"{if $menu.www->help->isMediate()} class="active"{/if}>
                {if $menu.www->help->isMediate()}
                  {$menu.www->help.title}
                {else}
                  <a href="{$menu.www->articles.href}">{$menu.www->help.title}</a>
                {/if}
              </li>
            {/if}
                      <li class="cite-map-l-i float-lt">
                          <a href="/videocontent/online-consultant/">{'Онлайн консультант'|translate}</a>
                      </li>
            {if $menu.www->wholesale}
              <li class="cite-map-l-i float-lt"{if $menu.www->wholesale->isMediate()} class="active"{/if}>
                {if $menu.www->wholesale->isMediate()}
                  {$menu.www->wholesale.title}
                {else}
                  <a href="{$menu.www->wholesale.href}">{$menu.www->wholesale.title}</a>
                {/if}
              </li>
            {/if}
            {if $menu.www->dostavka_i_oplata}
              <li class="cite-map-l-i float-lt"{if $menu.www->dostavka_i_oplata->isMediate()} class="active"{/if}>
                {if $menu.www->dostavka_i_oplata->isMediate()}
                  {$menu.www->dostavka_i_oplata.title}
                {else}
                  <a href="{$menu.www->dostavka_i_oplata.href}">{$menu.www->dostavka_i_oplata.title}</a>
                {/if}
              </li>
            {/if}
            {if $menu.www->guaranty}
              <li class="cite-map-l-i float-lt"{if $menu.www->guaranty->isMediate()} class="active"{/if}>
                {if $menu.www->guaranty->isMediate()}
                  {$menu.www->guaranty.title}
                {else}
                  <a href="{$menu.www->guaranty.href}">{$menu.www->guaranty.title}</a>
                {/if}
              </li>
            {/if}
            {if $menu.www->contacts}
              <li class="cite-map-l-i float-lt"{if $menu.www->contacts->isMediate()} class="active"{/if}>
                {if $menu.www->contacts->isMediate()}
                  {$menu.www->contacts.title}
                {else}
                  <a href="{$menu.www->contacts.href}">{$menu.www->contacts.title}</a>
                {/if}
              </li>
            {/if}
          </ul>
        </nav>
        <div class="catalog-item-menu" onclick="CatalogOpen()">
          <div class="catalog-item-menu-icon"><svg viewBox="0 0 24 24" id="icon-catalog">
              <g clip-rule="evenodd" fill-rule="evenodd">
                <path
                  d="m17 2.75735-4.2427 4.24264 4.2427 4.24261 4.2426-4.24261zm-5.6569 2.82843c-.7811.78104-.7811 2.04738 0 2.82842l4.2426 4.2427c.7811.781 2.0475.781 2.8285 0l4.2426-4.2427c.781-.78104.781-2.04738 0-2.82842l-4.2426-4.24264c-.781-.781048-2.0474-.781048-2.8285 0z">
                </path>
                <path
                  d="m7 4h-4c-.55228 0-1 .44772-1 1v4c0 .5523.44772 1 1 1h4c.55228 0 1-.4477 1-1v-4c0-.55228-.44772-1-1-1zm-4-2c-1.65685 0-3 1.34315-3 3v4c0 1.6569 1.34315 3 3 3h4c1.65685 0 3-1.3431 3-3v-4c0-1.65685-1.34315-3-3-3z">
                </path>
                <path
                  d="m7 16h-4c-.55228 0-1 .4477-1 1v4c0 .5523.44772 1 1 1h4c.55228 0 1-.4477 1-1v-4c0-.5523-.44772-1-1-1zm-4-2c-1.65685 0-3 1.3431-3 3v4c0 1.6569 1.34315 3 3 3h4c1.65685 0 3-1.3431 3-3v-4c0-1.6569-1.34315-3-3-3z">
                </path>
                <path
                  d="m19 16h-4c-.5523 0-1 .4477-1 1v4c0 .5523.4477 1 1 1h4c.5523 0 1-.4477 1-1v-4c0-.5523-.4477-1-1-1zm-4-2c-1.6569 0-3 1.3431-3 3v4c0 1.6569 1.3431 3 3 3h4c1.6569 0 3-1.3431 3-3v-4c0-1.6569-1.3431-3-3-3z">
                </path>
              </g>
            </svg>
          </div>
          <div class="catalog-item-menu-text">Каталог товаров</div>
        </div>
        <div class="mob-phones">
          <div class="mob-phones__icon">
            <svg version="1.1" id="Layer_2" xmlns="http://www.w3.org/2000/svg"
              xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="100px" height="100px"
              viewBox="-74 0 100 100" style="enable-background:new -74 0 100 100;" xml:space="preserve">
              <path d="M21.2,71.7L9.1,59.5c-2-2-4.7-3.2-7.2-3.2c-2.7,0-5.1,1.1-7.2,3.2l-7,7c-0.3-0.2-0.7-0.4-1-0.5c0,0-0.1,0-0.1-0.1l-0.1-0.1
                	c-0.9-0.6-1.9-1.2-3.1-1.7c-6.1-3.8-11.8-9.1-17.6-16.2c-2.7-3.4-4.6-6.4-6.1-9.7l0,0c1.6-1.3,2.8-2.6,3.7-3.6l3.1-3.1
                	c2.4-2.2,3.6-4.7,3.6-7.3c0-2.7-1.2-5.2-3.5-7.6l-9.5-9.5c-0.9-0.9-1.8-1.8-2.8-2.7c-2-1.9-4.5-3-7.1-3c-2.9,0-5.3,1-7.5,3.2
                	l-7.3,7.3c-2.9,2.7-4.6,6.1-5,10.3l0,0.1c-0.2,5.2,0.6,10,2.8,16c3.5,9.4,8.8,18.2,16.7,27.9C-42.8,77.8-31.2,86.8-18.3,93l0.3,0.1
                	c3.8,1.7,11,4.9,19,5.4l1.1,0c5.3,0,9.3-1.7,12.6-5.3c1.2-1.4,2.5-2.7,3.6-3.9c0.9-0.7,1.5-1.4,2.1-2.1l0.8-0.8l0.2-0.2
                	C25.6,81.6,25.6,76,21.2,71.7z M17.7,82.8l-1,1L16.6,84c-0.5,0.6-0.9,1.1-1.4,1.5l-0.3,0.3c-1.2,1.2-2.6,2.6-4,4.2
                	c-2.3,2.5-4.9,3.6-8.8,3.6H1.3c-7-0.5-13.4-3.3-17.2-5l-0.2-0.1C-28.4,82.6-39.5,74-49.2,63c-7.6-9.2-12.6-17.6-15.9-26.4
                	c-2-5.5-2.7-9.5-2.5-14c0.3-2.9,1.4-5.2,3.4-7l7.4-7.4c1.2-1.2,2.4-1.7,3.9-1.7c1.3,0,2.5,0.6,3.6,1.6l0.1,0.1
                	c0.9,0.8,1.8,1.7,2.7,2.6l9.5,9.5c1.8,1.8,2.1,3.2,2.1,4c0,0.8-0.2,2-2.1,3.7l-3.2,3.2c-1.1,1.2-2.4,2.5-4.1,3.9l-0.2,0.2l-0.2,0.3
                	c-0.9,1.2-1,2.3-0.5,3.9l0.1,0.4l0.1,0.4c1.7,3.7,3.8,7.1,6.8,10.9c6.2,7.6,12.4,13.3,19,17.4l0.3,0.2c0.8,0.4,1.6,0.8,2.3,1.2
                	c0.3,0.3,0.7,0.5,1,0.6c0.4,0.2,0.7,0.3,0.9,0.5l0.7,0.5h0.2l0.3,0.1c0.6,0.2,1,0.2,1.3,0.2c1,0,1.9-0.4,2.8-1.3l7.5-7.5
                	c1.2-1.2,2.3-1.7,3.7-1.7c1.5,0,2.9,0.9,3.7,1.7l12.2,12.2C20.1,77.7,20.2,80.2,17.7,82.8z" />
            </svg>
          </div>
          <ul class="mob-phones__number">
            <li class="mob-phones__number-i" name="additional_phone">
              <span class="mob-phones__number-1">(067) 310 66 10</span>
            </li>
            <li class="mob-phones__number-i" name="additional_phone">
              <span class="mob-phones__number-2">(099) 007 27 92</span>
            </li>
          </ul>
        </div>

        <div class="messengers-icons-block">
            <a href="viber://pa?chatURI=intexpool_bot" class="icon-viber tooltip" target="_blank">
                <img data-src="{$settings.path.design}/_.gif" class="lazyload">
                <span class="tooltiptext tooltip-bottom">{'Открыть Viber'|translate}</span>
            </a>
            <a href="http://m.me/379391889115786" class="icon-messenger tooltip" target="_blank">
                <img data-src="{$settings.path.design}/_.gif" class="lazyload">
                <span class="tooltiptext tooltip-bottom">Открыть Messenger</span>
            </a>
            <a href="https://t.me/intexpool_bot" class="icon-telegram tooltip" target="_blank">
                <img data-src="{$settings.path.design}/_.gif" class="lazyload">
                <span class="tooltiptext tooltip-bottom">Открыть Telegram</span>
            </a>
        </div>
        <div id="user_enter" class="user-enter-b float-rt">
          <script type="text/javascript">
              MenuUser.init();
              App.get('User').setPopupParent('user_enter');
          </script>
        </div>

            <div style="margin-right: 30px; float: right;">
{*                {include file="languages.tpl"}*}
            </div>

              <div style="display: block;float: right;height: 22px;justify-content: center;align-items: center;margin: 0 20px 0 0;">
                  {if !empty($menu.active.multilang)}
                  {Languages->getSwitch assign="switch"}
                  {foreach from=$switch item="lang"}
                  {if $lang.is_current}
                  <span style="margin: 0 0 0 5px;">{$lang.title}</span>
                  {else}
                  {if $lang.is_primary}
                  <a href="/" style="margin: 0 0 0 5px;">{$lang.title}</a>
                  {else}
                  <a href="/{$lang.name}/" style="margin: 0 0 0 5px;">{$lang.title}</a>
                  {/if}
                  {/if}
                  {/foreach}
                  {/if}
              </div>
      </div>
    </div>
	</div>

	<div class="header-content body-layout wrap">

		<div class="header-content-i clearfix">
			<div class="menu-burger" onclick="BurgerMenuOpen()">
        <?xml version="1.0" ?>
        <svg viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
          <g data-name="Layer 2" id="Layer_2">
            <path d="M28,10H4A1,1,0,0,1,4,8H28a1,1,0,0,1,0,2Z"></path>
            <path d="M28,17H4a1,1,0,0,1,0-2H28a1,1,0,0,1,0,2Z"></path>
            <path d="M28,24H4a1,1,0,0,1,0-2H28a1,1,0,0,1,0,2Z"></path>
          </g>
          <g id="frame">
          </g>
        </svg>
      </div>

			<div class="logo float-lt">

				{include file="content-header-logo.tpl"}

			</div>

			<!--блок попапа выбора городов-->

			<div class="hider-side-right">
				<div class="float-rt">
					<ul class="compare-box-l clearfix">
						<li class="compare-box-l-i float-lt">
							<div id="comparison"></div>
							<script type="text/javascript">Comparison.init('comparison')</script>
						</li>
					</ul>
					<div class="header-cart clearfix" id="cart_in_header"></div>
				</div>
				<script type="text/javascript">Cart.init('cart_in_header')</script>

				<div class="mobile-phones-block">
                    {if $hide_phones === false && count($phones) > 0}
                    <i class="icon-cellphones"></i>
					<ul class="contact-phones-l contact-phones-l-i-icon clearfix">
                        {foreach from=$phones item=phone name=header_phones}
						<li class="contact-phones-l-i" name="additional_phone">
                            <span class="binct-phone-number-{$phone@iteration}">{$phone}</span>
                            {if false && $smarty.foreach.header_phones.first}{/if}
                        </li>
                        {/foreach}
					</ul>
                    {else}
                    &nbsp;
                    {/if}
				</div>

                {*include file="city-switcher.tpl"*}

				<div class="search-block">
					<div class="search">
						<form method="get" name="searchForm" action="{$menu.www.href}search/">
							<div class="search-text-wrap">
								<div id="suggest-result"></div>
								<input autocomplete="off" id="search-text" type="text" name="text" class="search-text custom-field-error" placeholder="Поиск" {*value="{if isset($searchResults)}{$searchResults.text}{/if}"*} _required="required">
							</div>
							<span class="btn-link btn-link-blue">
							    <button type="submit" class="btn-link-i">Найти</button>
						    </span>
                            <script>
                                SearchSuggest.init('search-text');
                            </script>
						</form>
                        <div class="search-icon-mobile"></div>
                        <div id="search_example" class="hidden"></div>
					</div>
				</div>

                <div class="messengers-icons-block">
                    <a href="viber://pa?chatURI=intexpool_bot" class="icon-viber tooltip" target="_blank">
                        <img data-src="{$settings.path.design}/_.gif" class="lazyload">
                        <span class="tooltiptext tooltip-bottom">{'Открыть Viber'|translate}</span>
                    </a>
                    <a href="http://m.me/379391889115786" class="icon-messenger tooltip" target="_blank">
                        <img data-src="{$settings.path.design}/_.gif" class="lazyload">
                        <span class="tooltiptext tooltip-bottom">{'Открыть Messenger'|translate}</span>
                    </a>
                    <a href="https://t.me/intexpool_bot" class="icon-telegram tooltip" target="_blank">
                        <img data-src="{$settings.path.design}/_.gif" class="lazyload">
                        <span class="tooltiptext tooltip-bottom">Открыть Telegram</span>
                    </a>
                </div>

				{*
				<div class="callback-block hidden">
					<div id="contact_phones" class="contact-phones-b">
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
					</div>
				</div>
				*}

			</div>

			<div class="catalog">
        <div class="close-menu">
          <div class="close-menu-block" onclick="CatalogClose()">
            <svg width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M1 15L15 1M1 1l14 14L1 1z" stroke="#191A1C" />
            </svg>
          </div>
        </div>
				{include file="goods/content-header-menu.tpl" goods_nodes=$menu.www}

				{if $menu.1.group!="goods"}
					<div class="collage"><div></div></div>
				{/if}
			</div>
		</div>
	</div>
</header>