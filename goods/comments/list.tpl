{$goods = $record->getGoods()}
<div id="comments">
	{foreach $comments as $comment}

        {if $comment.emotion == 'negative'}
        <noindex>
        {/if}

            <div itemprop="review" itemscope itemtype="http://schema.org/Review" class="b-comment" name="{$comment.id}">
                <div class="b-comment-info b-comment-header">
                    <div class="b-comment-info-i comment-author" itemprop="author">{if $comment.name}{$comment.name}{else}{'
Анонимный пользователь'|translate}{/if}</div>

                    {if $comment.mark}
                        <div class="b-comment-info-i">
                            <div class="b-rating rating-results">
                                <div class="rating">
                                    <div itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating" class="rating-i" style="width:{$comment.mark*20}%">
                                        <meta itemprop="worstRating" content="1">
                                        <meta itemprop="ratingValue" content="{$comment.mark}">
                                        <meta itemprop="bestRating" content="5">
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/if}
                    <meta itemprop="name" content="{$comment.id}">
                    <div class="b-comment-info-i">
                        {$comment->created.day|intval} {$comment->created.month_titles.title_nice}
                        <meta itemprop="datePublished" content="{$comment->created->getTimestamp()|date_format:"%Y-%m-%d"}">
                    </div>
                </div>
                <div class="b-comment-content" itemprop="description">


                    <div class="b-comment-content-i" id="pp-comments_text_{$comment.id}">{$comment.text}</div>

                    {if $comment.dignity}
                        <div class="b-comment-content-i"><b>{'Достоинства'|translate}:</b> {$comment.dignity}</div>
                    {/if}

                    {if $comment.shortcomings}
                        <div class="b-comment-content-i"><b>{'Недостатки'|translate}:</b> {$comment.shortcomings}</div>
                    {/if}

                </div>
                <div name="reply_form">
                    <div class="b-comment-info">
                        <div class="b-comment-info-i">
                            <a href="#" class="xhr underline novisited" name="add"><i class="reply-icon"></i> {'Ответить'|translate}</a>
                        </div>
                        <div class="b-comment-info-i voting" name="voting">
                            <div name="msg"></div>
                            <span>{'Отзыв полезен'|translate}?</span>
                            <span class="yes" name="positive_block">
                                <a href="#" class="xhr underline" name="positive_vote" id="{$comment.id}">Да</a>
                                <span name="count">{$comment.positive_vote_count}</span>
                            </span>
                            <span>/</span>
                            <span class="no" name="negative_block">
                                <a href="#" class="xhr underline" name="negative_vote">Нет</a>
                                <span name="count">{$comment.negative_vote_count}</span>
                            </span>
                        </div>
                    </div>

                    <div name="replies_msg"></div>

                    <div name="form" class="hidden">
                        <form class="f-comment-reply">
                            {UsersSignUp->getNewUser assign="user"}
                            <div class="f-step user-text">
                                <textarea class="input-field" name="text" required autofocus></textarea>
                            </div>
                            <div class="f-step user-data">
                                <div class="b-username-wrap" name="user_name_block">
                                    <label class="f-label" for="user-name-field">{'Представьтесь, пожалуйста'|translate}:</label>
                                    <input type="text" class="input-field" id="user-name-field" name="name" required>
                                </div>
                                <span class="btn-link btn-link-blue">
                                    <button type="submit" class="btn-link-i">{'Ответить'|translate}</button>
                                </span>
                            </div>
                            <div name="reply-close" class="close">
                                Закрыть <a href="#" title="{'Закрыть'|translate}"></a>
                            </div>
                            <input type="hidden" name="goods_id" value="{$goods.id}">
                            <input type="hidden" name="parent_id" value="{$comment.id}">
                        </form>
                    </div>
                </div>

                <div class="pp-comments" name="replies">
                    {if !empty($replies[$comment.id])}
                        {include file="comments/replies.tpl" replies=$replies[$comment.id]}
                    {/if}
                </div>

            </div>

        {if $comment.emotion == 'negative'}
        </noindex>
        {/if}

	{/foreach}
</div>
<script>

	new Replies_class().run('{$menu.www->comments.href}');


	var comments_block = $('comments');

	var loadUserData = function() {

		if ($defined(App.get('User').S.title) && App.get('User').S.title) {

			comments_block.getElements("input[name=name]").each( function (element) {

				element.value = App.get('User').S.title;

			} );

			$$('[name=user_name_block]').addClass('hidden');

		}

	};

	loadUserData();

	App.get('User').addEvent('signIn', function() {

		loadUserData();

	});

	App.get('User').addEvent('signOut', function() {

		comments_block.getElements("input[name=name]").each( function (element) {

			element.value = '';

		} );
		$$('[name=user_name_block]').removeClass('hidden');

	});

	$$('[name="reply-close"]').addEvent('click', function(event) {
	    var parent = this.getParent('[name="form"]');
	    parent.hide();

        return event.stop();
    });

	{include file="comments/voting-script.tpl"}

</script>