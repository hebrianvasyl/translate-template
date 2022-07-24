<script>
	var page_type = null;
</script>

{if !empty($pos) and $pos == 'news'}
	<div class="more">
		{if count($menu.active->pages) > 1}
			{smart_page_navigation pages=$menu.active->pages midpoint=6 maxpoint=1 var='pages'}
			{assign var="current_page" value="1"}

			{foreach from=$pages item=page}
				{if $page->isSelected()}
					{assign var="current_page" value=$page.title}
				{/if}
			{/foreach}

		{if $current_page < count($menu.active->pages)}
			<span class="more-link btn-link-blue" name="more_news">
				<a href="#" class="btn-link-i"><i class="sprite"></i>{'Показать больше новостей'|translate}</a>
			</span>
		{/if}
			<div class="more-text">{'Страницы'|translate}</div>

			<ul class="more-pages-l clearfix" name="paginator">
				{foreach from=$pages item=page}
					{if $page->isSelected()}
						<li class="more-pages-l-i float-lt active"><span class="more-pages-l-i-link">{$page.title}</span></li>
						{assign var="current_page" value=$page.title}
					{else}
						<li class="more-pages-l-i float-lt" name="{if $menu.active.name == 'search' and intval($page.title)}{$page.title-1}{else}{$page.title}{/if}">
							<a class="more-pages-l-i-link novisited" name='page-link' href="{$page.href}">{$page.title}</a>
							<span class="more-pages-l-i-link hide" name='page-link-text'>{$page.title}</span>
						</li>
					{/if}
				{/foreach}
			</ul>

			<script type="text/javascript">
				var endlessScroll = new EndlessScroll_class("news-parent", '{$menu.active.href}');
				endlessScroll.setOptions({
					total_pages: {$menu.active->pages|count},
					current_page: {$current_page},
					load_button_class:'active',
					remove_links_if_active: 1,
					more_button_selector: '[name=more_news]',
					content_selector: '[name=news_list]'
				}).run();
				var page_type = "";
			</script>
		{/if}
	</div>
{elseif !empty($pos) and $pos == 'articles'}
	<div class="more">
		{if count($menu.active->pages) > 1}
			{smart_page_navigation pages=$menu.active->pages midpoint=6 maxpoint=1 var='pages'}
			{assign var="current_page" value="1"}

			{foreach from=$pages item=page}
				{if $page->isSelected()}
					{assign var="current_page" value=$page.title}
				{/if}
			{/foreach}

		{if $current_page < count($menu.active->pages)}
			<span class="more-link btn-link-blue" name="more_articles">
				<a href="#" class="btn-link-i"><i class="sprite"></i>{'Показать больше статей'|translate}</a>
			</span>
		{/if}
			<div class="more-text">{'Страницы'|translate}</div>

			<ul class="more-pages-l clearfix" name="paginator">
				{foreach from=$pages item=page}
					{if $page->isSelected()}
						<li class="more-pages-l-i float-lt active"><span class="more-pages-l-i-link">{$page.title}</span></li>
						{assign var="current_page" value=$page.title}
					{else}
						<li class="more-pages-l-i float-lt" name="{if $menu.active.name == 'search' and intval($page.title)}{$page.title-1}{else}{$page.title}{/if}">
							<a class="more-pages-l-i-link novisited" name='page-link' href="{$page.href}">{$page.title nofilter}</a>
							<span class="more-pages-l-i-link hide" name='page-link-text'>{$page.title}</span>
						</li>
					{/if}
				{/foreach}
			</ul>

			<script type="text/javascript">
				var endlessScroll = new EndlessScroll_class("articles-parent", '{$menu.active.href}');
				endlessScroll.setOptions({
					total_pages: {$menu.active->pages|count},
					current_page: {$current_page},
					load_button_class:'active',
					remove_links_if_active: 1,
					more_button_selector: '[name=more_articles]',
					content_selector: '[name=articles_list]'
				}).run();
			</script>
		{/if}
	</div>
{elseif !empty($pos) and $pos == 'catalog'}
<div class="more">
	{if count($menu.active->pages) > 1 and !($menu.active->pages->all and $menu.active->pages->all->isSelected())}
		{smart_page_navigation pages=$menu.active->pages midpoint=6 maxpoint=1 var='pages'}
		{assign var="current_page" value="1"}

		{foreach from=$pages item=page}
			{if $page->isSelected()}
				{assign var="current_page" value=$page.title}
			{/if}
		{/foreach}

	{if $current_page < count($menu.active->pages)}
		<span class="more-link btn-link-blue" name="more_goods">
			<a href="#" class="btn-link-i"><i class="sprite"></i>{'Показать больше товаров'|translate}</a>
		</span>
	{/if}
		<ul class="more-pages-l clearfix" name="paginator">
			{foreach from=$pages item=page}
				{if $page->isSelected()}
					<li class="more-pages-l-i active"><span class="more-pages-l-i-link">{$page.title}</span></li>
					{assign var="current_page" value=$page.title}
				{else}
					<li class="more-pages-l-i" name="{if $menu.active.name == 'search' and intval($page.title)}{$page.title-1}{else}{$page.title}{/if}">
						<a class="more-pages-l-i-link novisited" name='page-link' href="{$page.href}">{$page.title nofilter}</a>
						<span class="more-pages-l-i-link hide" name='page-link-text'>{$page.title}</span>
					</li>
				{/if}
			{/foreach}
		</ul>

		<script type="text/javascript">
			var endlessScroll = new EndlessScroll_class("goods-parent", '{$filter_href}');
			endlessScroll.setOptions({
				total_pages: {$menu.active->pages|count},
				current_page: {$current_page},
				load_button_class:'active',
				remove_links_if_active: 1
			}).run();

			page_type = "Catalog";

		</script>
	{/if}
