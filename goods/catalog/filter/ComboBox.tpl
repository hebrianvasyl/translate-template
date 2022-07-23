{if count($field.values)}

    {$values_count = 0}

	{capture name="values"}
		{foreach from=$field.values item="value"}

			{if empty($value.is_selected)}

				{if $value.count}
                    {$values_count = $values_count + $value.count}

					<li class="sort-box-l-i">
						<label id="sort-box-l-i-{$field.id}-{$value.id}" onclick="window.location='{$value.href}'" class="sort-box-l-i-content-wrap">
							<input class="sort-box-cb styled" type="checkbox">
							<span></span>
							<div class="sort-box-text-wrap">
								<a href="{$value.href}" class="sort-box-link novisited">
									<div class="sort-box-link-text">
										{if $field.status !== 'configurable'}
											<span class="sort-box-text-count">({$value.count})</span>
										{/if}
										<label class="sort-box-text">
                                            {if !empty($value.filter_title)}
                                                {$value.filter_title}
                                            {else}
                                                {$value.title}
                                            {/if}
                                            {$field.unit}
                                        </label>
									</div>
								</a>
							</div>
						</label>
					</li>
				{else}

					<li class="sort-box-l-i empty">
						<label id="sort-box-l-i-{$field.id}-{$value.id}" class="sort-box-l-i-content-wrap">
							<input class="sort-box-cb styled" type="checkbox" disabled>
							<span></span>
							<div class="sort-box-text-wrap">
								{if $field.status !== 'configurable'}
									<span class="sort-box-text-count">(0)</span>
								{/if}
								<label class="sort-box-text">
                                    {if !empty($value.filter_title)}
                                        {$value.filter_title}
                                    {else}
                                        {$value.title}
                                    {/if}
                                </label>
							</div>
						</label>
					</li>

				{/if}

			{else}

				<li class="sort-box-l-i">
					<label id="sort-box-l-i-{$field.id}-{$value.id}" onclick="window.location='{$value.href}'" class="sort-box-l-i-content-wrap">
						<input class="sort-box-cb active styled" type="checkbox" checked>
						<span></span>
						<div class="sort-box-text-wrap">
							<span class="sort-box-link">
								<div class="sort-box-link-text">
									{if $field.status !== 'configurable'}
										<span class="sort-box-text-count">({$value.count})</span>
									{/if}
									<label class="sort-box-text">
                                        {if !empty($value.filter_title)}
                                            {$value.filter_title}
                                        {else}
                                            {$value.title}
                                        {/if}
                                    </label>
								</div>
							</span>

						</div>
					</label>
				</li>

			{/if}

		{/foreach}
	{/capture}

	{if trim($smarty.capture.values) and ($values_count > 0 or $field.value !== NULL)}
		<section class="sort-box">

			<div class="sort-box-title info-title">
				{if $field.filter_title}
					{$field.filter_title}
				{else}
					{$field.title}
				{/if}
				{if !empty($field.description)}
					{include file="goods/catalog/filter/glossary.tpl"}
				{/if}

				<span class="sort-box-toggle{if $field.filter_closed == 1} close{/if}"></span>
			</div>

			{if !empty($field.value)}
				<input type="hidden" name="{$field.name}" value="{if !is_array($field.value)}{$field.value}{else}{","|implode:$field.value}{/if}" />
			{/if}

			<ul class="sort-box-l toggle-box{if $field.filter_closed == 1} hidden{/if}" id="sort_{$field.name}">
				{$smarty.capture.values nofilter}
			</ul>

		</section>
	{/if}

{/if}