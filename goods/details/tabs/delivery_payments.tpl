{Cities->getUserCity assign="user_city"}

<div class="tabs-content-wrap delivery-payment-tab">
    <div class="clearfix">
        <div class="content">
            {$content nofilter}
        </div>
        {*
        <div class="calculator">
            <div class="inner">
                <h2>Расчет стоимости доставки</h2>

                <form class="personal-information check-lt" action="/cgi-bin/form.php" method="POST">
                    <div class="user-info">
                        <div class="check-form-i">
                            <span class="check-form-i-text valigned-middle">Дата отправки:</span>
                            <div id="delivery-time" class="f-i-field delivery-time">
                                {if date('H') < 12 && date('w') != 0}
                                Сегодня, {$today|@date_format:"%e"} {$today|@date_format:"%m"|@month_title:genitive}
                                {elseif date('H') >= 12 && date('w') != 6}
                                Завтра, {$tomorrow|@date_format:"%e"} {$tomorrow|@date_format:"%m"|@month_title:genitive}
                                {else}
                                Послезавтра, {$after_tomorrow|@date_format:"%e"} {$after_tomorrow|@date_format:"%m"|@month_title:genitive}
                                {/if}
                            </div>
                        </div>

                        <div class="check-form-i check-form-i_town">
                            <span class="check-form-i-text valigned-middle">Куда:</span>
                            <div class="f-i-field" id="new_user_locality">
                                <div id="countries"></div>
                                <div class="f-i-field-border">
                                    <input type="text"
                                            id="new_user_locality_cities_suggest"
                                            class="input-field search-text stw-popup-text custom-field-error search-text-default"
                                            _required="required"
                                            placeholder="Введите свой город"
                                            autocomplete="off" />
                                    <button class="btn-field-list cities-show-default"></button>
                                </div>
                            </div>
                            <div class="clear"></div>

                            <input type="hidden" name="city_id" value="{$user_city.id}">
                            <input type="hidden" id="city-id-hidden" value="{$user_city.id}">
                        </div>

                        <div class="check-form-i">
                            <span class="check-form-i-text valigned-middle">Доставка:</span>
                            <div class="f-i-field" id="delivery-methods"></div>
                        </div>

                        <div class="check-form-i">
                            <span class="check-form-i-text valigned-middle">Оплата:</span>
                            <div class="f-i-field" id="payment-methods"></div>
                        </div>
                    </div>
                </form>

                <div class="calculation-data">
                    <table>
                        <tr class="hidden">
                            <td>
                                Стоимость доставки:
                            </td>
                            <td class="last">
                                <div id="delivery-cost"></div>
                            </td>
                        </tr>
                        <tr class="hidden">
                            <td>
                                Комиссия за платеж:
                            </td>
                            <td class="last">
                                <div id="payment-cost"></div>
                            </td>
                        </tr>
                    </table>

                    {if $goods_weight || $goods_volume}
                    <table>
                        <tr>
                            <td>
                                Вес:
                            </td>
                            <td class="last">
                                {$goods_weight}
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Объем:
                            </td>
                            <td class="last">
                                {$goods_volume}
                            </td>
                        </tr>
                    </table>
                    {/if}
                </div>
            </div>
        </div>
        *}
    </div>
</div>

<script>
    if (typeof fx == 'undefined') {
        var fx = {};
    }

    Array.each($$('.accordion > .content'), function(element, index){
        var i = 'index-' + index;
        element.setProperty('data-index', index);
        fx[i] = new Fx.Slide(element, {
            resetHeight: true
        });
        fx[i].hide();
    });
</script>

