<div class="body-layout">
	<div class="wrap">
		<section class="comparsion" role="main">

			{include file="breadcrumbs.tpl"}

			<header><h1>Сравниваем {$menu.active->parent.title}</h1></header>

			<div class="compare-box">

				<div name="fixed_block_parent">
					<div class="hide-thead-block" id="hide-thead-wrapper" name="fixed-thead">
						<table class="compare">
							{include file="goods/comparison/comparison-thead.tpl"}
						</table>
					</div>
				</div>

				<table class="compare compare-main" name="table-compare">

					{assign var="count_goods_records" value=count($goods_records)+1}

                    {if count($goods_records) >= 2}
					<tbody>

						<tr>
							<td colspan="{$count_goods_records}">
                                <aside id="compare_menu_id"></aside>
                                <script type="text/javascript">CompareMenu.init('compare_menu_id')</script>

                                <img src="{$settings.path.images}/design/_.gif" width="220" height="1" alt="_" />
							</td>
						</tr>

                        <tr id="compare_icons" class="compare-row pp-top-details">
                            <td>
                                <div style="display: block;width: 210px;">&nbsp;</div>
                            </td>
                            {foreach from=$goods_records item="record"}
                            <td class="compare-cell compare-cell-icons" name="compare-cell-goods{$record.id}">
                                {include file="goods-icons/details-icons.tpl" record_tmp=$record hide_docket=false}
                            </td>
                            {/foreach}
                        </tr>

						{foreach from=$details_list item="detail_item"}

							{if $detail_item.record.is_section}

								{*<tr class="equal row-separate">*}
									{*<div class="td_inner_bottom">*}
										{*<td class="compare-cell" colspan="{$count_goods_records}">&nbsp;</td>*}
									{*</div>*}
								{*</tr>*}

								<tr class="equal c-detail-title">
									<div class="td_inner_bottom">
										<td class="compare-cell" colspan="{$count_goods_records}">
                                            <b>
                                                {if $detail_item.record.filter_title}
                                                {$detail_item.record.filter_title}
                                                {else}
                                                {$detail_item.record.title}
                                                {/if}
                                            </b>
                                        </td>
									</div>
								</tr>

							{else}

								<tr class="compare-row {if $detail_item.is_different}different{else}equal{/if}">
									<td class="compare-cell">
										<div class="td_inner_bottom">
										<div class="c-title">

											<span>
                                                {if $detail_item.record.filter_title}
                                                {$detail_item.record.filter_title}:
                                                {else}
                                                {$detail_item.record.title}:
                                                {/if}
                                            </span>

											{*{if strval($detail_item.record.description)}*}
{**}
												{*<span class="info-title">*}
													{*{include file="goods/catalog/glossary/popup_info.tpl" field=$detail_item.record glossary_href="{$goods_records.0->parent->menu_node.external_base_href}glossary/"}*}
												{*</span>*}
{**}
											{*{/if}*}
										</div>
										</div>
									</td>

									{foreach from=$goods_records item="record"}
										<td class="compare-cell" name="compare-cell-goods{$record.id}">
											<div class="td_inner_bottom">
											{if isset($detail_item.parent) and strval($record->details[$detail_item.parent.name][$detail_item.record.name])}
                                                {$d = $record->details[$detail_item.parent.name]->{$detail_item.record.name}}
												{if $d.type == 'Suggest'}

                                                {/if}
                                                {$record->details[$detail_item.parent.name][$detail_item.record.name] nofilter}
											{elseif !isset($detail_item.parent) and strval($record->details[$detail_item.record.name])}
												{$record->details[$detail_item.record.name] nofilter}
											{else}
												&mdash;
											{/if}
											</div>
										</td>
									{/foreach}
								</tr>
							{/if}

						{/foreach}

					</tbody>
                    {/if}

				</table>
			</div>


			<div class="clear"></div>
		</section>
	</div>
</div>

<script>

new GTMEvents([
		{ //добавление товара из страницы сравнения
			selector: '[name=table-compare] a[name=topurchases]',
			event: 'click',
			gtm_data: {
				event: "OWOX",
				eventCategory: 'Cart',
				eventAction: 'addFromComparison',
				eventLabel: '{$menu.active -> parent['id']}'
			},
			depend_on_event: {
				object: GoodsCatalog,
				event: 'catalogUpdate'
			}
		}
	]);

var goods_count = {count($goods_records)};
var message_code = {$smarty.const.OWOX_MESSAGE_NOTIFY};

	$$('[name=delete-from-comparison]').addEvent('click', function (e) {
		e.stop();

		var goods_id = this.get('goods_id');

		if (goods_id) {

			Comparison.deleteGoods(goods_id);

			goods_count--;

			if (!goods_count) {
				window.history.back();
			}

			$$('[name=compare-cell-goods' + goods_id + ']').dispose();
		}
		var width = $$('.compare-main').getWidth();
		$$('.hide-thead-block').setStyle('width', width);

	});

	App.getSessionJSON(function () {
		var menu_bl;
		if (goods_count < 2) {

			if (menu_bl = $('compare_menu_id')) {
				menu_bl.set('html' ,'');
			}

			if (!goods_count) {
				$$('[name=table-compare] tbody').set('html' ,'');
			}

			if (goods_count) {
				App.showMessage(new Message_class({ content:'Недостаточно товаров для сравнения', code:message_code}));
			} else {
				$$('[name=table-compare]').dispose();
				App.showMessage(new Message_class({ content:'Не добавлено ни одного товара для сравнения', code:message_code}));
			}
		}
		var width = $$('.compare-main').getWidth();
		$$('.hide-thead-block').setStyle('width', width);

	});

var FixedBlock = new FixedBlock_class({
	fixed_block_name: 'fixed-thead',
	fixed_class_name: 'fixed',
	to_top_link_name: null
}).init();

</script>
