{if count($accessories)}
	<div class="tabs-content-wrap">
        {* <h2 class="detail-tab-i-title">Аксессуары к товару <span class="pp-characteristics-tab-product-name">{$record.title|@mnemonics_convert nofilter}</span></h2> *}

		{* Выводим меню категорий *}
        {*
        <ul class="accessories-m" name="accessories_menu">

			{foreach from=$accessories item="section"}
				{if $section@first}
					<li class="accessories-m-i">
						<a href="#" class="accessories-m-i-link" name="section_{$section@iteration}">
							Все
						</a>
					</li>
				{else}
					<li class="accessories-m-i">
						<a href="#" class="accessories-m-i-link" name="section_{$section@iteration}">
							{$section.0->parent.title}
						</a>
					</li>
				{/if}
			{/foreach}

		</ul>
        *}

		{* Выводим аксессуары *}
        <div class="goods g-tile g-tile-with-separate">

            {$main_record = $record}

            {foreach from=$accessories item="section"}

            {if $section@first}{continue}{/if}

            {$parents = $section.0->getParentsRecords()}

            <h2 class="detail-tab-i-title accessories-tab-i-title">
				{'Из раздела'|translate}
                {foreach from=$parents item=parent name=parents}
                <a href="{$parent.href}" target="_blank">{$parent.title}</a>
                {if !$smarty.foreach.parents.last}<small>/</small>{/if}
                {/foreach}
                {* {$section.0->parent.title|trim:'.'} для <span class="pp-characteristics-tab-product-name">{$main_record.title|@mnemonics_convert nofilter}</span> *}
            </h2>

            <ul class="goods-l goods-l-in-tabs clearfix g-l catalog-l" name="accessories_items">

                    {foreach from=$section item="record"}
                        {include file='goods/purchase_goods_id.tpl' scope=parent}

                        <li class="goods-l-i goods-l-i-in-tabs g-l-i g-l-i-list" id="goods{$purchase_goods_id}" name="accessories-item_{$section@iteration}">
                            {include file="goods/details/tabs/accessories-item-tile.tpl"}
                        </li>
                    {/foreach}

            </ul>

            {/foreach}

        </div>

        {*
		<script type="text/javascript">
			$$("[name=accessories_menu]").getElements("a").each(function(el){
				el.addEvent('click',function(e){
					if(e) e.stop();

					/* если вкладка неактивна */
					if(!this.getParent().hasClass('active')) {

						/* делаем активной */
						$$("[name=accessories_menu] a").getParent().removeClass('active');
						this.getParent().addClass('active');

						var items_container = $$("[name=accessories_items]");

						/* номер вкладки */
						var section = this.name.replace('section_','');

						/* скрываем все элементы */
						items_container.getElements("[name^=accessories-item]").each(function(el){
							el.addClass('hidden');
						});

						/* показываем нужные элементы */
						items_container.getElements("[name=accessories-item_"+section+"]").each(function(el){
							el.removeClass('hidden');
						});

					}
				});
			});
			/* выбираем первый пункт */
			$$("[name=accessories_menu]")[0].getElements("a")[0].fireEvent('click');
		</script>
        *}

	</div>
	<script>
		new GTMEvents([
				{ //добавление товара из аксессуаров
					selector: '[name=accessories_items] a[name=topurchases]',
					event: 'click',
					gtm_data: {
						event: "OWOX",
						eventCategory: 'Cart',
						eventAction: 'addFromAccessories'
					},
					depend_on_event: {
						object: GoodsCatalog,
						event: 'catalogUpdate'
					}
				}
			]);
	</script>

{/if}

{*{include file="details/similar-models.tpl"}*}
