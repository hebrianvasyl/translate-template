{if (isset($price_limits.min) && isset($price_limits.max))}
	<section class="sort-box">
		<div class="sort-box-title info-title">
			{$field.title}
			{if !empty($field.description)}
				{include file="goods/catalog/filter/glossary.tpl"}
			{/if}

			<span class="sort-box-toggle"></span>
		</div>
		<div class="toddler toggle-box">
			<div class="toddler-i">
				<div class="toddler-i-line">
					<span>От</span> <input class="input-field" type="text" id="{$field.name}[min]" name="{$field.name}[min]" value="{if $field.value}{$field.value[0]}{/if}" pattern="^\s*(\+|-)?\d*((\.|,)\d+)?\s*$">
					<span>до</span> <input class="input-field" type="text" id="{$field.name}[max]" name="{$field.name}[max]" value="{if $field.value}{$field.value[1]}{/if}" pattern="^\s*(\+|-)?\d*((\.|,)\d+)?\s*$">
					<button id="submit{$field.name}" type="submit">Ok</button>
				</div>
				<div class="trackbarprice" id="trackbar{$field.name}"></div>
			</div>
		</div>
	</section>

	<script type="text/javascript">
		var track_bar = new TrackBar_class({
			createHiddenInputs:0,
			isTableFormatTrackBar: 0,
			decimals: 0,
			show_labels: 0,
			name:'{$field.name}',
			submit_button_id: 'submit{$field.name}',
			inputLeftName:"{$field.name}[min]",
			inputRightName:"{$field.name}[max]",
			step:1,
			sliderLeftSrc: "{$settings.path.images}/design/catalog/filter/trackbar-slider-left.png",
			sliderRightSrc: "{$settings.path.images}/design/catalog/filter/trackbar-slider-right.png",
		});

		var values_options = { };

		{if !empty($price_limits.min)}
			values_options.limitLeft = {$price_limits.min};
		{/if}

		{if !empty($price_limits.max)}
			values_options.limitRight = {$price_limits.max};
		{/if}

		{if !empty($field.value[0])}
			values_options.valueLeft = {$field.value[0]};
		{/if}

		{if !empty($field.value[1])}
			values_options.valueRight = {$field.value[1]}
		{/if}

		values_options = Object.map(values_options, function (value) {
			return (new Currency_class(value)).get('numeric');
		});

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

		{if $price_limits.min == $price_limits.max}

			track_bar.setOptions(
				Object.map(
					{
						limitLeft: {$price_limits.min},
						limitRight: {$price_limits.min},
						valueLeft: {$price_limits.min},
						valueRight: {$price_limits.min}
					},
					function (value) {
						return (new Currency_class(value)).get('numeric');
					}
				)
			);

			track_bar.init();

			// Классы ползунков slider-left и slider-right определяются в TrackBar_class
			$$('#trackbar{$field.name} .slider-left').removeEvents();
			$$('#trackbar{$field.name} .slider-right').removeEvents();

			$("{$field.name}" + '[min]').disabled = 'disabled';
			$("{$field.name}" + '[max]').disabled = 'disabled';
			$('submit' + "{$field.name}").disabled = 'disabled';

		{else}

			track_bar.init();

		{/if}

	</script>

{/if}
