{literal}<script>var goods_in_catalog = {};</script>{/literal}

<div class="cabinet clearfix">
    {include file="breadcrumbs.tpl" show_last_breadcrumb=1}

    {include file="profile/agreements_block.tpl"}

	{include file="profile/body-menu.tpl"}
	<section class="content-wrapper content-waitlist">
		<div name="app-message"></div>

		{if empty($waitlist)}
			<div class="user-message in-page before code6">
				<div class="user-message-content">{'Заявок в листе ожидания нет'|translate}</div>
			</div>
		{else}
        <div class="site-content catalog stock-catalog">
            <div id="goods-parent">
                <div class="goods g-tile g-tile-with-separate" name="goods-waitlist">

                    <div class="g-l catalog-l">

                        {foreach from=$waitlist item="record"}

                            {$content_record = $record->getGoods()}

                            <div class="goods-tile-waitlist">
                                <a href="#" class="delete" id="{$record.id}" alt="x"></a>

                                {include file="goods/catalog/goods-tile.tpl" record=$content_record}
                            </div>

                            <script type="text/javascript">
                                goods_in_catalog[{$record.id}] = GoodsCatalog.addEntity('Goods', { 'goods_id': {$record.id}, 'price': {$record.price} })
                            </script>
                        {/foreach}

                    </div>
                </div>
            </div>
        </div>
		<script>
			new GTMEvents([
					{ //добавление товара из похожих
						selector: '[name=goods-waitlist] a[name=topurchases]',
						event: 'click',
						gtm_data: {
							event: "OWOX",
							eventCategory: 'Cart',
							eventAction: 'addFromWaitlist'
						},
						depend_on_event: {
							object: GoodsCatalog,
							event: 'catalogUpdate'
						}
					}
				]);
		</script>
		{/if}
	</section>
</div>

{literal}
	<script type="text/javascript">

		$$('.delete[id]').addEvent('click', function (e) {
			var goodToDelete = goods_in_catalog[this.id];

			e.stop();

			Waitlist.deleteGoods(this.id);

			if (goodToDelete) {
				// Вызов эквивалентен goodToDelete.delete(), зашифрован из-за того, что
				// IE8 ругается на явный вызов метода, совпадающего с зарезервированным словом
				goodToDelete['delete'].call(goodToDelete);
			}
		});
	</script>

{/literal}