<div class="cabinet wishlist clearfix">
    {include file="breadcrumbs.tpl" show_last_breadcrumb=1}

    {include file="profile/agreements_block.tpl"}

	{include file="profile/body-menu.tpl"}
	<section class="content-wrapper">
		<div name="app-message"></div>

		<div class="wishlist-header clearfix">
			<span class="btn-link btn-grey submit-btn add-more float-rt">
				<a class="btn-link-i before" href="#" onclick="return false" name="add_more_wishlists">Список желаний</a>
			</span>
		</div>

		<div class="wishlist-wrap" id="wishlists"></div>

		{$wishlists_data = []}
		{foreach $wishlists as $wishlist}
			{$wishlists_data[$wishlist['id']] = $wishlist -> getFields('json')}
		{/foreach}

		{*вывод нам не нужен*}
		{capture}
			{asort($wishlists_data)}
		{/capture}

		{*проверяем данные по спискам желаний в сессии на актуальность*}
		<script type="text/javascript">
			document.addEvent('loadS:once', function (session) {

				var wishlists_from_session = JSON.encode(session.wishlists),
					actual_wishlists = '{$wishlists_data|json_encode nofilter}';

				if (wishlists_from_session !== actual_wishlists) {
					S.load(true);
				}

			});

		</script>
	</section>
</div>