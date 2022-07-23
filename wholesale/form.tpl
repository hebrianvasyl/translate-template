{Users->getUser assign="user"}

{if $user.user_type != 'dealer'}
<form action="{$menu.www.href}users/#dropshippingRequest" id="dropshipping-form">
    <div class="content">
        <div class="inner">
            {if $user}
            <p>Ваши данные:</p>
            <input type="text" name="title" value="{$user.title}" disabled>
            <input type="text" name="login" value="{$user.login}" disabled>
            <input type="text" name="email" value="{$user.email}" disabled>
            <p>
                <small>Вы можете изменить их<br>в <a href="{$menu.my.href}">личном кабинете</a></small>
            </p>
            {else}
            <input type="text" name="title" placeholder="ФИО">
            <input type="text" name="login" placeholder="Телефон">
            <input type="text" name="email" placeholder="E-mail">
            {/if}
            <button type="submit">Зарегистрироваться</button>
        </div>

        <div class="result hidden" name="message"></div>
    </div>
</form>

{literal}
<script>
    $('dropshipping-form').addEvent('submit', function (event) {
        event.preventDefault();

        var form = event.target;

        var resultBlock = form.getElement('[name=message]');

        var button = form.getElement('button');
        button.set('disabled', true);
        button.addClass('disabled');

        var ajaxAction = form.get('action');

        var title = form.getElement('[name=title]').value;
        var login = form.getElement('[name=login]').value;
        var email = form.getElement('[name=email]').value;

        new Request({
            url: '/cgi-bin/form.php',
            data: {
                json: 1,
                title: title,
                login: login,
                email: email
            },
            headers: {
                ajaxAction: ajaxAction
            },
            onSuccess: function (response) {
                button.set('disabled', false);
                button.removeClass('disabled');

                var data = JSON.parse(response);

                if(data.code == 0) {
                    resultBlock.addClass('success');

                    form.getElement('.inner').hide();
                } else {
                    resultBlock.addClass('exception');
                }

                if (data.message) {
                    resultBlock.set('html', data.message.content);
                    resultBlock.show();
                }
            }.bind(this),
            onFailure: function () {
                button.set('disabled', false);
                button.removeClass('disabled');

                resultBlock.addClass('exception');

                resultBlock.set('html', 'Ошибка на сервере');
                resultBlock.show();
            }.bind(this)
        }).send();
    });
</script>
{/literal}
{/if}