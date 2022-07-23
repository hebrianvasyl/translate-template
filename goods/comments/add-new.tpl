{UsersSignUp->getNewUser assign="user"}
{$goods = $record->getGoods()}
<form method="post" class="f-new-comment{if !empty($comments)} hidden{/if}" id="new_comment">

	<div class="comments-tabs">
		<a href="#" name="review" class="active">Оставить отзыв</a>
		<a href="#" name="question">Задать вопрос</a>
	</div>

	<div class="close" {if empty($comments)}hidden{/if} id="close">
		<a href="#" title="Закрыть"></a>
	</div>

	<p class="field-for-review {if !empty($comments)} hidden{/if}" name="new_comment_title" style="font-size: 16px;">Ваша оценка этого товара</p>

	<div class="b-rating user-mark x-large field-for-review" id="rating" name="rating">
		<div name="points" class="rating clearfix">
			<div class="rating-i float-lt" name="1"></div>
			<div class="rating-i float-lt" name="2"></div>
			<div class="rating-i float-lt" name="3"></div>
			<div class="rating-i float-lt" name="4"></div>
			<div class="rating-i float-lt" name="5"></div>
		</div>
		<div class="rating-content" name="rating_value">Нажмите, чтобы оценить товар</div>
		<input type="hidden" name="goods_id" value="{$goods.id}">
		<input type="hidden" name="mark" value="">
	</div>

	<div class="f-step user-text field-for-review">
		<label class="f-label" for="dignity-field">Достоинства:</label>
		<textarea class="input-field" id="dignity-field" name="dignity" tabindex="3"></textarea>
	</div>

	<div class="f-step user-text field-for-review">
		<label class="f-label" for="shortcomings-field">Недостатки:</label>
		<textarea class="input-field" id="shortcomings-field" name="shortcomings" tabindex="4"></textarea>
	</div>

	<div class="f-step user-text">
		<label class="f-label" for="text-field">Комментарий:</label>
		<textarea class="input-field custom-field-error" id="text-field" name="text" _required="required"  tabindex="5"></textarea>
	</div>

	<div class="f-step user-data" id="user_name_block">
		<label class="f-label" for="name-field">Представьтесь, пожалуйста:</label>
		<input type="text" class="input-field custom-field-error" id="name-field" name="name"
			   pattern="{$user->first_name.pattern}" _required="required" tabindex="6">
	</div>

	<div class="f-step user-data hidden" id="user_mail_block">
		<label class="f-label" for="email-field">Электронная почта:</label>
		<input type="text" class="input-field custom-field-error" id="email-field"
			   name="email" pattern="{$user->email.pattern}" tabindex="7">
	</div>

	<div class="f-step f-last-step">
		<div id="user_subscribe_wrap">
			<input type="checkbox" class="subscribe-check" id="subscribe" name="subscribed_on_replies" tabindex="8">
			<label class="f-label" for="subscribe">уведомлять об ответах по электронной почте</label>
		</div>
		<div class="submit-btn-wrap">
			<span class="btn-link btn-link-blue">
				<button type="submit" class="btn-link-i" tabindex="9">Оставить отзыв</button>
			</span>
		</div>
	</div>

	<input type="hidden" name="goods_id" value="{$goods.id}">
</form>

<script>

	var main_form = $('new_comment'),
		user_mail_block = $('user_mail_block');

	var loadUserCredentials = function() {

		if ($defined(App.get('User').S.email) && App.get('User').S.email) {

			main_form.email.value = App.get('User').S.email;
		}

		if ($defined(App.get('User').S.title) && App.get('User').S.title) {

			main_form.name.value = App.get('User').S.title;
		}

		user_mail_block.addClass('hidden');

		$(main_form.subscribe).addEvent('change', function (e) {

			if (!e.target.checked) {

				user_mail_block.addClass('hidden');
				$(main_form.email).erase('_required');

			} else if (!(App.get('User').isAuth() && App.get('User').S.email)) {

				$(main_form.email).set('_required','required');
				user_mail_block.removeClass('hidden');

			}

		});

	};

	loadUserCredentials();

	App.get('User').addEvent('signIn', function() {

		loadUserCredentials();

	});

	App.get('User').addEvent('signOut', function() {

		/*main_form.email.value = '';*/
		main_form.name.value = '';
		$('user_name_block').removeClass('hidden');

	});

	var new_comment_btn = $('new_comment_btn');

	if (new_comment_btn) {

		new_comment_btn.addEvent('click', function(){
			loadUserCredentials();
		});

	}

	$$('.comments-tabs a').addEvent('click', function(event){
		var name = this.get('name');

		if(name == 'question') {
			$$('.field-for-review').hide();
        } else {
            $$('.field-for-review').show();
        }

        if(!this.hasClass('active')) {
            $$('.comments-tabs a').toggleClass('active');
        }

        return event.stop();
    });

	$('close').addEvent('click', function(event){
		$('new_comment').hide();
		$('add_new_comment_header').removeClass('hidden');
		return event.stop();
	});
</script>