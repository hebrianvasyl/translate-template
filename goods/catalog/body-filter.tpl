{if count($filter) and (count($catalog_records)>0 or $filter_reset)}

<form method="GET" id="filter-form" action="{$menu.active.base_href}getfilter/">

	{assign var=params_types_list value=','|explode:'Producers,ComboBox,CheckBoxGroup,RadioButtonGroup'}

	{foreach from=$filter item="field"}

		{if in_array($field.type, $params_types_list)}

			{include file="catalog/filter/ComboBox.tpl" field=$field}

		{elseif $field.type == 'Decimal' || $field.type == 'Integer'}

			{if $field.name == 'price'}
				{include file="catalog/filter/Price.tpl" field=$field}
			{else}
				{include file="catalog/filter/Decimal.tpl" field=$field}
			{/if}

		{elseif $field.type == 'CheckBox'}

			{include file="catalog/filter/CheckBox.tpl" field=$field}

		{elseif $field.type == 'Hidden'}

			{include file="catalog/filter/Hidden.tpl" field=$field}


		{/if}

	{/foreach}

</form>

	{if !empty($filter_reset)}

		<a href="{$filter_reset}" id="reset-silter" class="novisited">Сбросить фильтр</a>

	{/if}

{/if}

<script type="text/javascript">
	$$('.sort-box-toggle').addEvent('click', function() {
		var box = this.getParent('.sort-box');
		var ul = box.getChildren('.toggle-box');

		if(this.hasClass('close')) {
			this.removeClass('close');
			ul.removeClass('hidden');
		} else {
			this.addClass('close');
			ul.addClass('hidden');
		}
	});

	new GTMEvents([
			{ //применение фильтра
				selector: '#filter-form label.sort-box-l-i-content-wrap',
				event: 'click',
				gtm_data: {
					event: "OWOX",
					eventCategory: 'Catalog',
					eventAction: 'filter',
					eventLabel: '{$menu.active.record['id']}'
				}
			}
		]);

    window.addEvent('domready', function() {
        $('filter-form').getElements('input[type=checkbox]').addEvent('click', function(e) {
            $('filter-form').getElements('input').setProperty('disabled', 'disabled')
        });
    });
</script>

