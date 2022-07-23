{$pages_count = count($menu.active->pages)}
{$current_page = 1}
{if $pages_count > 1}

	{foreach $menu.active->pages as $page}
		{if $page->isSelected()}
			{$current_page = $page.title}
		{/if}
	{/foreach}

	<div class="more" name="comments_navigation">

		{if $current_page < $pages_count}
			<span class="more-link btn-link-blue" name="more_goods">
				<a href="#" class="btn-link-i">
					<i class="sprite"></i>
					Показать больше отзывов
				</a>
			</span>
		{/if}

		<div class="more-text">Страницы</div>

		<ul class="more-pages-l" name="paginator" id="paginator">
			{smart_page_navigation pages=$menu.active->pages midpoint=6 maxpoint=1 var="pages"}
			{foreach $pages as $page}
				{if $page->isSelected()}
					<li class="more-pages-l-i active"><span class="more-pages-l-i-link">{$page.title nofilter}</span></li>
				{else}
					<li class="more-pages-l-i" name="{$page.title}">
						<a class="more-pages-l-i-link novisited" name='page-link' href="{$page.href}">{$page.title nofilter}</a>
						<span class="more-pages-l-i-link hide" name='page-link-text'>{$page.title nofilter}</span>
					</li>
				{/if}
			{/foreach}
		</ul>

	</div>

	<script>

		var endlessScroll = new EndlessScroll_class('comments-parent', '{$menu.active.href}').setOptions({
			total_pages: {$pages_count},
			current_page: {$current_page},
			remove_links_if_active: 1,
			load_button_class:'active',
			content_selector: '[name=comments_list]',
			additional_params: {
				tab: 'comments'
			}
		}).run();

		$$('[name=paginator]')[0].getElements('a').each(function (element) {

			element.addEvent('click', function (event) {

				event.stop();

				var container = $('comments-parent');

				container.processStart('{template_js_fetch file="_jst/process.jst"}');

				new Request.HTML({
					url: event.target.getProperty('href'),
					update: container ,
					onSuccess: function () {

						container.processStop();

                        new Fx.Scroll(window,{ duration:300 }).toElement(container);

					}
				}).get();

			});

		});

	</script>

{/if}