<section class="sort-box">

	<div class="sort-box-title info-title">
		{$field.title}
		{if !empty($field.description)}
			{include file="goods/catalog/filter/glossary.tpl"}
		{/if}

		<span class="sort-box-toggle"></span>
	</div>

	<ul class="sort-box-l toggle-box">

		{if empty($field.is_selected)}

			{if $field.count}

				<li class="sort-box-l-i">
					<label onclick="window.location='{$field.href}'" class="sort-box-l-i-content-wrap">
						<input class="sort-box-cb styled" type="checkbox">
						<span></span>
						<div class="sort-box-text-wrap">
							{if $field.status !== 'configurable'}
								<span class="sort-box-text-count">({$field.count})</span>
							{/if}
							<a href="{$field.href}" class="sort-box-link">Есть</a>
						</div>
					</label>
				</li>

				{else}

				<li class="sort-box-l-i empty">
					<label class="sort-box-l-i-content-wrap">
						<input class="sort-box-cb styled" type="checkbox" disabled>
						<span></span>
						<div class="sort-box-text-wrap">
							{if $field.status !== 'configurable'}
								<span class="sort-box-text-count">(0)</span>
							{/if}
							<label class="sort-box-text">Есть</label>
						</div>
					</label>
				</li>

			{/if}

		{else}

			<li class="sort-box-l-i">
				<label onclick="window.location='{$field.href}'" class="sort-box-l-i-content-wrap">
					<input class="sort-box-cb active styled" type="checkbox" checked>
					<span></span>
					<div class="sort-box-text-wrap">
						<span class="sort-box-link">
							<div class="sort-box-link-text">
								{if $field.status !== 'configurable'}
									<span class="sort-box-text-count">({$field.count})</span>
								{/if}
								<label class="sort-box-text">Есть</label>
							</div>
						</span>
					</div>
				</label>
			</li>

		{/if}

	</ul>

	{if !empty($field.value)}
		<input type="hidden" name="{$field.name}" value="{if !is_array($field.value)}{$field.value}{else}{","|implode:$field.value}{/if}" />
	{/if}

</section>
