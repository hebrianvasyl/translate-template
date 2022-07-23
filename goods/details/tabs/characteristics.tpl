{*{Controller->getChildTabControllerByName name='accessories' assign='accessories_controller'}*}

{*{assign var="accessories" value=$accessories_controller->getAccessories(*}
	{*['name' => 'accessories','limit' => 7, 'onlyATP' => 1, 'order' => 'relations_order']*}
{*)}*}
<div class="clearfix">
	{*<aside class="sidebar float-rt">*}
		{*{include file="details/sidebar-accessories.tpl"}*}
	{*</aside>*}

	<div class="tabs-content-wrap {*{if count($accessories)}tabs-content-with-sidebar{/if}*}">

		{if count($characteristics)}

			{*<h2 class="tabs-content-title">Технические характеристики: {$record.title}</h2>*}
			<h2 class="detail-tab-i-title">Технические характеристики <span class="pp-characteristics-tab-product-name">{$record.title|@mnemonics_convert nofilter}</span></h2>


            {foreach from=$characteristics item="fieldset" name="sections"}
				<table class="characteristics-t">
					{if $fieldset.section !== NULL}
						<caption class="characteristics-t-title">{$fieldset.section.title}</caption>
					{elseif ($characteristics.0.section !== NULL)}
						<caption class="characteristics-t-title">Другие характеристики</caption>
					{/if}

					{foreach from=$fieldset.details item="detail"}
						<tr>
							<td class="characteristics-t-subtitle">
								<span class="characteristics-t-subtitle-text info-title"
									  gtm-data='{ "eventLabel":"characteristic"}'
								>
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
							<td class="characteristics-t-value">
                                {if $detail.type == 'Suggest' and !empty($detail.record_ref)}
                                <a href="{$detail->ref_record.external_href}" target="_blank">
                                    {$detail->ref_record.sub_title_big}
                                </a>
                                {else}
                                {$detail|replace:'/*br*/':'<br>'|escape:'quotes' nofilter}
                                {/if}
                            </td>
						</tr>
					{/foreach}
                    {if $fieldset.section.title == "Упаковка"}
                        {$weight = $record -> getDetail('Ves-upakovki')}
                        {if $weight['value'] > 0}
                        <tr>
                            <td class="characteristics-t-subtitle">
                                    <span class="characteristics-t-subtitle-text info-title"
                                            gtm-data='{ "eventLabel":"characteristic"}'
                                    >
                                        Вес упаковки:
                                    </span>
                            </td>
                            <td class="characteristics-t-value">
                                {$weight['value']} {$weight['unit']}
                            </td>
                        </tr>
                        {/if}
                        {$volume = $record -> getDetail('Objom-upakovki')}
                        {if $volume['value'] > 0}
                        <tr>
                            <td class="characteristics-t-subtitle">
                                    <span class="characteristics-t-subtitle-text info-title"
                                            gtm-data='{ "eventLabel":"characteristic"}'
                                    >
                                        Объем упаковки:
                                    </span>
                            </td>
                            <td class="characteristics-t-value">
                                {$volume['value']} {$volume['unit']}
                            </td>
                        </tr>
                        {/if}
                        {$height = $record -> getDetail('height')}
                        {$length = $record -> getDetail('length')}
                        {$width = $record -> getDetail('width')}
                        {if $height['value'] > 0 && $length['value'] > 0 && $width['value'] > 0}
                        <tr>
                            <td class="characteristics-t-subtitle">
                                    <span class="characteristics-t-subtitle-text info-title"
                                            gtm-data='{ "eventLabel":"characteristic"}'
                                    >
                                        Габариты упаковки:
                                    </span>
                            </td>
                            <td class="characteristics-t-value">
                                {$height['value']} x {$length['value']} x {$width['value']} см
                            </td>
                        </tr>
                        {/if}
                    {/if}
				</table>
        {if $fieldset.section.title == "Комплектация"}
        {foreach from=$fieldset.details item="detail"}
        {if $detail.type == 'Suggest' and !empty($detail.record_ref)}
        {$characteristicsShownInParent = $detail->ref_record->getCharacteristicsShownInParent()}
        {if count($characteristicsShownInParent)}
        <table class="characteristics-t">
        <caption class="characteristics-t-title">
            {if !empty($detail.filter_title)}
            {$detail.filter_title}
            {else}
            {$detail.title}
            {/if}
        </caption>
        {foreach from=$characteristicsShownInParent item="detail"}
        <tr>
            <td class="characteristics-t-subtitle">
            <span class="characteristics-t-subtitle-text info-title"
                    gtm-data='{ "eventLabel":"characteristic"}'
            >
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
            <td class="characteristics-t-value">
                {if $detail.type == 'Suggest' and !empty($detail.record_ref)}
                <a href="{$detail->ref_record.external_href}" target="_blank">
                    {$detail->ref_record.sub_title_big}
                </a>
                {else}
                {$detail|replace:'/*br*/':'<br>'|escape:'quotes' nofilter}
                {/if}
            </td>
        </tr>
        {/foreach}
        </table>
        {/if}
        {/if}
        {/foreach}
        {/if}
        </table>
			{/foreach}
			{*<a href="#" class="tabs-content-link dictionary before">Словарь технических терминов</a>*}

		{/if}

	</div>
</div>

{*{include file="details/similar-models.tpl"}*}