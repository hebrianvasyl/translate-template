<ul class="l-comment-reply">
	{foreach $replies as $reply}
		<li class="b-comment" {if $reply@iteration > 3} hidden{/if} name="reply">
			<div class="b-comment-info b-comment-header">
				<div class="b-comment-info-i comment-author">{if $reply.name}{$reply.name}{else}{'Анонимный пользователь'|translate}{/if}</div>
				<div class="b-comment-info-i">
                    {$reply->created.day|intval} {$reply->created.month_titles.title_nice}
                </div>
			</div>
			<div class="b-comment-content-i">{$reply.text}</div>
		</li>
	{/foreach}
</ul>
{if count($replies) > 3}
	<a href="#" class="all-replies-link xhr underline" name="show_all">{'Читать все ответы'|translate}</a>
{/if}
