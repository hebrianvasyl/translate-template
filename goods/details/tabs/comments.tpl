<div class="tabs-content-wrap">
{if !isset($single_comment)}
	<div id="comments-parent">
		<div class="b-comments b-comments-container">
			<div name="comments_msg"></div>
			<div name="comments_container">

				{* include file="comments/sort.tpl" *}

				<div class="{if empty($comments)}hidden{/if}">
					<ul class="add-new-comment-l" name="add_new_mark_small" id="add_new_comment_header">
						<li class="add-new-comment-l-i"><h2 class="tabs-content-title">Вопросы и отзывы покупателей <span class="pp-characteristics-tab-product-name">({$total_comments})</span></h2></li>
						<li class="add-new-comment-l-i">
							<span>
								<button class="btn-link-i" name="show_add_new_comment" id="new_comment_btn">Напишите свой отзыв</button>
							</span>
						</li>
						<li class="add-new-comment-l-i">или оцените товар</li>
						<li class="add-new-comment-l-i">
							<div class="b-rating user-mark large" id="rating_small" name="rating_small">
								<div class="rating-content" name="rating_value"></div>
								<div class="rating clearfix" name="points">
									<div class="rating-i float-lt" name="1"></div>
									<div class="rating-i float-lt" name="2"></div>
									<div class="rating-i float-lt" name="3"></div>
									<div class="rating-i float-lt" name="4"></div>
									<div class="rating-i float-lt" name="5"></div>
								</div>
								<input type="hidden" name="goods_id" value="{$record.id}">
							</div>
						</li>
					</ul>
				</div>

				{include file="comments/add-new.tpl"}

				<script>
					var goodsComments = new Comments_class();

					goodsComments.setOptions({
						insert_new_comment: false,
						has_new_mark_small: true,
						use_external_mark_class: true,
						selectors: {
							new_comment_msg: 'div[name=comments_msg]'
						}
					}).init('{$menu.www->comments.href}');

					var rating_small = new Mark_class().setOptions({
						container: 'rating_small'
					}).init();
					var rating = new Mark_class().setOptions({
						selectors: {
							add_mark_msg_name: 'div[name=comments_msg]'
						}
					}).init();

					//
					new GTMEvents([
							{ //отправка комментария
								selector: '#new_comment',
								event: 'submit',
								gtm_data: {
									event: "OWOX",
									eventCategory: 'Product',
									eventAction: 'submitComment',
									eventLabel: '{$record['id']}'
								}
							}
						]);

				</script>
			</div>

			{* для уцененных товаров скрываем возможность оставить отзыв*}
			<script type="text/javascript">
				if (IsMarkDown) {
					$$("[name=comments_container]").addClass('hidden');
				}
			</script>

			{if count($comments)}

				<div name="comments_list">
					{include file="comments/list.tpl"}

				</div>

				{include file="goods/comments/paginator.tpl"}

			{/if}

		</div>
	</div>
{elseif !empty($single_comment)}
	<div class="to-left light-gray more-news all-review l-gray-ie-right">
		<div class="to-right l-gray-ie-left-white">
			<span class="text-b-i-c">
				<a href="#" name="switch_to_comments" class="to-top novisited">Смотреть Все отзывы</a>
			</span>
		</div>
	</div>

	<script type="text/javascript">

		$$("a[name=switch_to_comments]").addEvent('click', function (e) {

			var event = new DOMEvent(e);

			event.stop();

			var hash = location.href.toURI().getData(null, 'fragment');

			delete hash.id;

			var location_href = location.href.toURI().setData(hash, false, 'fragment');

			location.hash = location_href.get('fragment');

			/*hacked! второй параметр нужен исключительно для подгрузки той же вкладки, но с дргуими параметрами*/
			goodTabs.switchTab($$("li[name=comments]")[0], 'force');

			new Fx.Scroll(window,{ duration:300 }).toElement($('details-tabs-menu'));

		});

	</script>

	{$comments = array($single_comment)}
	{include file="comments/list.tpl"}

{else}
	Указанного комментария не существует
{/if}
</div>