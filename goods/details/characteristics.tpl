

{if $main_details}
	<h2 class="tabs-content-title">Основные характеристики</h2>

	<table class="characteristics-t">
		{foreach from=$main_details item='detail'}
			<tr>
				<td class="characteristics-t-subtitle">
					<span class="characteristics-t-subtitle-text info-title">
						{if !empty($detail.filter_title)}
                        {$detail.filter_title}:
                        {else}
                        {$detail.title}:
                        {/if}
						{if !empty($detail.description)}
							{include file="goods/catalog/glossary/popup_info.tpl" field=$detail glossary_href="{$record->parent->menu_node.href}glossary/"}
						{/if}
					</span>
				</td>
				<td class="characteristics-t-value">{$detail|replace:'/*br*/':'<br>'|escape:'quotes' nofilter}</td>
			</tr>
		{/foreach}
	</table>
	<a href="#" class="tabs-content-link underline novisited" name="switch_to_characteristics">Все характеристики</a>
	<script>
		$$("a[name=switch_to_characteristics]").addEvent('click',function(e){
			var event = new DOMEvent(e);
			event.stop();
			goodTabs.switchTab( $$("li[name=characteristics]")[0] );
			new Fx.Scroll(window,{ duration:300 }).toElement($('details-tabs-menu'));
		});
	</script>
{/if}