</div>
{elseif !empty($pos) and $pos == 'search'}

<div class="more">
	{if count($menu.active->pages) > 1 and !($menu.active->pages->all and $menu.active->pages->all->isSelected())}

		{smart_page_navigation pages=$menu.active->pages midpoint=6 maxpoint=1 var='pages'}

		{assign var="current_page" value="1"}

		{foreach from=$pages item=page}
			{if $page->isSelected()}
				{assign var="current_page" value=$page.title}
			{/if}
		{/foreach}

		{if $current_page < count($menu.active->pages)}
			<span class="more-link btn-link-blue" name="more_goods">
				<a href="#" class="btn-link-i"><i class="sprite"></i>{'Показать больше товаров'|translate}</a>
			</span>
		{/if}
		<div class="more-text">{'Страницы'|translate}</div>

		<ul class="more-pages-l clearfix" name="paginator">
			{foreach from=$pages item=page}
				{if $page->isSelected()}
					<li class="more-pages-l-i float-lt active"><span class="more-pages-l-i-link">{$page.title}</span></li>
					{assign var="current_page" value=$page.title}
				{else}
					<li class="more-pages-l-i float-lt" name="{$page.title-1}">
						<a class="more-pages-l-i-link novisited" name='page-link' href="{$page.href}">{$page.title nofilter}</a>
						<span class="more-pages-l-i-link hide" name='page-link-text'>{$page.title}</span>
					</li>
				{/if}
			{/foreach}
		</ul>

		<script type="text/javascript">
			var endlessScroll = new EndlessScroll_class("goods-parent", '{$menu.active.href}');
			endlessScroll.setOptions({
				//Нужно вычесть 1 от общего кол-ва страниц, т.к. Search_SphinxController
				//строит страницы начиная с 0-й, а EndlessScroll_class сравнивает номер текущей (который на 1 меньше)
				// с общим кол-вом, таким образом определяя есть ли еще страницы для отображения.
				total_pages: {$menu.active->pages|count} - 1,
				current_page: {$current_page-1},
				load_button_class:'active',
				page_param_name: 'p',
				remove_links_if_active: 1,
				additional_params: { text: '{$searchResults.text}' }
			}).run();

			page_type = "Search Results";

		</script>
	{/if}
</div>