{*
<script>
    var record_id = {$record_id};
    var goods_price = {$price};

    $$('.delivery-payment-tab .calculator .inner').processStart('<img src="{$settings.path.images}/ajax.gif" alt="AJAX process"/>');

    App.addOnDomReady(function () {
        var city_id = parseInt($(document.body).getElement('[name="city_id"]').getProperty('value'));
        var new_user_locality = document.id('new_user_locality');
        var citySwitcher = new CitySwitcherComponent_class({});
        citySwitcher.options.name = 'new_user[locality_id]';
        citySwitcher.options.elements = {
            countries: {
                selector: '#countries',
                element_constructor: SelectListElement_class,
                options: {
                    default_value: function (countries, element) {
                        return countries && countries.length
                            ? countries[0][element.options.data_key]
                            : null;
                    }
                }
            },
            cities: null,
            cities_suggest: {
                selector: '#new_user_locality_cities_suggest',
                element_constructor: CitySuggestElement_class,
                options: {
                    suggest_options: {
                        show_on_focus: false,
                        styles: {
                            'z-index': 200
                        }
                    }
                }
            }
        };
        citySwitcher.options.binds = {
            filter_cities_on_country_change: null,
            filter_suggest_on_country_change: null,
            on_suggest_selected: {
                event_element: 'cities_suggest',
                event: 'change',
                callback: function(suggest){

                    $$('.delivery-payment-tab .calculator .inner').processStart('<img src="{$settings.path.images}/ajax.gif" alt="AJAX process"/>');

                    city_id = suggest.getValue();

                    $(document.body).getElement('[name="city_id"]').setProperty('value', city_id);

                    load_delivery_methods();

                    new Request({
                        url: '/cgi-bin/form.php',
                        data: {
                            city_id: city_id
                        },
                        headers: {
                            ajaxAction: '{$menu.www.href}cities/#setUserCityAJAX'
                        }
                    }).send();
                }
            }
        };

        $('delivery-methods').addEvent('change:relay([name=delivery_method_id])', function(event, target) {
            delivery_method_id = parseInt(target.value);
            delivery_method = delivery_data[delivery_method_id];

            load_payment_methods();
        });

        var payments = {UsersPaymentsMethods->getPaymentData json=1 for_all_stores=true ignore_cart=true},
            payment_data = {},
            payment_method,
            payment_method_id,
            delivery_data = {},
            delivery_method,
            delivery_method_id;

        var load_delivery_methods = function() {
            new Request({
                url: '/cgi-bin/form.php',
                data: {
                    json: 1,
                    for_all_stores: true,
                    city_id: city_id
                },
                headers: {
                    ajaxAction: '{$menu.www.href}delivery_places/#getDeliveryDataAjax'
                },
                onSuccess: function (resp) {
                    $('delivery-methods').set('html', '');

                    var result = JSON.parse(resp);

                    Object.each(result.methods, function(method) {

                        delivery_data[method.id] = method;

                        if ( method.payment_method_ids.length ) {
                            var el = new Element('li', {
                                'id': 'delivery-method-' + method.name,
                                'class': 'methods-l-i hidden',
                                'html': '<div class="method-wrap"><label><input class="method-radio" type="radio" value="' + method.id + '" name="delivery_method_id"><div class="check"></div>' + method.title + '</label></div>'
                            });
                            el.inject($('delivery-methods'));
                        }

                    });

                    if (parseInt(city_id) == 895) {
                        $$('#delivery-methods .methods-l-i').hide();
                        $('delivery-method-uzh_pickup').show();
                    } else {
                        $$('#delivery-methods .methods-l-i').show();
                        $('delivery-method-uzh_pickup').hide();
                    }

                    var selected_delivery_method = null;
                    if(delivery_method) {
                        if($('delivery-method-' + delivery_method.name) && !$('delivery-method-' + delivery_method.name).hasClass('hidden')) {
                            selected_delivery_method = $('delivery-method-' + delivery_method.name).getElement('[name=delivery_method_id]');
                        }
                    }

                    if(!selected_delivery_method) {
                        selected_delivery_method = $('delivery-methods').getFirst('.methods-l-i:not(.hidden)').getElement('[name=delivery_method_id]');
                    }

                    selected_delivery_method.set('checked', true);

                    delivery_method_id = parseInt(selected_delivery_method.value);
                    delivery_method = delivery_data[delivery_method_id];

                    load_payment_methods();

                }.bind(this)

            }).send();
        };

        $('payment-methods').addEvent('change:relay([name=payment_method_id])', function(event, target) {
            payment_method_id = parseInt(target.value);
            payment_method = payment_data[payment_method_id];

            calculate(false, true);

            if(payment_method.name == 'liqpay' || payment_method.name == 'novapay' || payment_method.name == 'privatbank') {
                if ($('delivery-time-info')) {
                    $('delivery-time-info').remove();
                }

                var el = new Element('div', {
                    'id': 'delivery-time-info',
                    'html': '<em>Отправка осуществляеться после 100% оплаты</em>'
                });
                el.inject($('delivery-time').getParent('.check-form-i'));
            } else {
                $('delivery-time-info').remove();
            }
        });

        var load_payment_methods = function () {
            $('payment-methods').set('html', '');

            Object.each(payments.methods, function(method) {

                payment_data[method.id] = method;

                if ( delivery_method.payment_method_ids.indexOf(method.id) != -1 ) {
                    var el = new Element('li', {
                        'id': 'payment-method-' + method.name,
                        'class': 'methods-l-i',
                        'html': '<div class="method-wrap"><label><input class="method-radio" type="radio" value="' + method.id + '" name="payment_method_id"><div class="check"></div>' + method.title + '</label></div>'
                    });
                    el.inject($('payment-methods'));
                }

            });

            var selected_payment_method = null;
            if(payment_method) {
                if($('payment-method-' + payment_method.name) && !$('payment-method-' + payment_method.name).hasClass('hidden')) {
                    selected_payment_method = $('payment-method-' + payment_method.name).getElement('[name=payment_method_id]');
                }
            }

            if(!selected_payment_method) {
                selected_payment_method = $('payment-methods').getFirst('.methods-l-i:not(.hidden)').getElement('[name=payment_method_id]');
            }

            selected_payment_method.set('checked', true);
            payment_method_id = parseInt(selected_payment_method.value);
            payment_method = payment_data[payment_method_id];

            calculate(true, true);
        };

        var calculate = function(delivery_change, payment_change) {
            $$('.delivery-payment-tab .calculator .inner').processStart('<img src="{$settings.path.images}/ajax.gif" alt="AJAX process"/>');

            var delivery_tr = $('delivery-cost').getParent('tr');
            var payment_tr = $('payment-cost').getParent('tr');

            var pod = false;
            if(payment_method.name == 'cash') {
                pod = true;
            }

            new Request({
                url: '/cgi-bin/form.php',
                data: {
                    json: 1,
                    city_id: city_id,
                    record_id: record_id,
                    delivery_method: delivery_method.name,
                    pod: pod
                },
                headers: {
                    ajaxAction: '{$menu.my.href}cart/#calculateGoodDeliveryCostByMethod'
                },
                onSuccess: function (resp) {
                    var result = JSON.parse(resp);

                    $('delivery-cost').set('html', result.cost);
                    if(parseInt(city_id) == 895) {
                        delivery_tr.hide();
                    } else {
                        delivery_tr.show();
                    }

                    var commission;
                    if(payment_method.name == 'liqpay') {
                        commission = Math.ceil(goods_price * 0.01);
                        $('payment-cost').set('html', commission + ' грн');
                        payment_tr.show();
                    // } else if(payment_method.name == 'novapay') {
                        // commission = Math.ceil(goods_price * 0.01);
                        // $('payment-cost').set('html', commission + ' грн');
                        // payment_tr.show();
                    } else if(payment_method.name == 'privatbank') {
                        commission = Math.ceil(goods_price * 0.01);
                        $('payment-cost').set('html', commission + ' грн');
                        payment_tr.show();
                    } else {
                        $('payment-cost').set('html', '0 грн');
                        payment_tr.hide();
                    }

                    $$('.delivery-payment-tab .calculator .inner').processStop();

                }.bind(this)

            }).send();
        };

        var city = {Cities->getUserCityJSON};
        var cities = [];
        if (city.id > 0) {
            cities.push(city);
        }
        citySwitcher.init(new_user_locality, cities);
        if(city_id > 0) {
            citySwitcher.setValue(city_id);
        } else {
            $$('.delivery-payment-tab .calculator .inner').processStop();
        }
    });
</script>
*}