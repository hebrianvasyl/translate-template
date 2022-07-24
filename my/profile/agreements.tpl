<style>
    .agreements-list {
        padding: 0 0 0 30px;
        margin: 0;
    }
    .agreements-list li {
        font-size: 15px;
        list-style: decimal;
        margin: 0 0 10px 0;
    }
    #agreement_btn {
        background: #e74b00;
        height: 50px;
        line-height: 50px;
        padding: 0 40px;
        font-weight: bold;
        font-size: 18px;
        text-align: center;
        border: 1px solid #d64600;
        color: #fff;
        text-shadow: none;
    }
    #agreement_btn:hover {
        text-decoration: underline;
    }
    #agreement_btn.disabled {
        border-color: #ccc;
        background: #ccc;
        text-decoration: none;
    }
</style>
{Users->getUser assign="user"}

<div class="cabinet clearfix">
    {include file="breadcrumbs.tpl" show_last_breadcrumb=1}

    {include file="profile/body-menu.tpl"}
    <section class="content-wrapper content-waitlist">
        <section>
            {if $agreement_record}
                <p><br></p>
                <p style="margin-bottom: 20px;"><a href="{$menu.my->profile->agreements.href}">{'Вернутся к списку'|translate}</a></p>
                <h3>{$agreement_record.title}</h3>

                <div>
                    {$agreement_record->parseTextAsTemplate() nofilter}
                </div>

                <div id="result" style="margin: 50px 0 0 0; font-size: 14px;">
                    {if isset($applied[$agreement_record.id])}
                    {$applied[$agreement_record.id]}
                    {else}
                    <button id="agreement_btn" type="button" data-id="{$agreement_record.id}">{'Я ознакомился'|translate}</button>
                    {/if}
                </div>
            {else}
            <p><br></p>
            {if $agreements}
            <h3>{'Список изменений на сайте в условиях сотрудничества'|translate}</h3>
            <ol class="agreements-list">
                {foreach $agreements as $agreement}
                <li>
                    <a href="{$menu.my->profile->agreements.href}?id={$agreement.id}">{$agreement.title}</a>
                    {if isset($applied[$agreement.id])}
                    &nbsp;&mdash;&nbsp;{$applied[$agreement.id]}
                    {/if}
                </li>
                {/foreach}
            </ol>
            {elseif $newbie}
            {$agreement_newbie nofilter}
            <div id="result" style="margin: 50px 0 0 0; font-size: 14px;">
                <button id="agreement_btn" type="button" data-id="0">{'Я ознакомился'|translate}</button>
            </div>
            {else}
{'Вы ознакомлены со всеми условиями сотрудничества.<br>
            Нововведений нет.'|translate}
            {/if}
            {/if}
        </section>
    </section>
</div>

<script>
    var button = $('agreement_btn');

    button.addEvent('click', function() {
        button.set('disabled', true);
        button.addClass('disabled');

        var id = button.get('data-id');

        new Request({
            url: '/cgi-bin/form.php',
            data: {
                json: 1,
                id: id
            },
            headers: {
                ajaxAction: '{$menu.www.href}users/#applyAgreements'
            },
            onSuccess: function (response) {
                var data = JSON.parse(response);

                button.set('disabled', false);
                button.removeClass('disabled');

                $('result').set('html', data.message.content.applied_date);
            }.bind(this),
            onFailure: function () {
                button.set('disabled', false);
                button.removeClass('disabled');

                alert('{'Ошибка на сервере'|translate}');
            }.bind(this)
        }).send();
    });
</script>