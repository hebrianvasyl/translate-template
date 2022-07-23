	{*выводим только те фильтры, у которых есть что выбирать (различные min и max значения)*}
{if (isset($field.min) && isset($field.max) && $field.min != $field.max)}

	<section class="sort-box">
		<div class="sort-box-title info-title">
			{$field.title}
			{if !empty($field.description)}
				{include file="goods/catalog/filter/glossary.tpl"}
			{/if}
		</div>
		<div class="toddler">
			<div class="trackbarprice" id="trackbar{$field.name}"></div>
			<div class="toddler-i">
				<input class="input-field" type="text" id="{$field.name}[min]" name="{$field.name}[min]" value="{if $field.value}{$field.value[0]}{/if}" pattern="^\s*(\+|-)?\d*((\.|,)\d+)?\s*$">
				<span class="toddler-i-separator">-</span>
				<input class="input-field" type="text" id="{$field.name}[max]" name="{$field.name}[max]" value="{if $field.value}{$field.value[1]}{/if}" pattern="^\s*(\+|-)?\d*((\.|,)\d+)?\s*$">
				<span class="toddler-i-separator">&nbsp;&nbsp;</span>
				<button id="submit{$field.name}" type="submit">Ok</button>
			</div>
		</div>
	</section>

	<script type="text/javascript">
		var track_bar = new TrackBar_class({
			createHiddenInputs:0,
			isTableFormatTrackBar: 0,
			show_labels: 0,
			name:'{$field.name}',
			submit_button_id: 'submit{$field.name}',
			inputLeftName:"{$field.name}[min]",
			inputRightName:"{$field.name}[max]",
			sliderLeftSrc: "{$settings.path.images}/design/catalog/filter/trackbar-slider-left.png",
			sliderRightSrc: "{$settings.path.images}/design/catalog/filter/trackbar-slider-right.png"
		});

		var values_options = { };

		{if $field.type == 'Integer'}
			values_options.decimals = 0;
			values_options.step = 1;
		{else}
			values_options.decimals = 1;
			values_options.step = 0.1;
		{/if}

		{if !empty($field.min)}
			values_options.limitLeft = {$field.min};
		{/if}

		{if !empty($field.max)}
			values_options.limitRight = {$field.max};
		{/if}

		{if !empty($field.value[0])}
			values_options.valueLeft = {$field.value[0]};
		{/if}

		{if !empty($field.value[1])}
			values_options.valueRight = {$field.value[1]}
		{/if}

		track_bar.setOptions(values_options);

		new GTMEvents([
				{ //применение фильтра
					object: track_bar,
					event: 'applyValues',
					gtm_data: {
						event: "OWOX",
						eventCategory: 'Catalog',
						eventAction: 'filter',
						eventLabel: '{$menu.active.record['id']}'
					}
				}
			]);

			track_bar.init();
	</script>

{/if}