{elseif !empty($pos) and $pos == 'videocontent'}
<div class="more">
	{if count($menu.active->pages) > 1}
		{smart_page_navigation pages=$menu.active->pages midpoint=6 maxpoint=1 var='pages'}
		{assign var="current_page" value="1"}

		{foreach from=$pages item=page}
			{if $page->isSelected()}
				{assign var="current_page" value=$page.title}
			{/if}
		{/foreach}

		<div class="more-text">{'Страницы'|translate}</div>

		<ul class="more-pages-l clearfix" name="paginator">
			{foreach from=$pages item=page}
				{if $page->isSelected()}
					<li class="more-pages-l-i float-lt active"><span class="more-pages-l-i-link">{$page.title}</span></li>
					{assign var="current_page" value=$page.title}
				{else}
					<li class="more-pages-l-i float-lt" name="{if $menu.active.name == 'search' and intval($page.title)}{$page.title-1}{else}{$page.title}{/if}">
						<a class="more-pages-l-i-link novisited" name='page-link' href="{$page.href}">{$page.title nofilter}</a>
						<span class="more-pages-l-i-link hide" name='page-link-text'>{$page.title}</span>
					</li>
				{/if}
			{/foreach}
		</ul>

		<script type="text/javascript">
			var endlessScroll = new EndlessScroll_class("articles-parent", '{$menu.active.href}');
			endlessScroll.setOptions({
				total_pages: {$menu.active->pages|count},
				current_page: {$current_page},
				load_button_class:'active',
				remove_links_if_active: 1,
				more_button_selector: '[name=more_articles]',
				content_selector: '[name=articles_list]'
			}).run();
		</script>
	{/if}
</div>
{/if}


<script>

	if (page_type !== null) {

		var gtm_object = { //переход на карточку товара для товаров подгруженых динамически
			selector: '[name=goods-link]',
			event: 'click',
			gtm_data: {
				event: 'EnhancedOWOX',
				eventAction: 'productClick',
				ecommerce: {
					handler: function (event) {

						var result = {
									'click': {
										'actionField': { 'list': page_type},
										'products': []
									}
								},
						//нужно найти родительский элемент с goods-data-gtm, и пользовать его
								elem_with_data = event.target.getParent('[goods-data-gtm]'),
								data;

						if (elem_with_data) {

							data = JSON.parse(elem_with_data.get('goods-data-gtm'));
							result.click.products.push({
								name: data.name,
								id: data.id,
								price: data.price,
								brand: data.brand,
								category: data.category
							});
						}

						return result.click.products.length ? result : false;

					}
				}
			}
		};

		if (this['endlessScroll'] !== undefined) {

			gtm_object['depend_on_event'] =
			{
				object: endlessScroll,
				event: 'updateContent'
			}

			//Добавляем к блокам товаров атрибут gtm_completed, дабы их сразу отсеять
			$$('[name=more_parent]').each(function (elem) {
				elem.set('gtm_more_send',"1");
			});

			/*{*  Enhanced события  *}*/
			new GTMEvents([

				gtm_object,

				{ //Событие динамической подгрузки товаров
					object: endlessScroll,
					event: 'updateContent',
					gtm_data: {
						event: 'EcommerceOWOX',
						eventCategory: page_type,
						eventAction: 'moreProducts',
						ecommerce: {
							handler: function (content) {
								var result = {
									'currencyCode': '{App::getStoresFacade()->getCurrenciesStorage()->getPrimaryCurrency()->getCurrency()->getName()}',
									impressions: []
								};
								//Выбираем из контента блоки без атрибута gtm_more_send,
								//это будут товары которые подтянулись динамически, в атрибуте goods-data ищем то что нам нужно
								content.getElements('div:not([gtm_more_send])[goods-data-gtm]').each(function (element, key) {

									// разбираем goods-data-gtm,
									data = JSON.parse(element.get('goods-data-gtm'));
									result.impressions.push({
										name: data.name,
										id: data.id,
										price: data.price,
										brand: data.brand,
										category: data.category,
										list: 'Search Result',
										position: key + 1
									});

									//помечаем элемент как обработанный, чтобы не слать о нем данные в gtm повторно
									element.set('gtm_more_send',"1");
								});

								return result.impressions.length ? result : false;
							}
						}
					}
				}
			]).setOptions({ 'gtm_attribute_name': 'enhanced-gtm-data'});

			// генерируем руками, чтобы подписаться на события статических элементов
			endlessScroll.fireEvent('updateContent', [endlessScroll.content]);

		} else {

			new GTMEvents([gtm_object]);

		}

	}

</script>