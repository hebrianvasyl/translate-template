{* В наличии *}
{if $record.sell_status=="available"}
	<div class="g-l-i-content-i-wrap available">
		{*<div class="g-l-i-status">{$record->sell_status->value.title}</div>*}
		{if !empty($record.price)}
			<div class="g-l-i-price btn-grey" name="buy_catalog"></div>
			<div class="hidden" name="price">
				{$record->price nofilter}
			</div>
		{/if}
	</div>
{/if}

{* Нет в наличии *}
{if $record.sell_status=="unavailable"}
	<div class="g-l-i-content-i-wrap unavailable">
		<div class="g-l-i-status">{$record->sell_status->value.title}</div>
		<div class="waitlist-btn-wrap small" name="waitlist_catalog"></div>
	</div>
{/if}

{* Заканчивается *}
{if $record.sell_status=="limited"}
	<div class="g-l-i-content-i-wrap limited">
		<div class="g-l-i-status">{$record->sell_status->value.title}</div>
		{if !empty($record.price)}
			{*{if !empty($record.old_price) && ($record.old_price > $record.price)}*}
				{*<div class="old-price-b"><span class="g-l-i-price old-price">{$record->old_price nofilter}</span></div>*}
			{*{/if}*}

			<div class="g-l-i-price btn-grey" name="buy_catalog"></div>
			<div class="hidden" name="price">{$record->price nofilter}</div>

		{/if}
	</div>
{/if}

{* Ожидается поставка *}
{if $record.sell_status=="waiting_for_supply"}
	<div class="g-l-i-content-i-wrap for-supply">
		<div class="g-l-i-status">{$record->sell_status->value.title}</div>
		<div class="waitlist-btn-wrap small" name="waitlist_catalog"></div>
	</div>
{/if}

{* Под заказ *}
{if $record.sell_status=="customized"}
	<div class="g-l-i-content-i-wrap customized">
		<div class="g-l-i-status">{$record->sell_status->value.title} <span class="g-l-i-status-info">(от 5 дней)</span></div>
		{if !empty($record.price)}
			{*{if !empty($record.old_price) && ($record.old_price > $record.price)}*}
				{*<div class="old-price-b"><span class="g-l-i-price old-price">{$record->old_price nofilter}</span></div>*}
			{*{/if}*}

			<div class="g-l-i-price btn-grey" name="buy_catalog"></div>
			<div class="hidden" name="price">{$record->price nofilter}</div>

		{/if}
	</div>
{/if}

{*Звоните*}
{*{if $record.sell_status=="call"}*}
	{*<div class="g-l-i-content-i-wrap call">*}
		{*<div class="g-l-i-status status-{$record.sell_status} {if $record.sell_status == call}before{/if}">*}
			{*{$record->sell_status->value.title}*}
			{*<span class="g-l-i-status-info"></span>*}
		{*</div>*}
		{*{if !empty($record.price)}*}
			{*<div class="g-i-price-{$record.sell_status}">*}
				{*{if !empty($record.old_price) && ($record.old_price > $record.price)}*}
					{*<div class="old-price-b">*}
						{*<span class="g-l-i-price old-price">{$record->old_price nofilter}</span>*}
					{*</div>*}
				{*{/if}*}

				{*<div class="g-l-i-price">{$record->price nofilter}</div>*}
				{*<div class="hidden" name="price">{$record->price nofilter}</div>*}

			{*</div>*}
		{*{/if}*}
	{*</div>*}
{*{/if}*}
