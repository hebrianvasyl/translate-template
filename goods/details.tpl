{$details_counter = 0}
{if $record -> getGoods() -> parent}
{foreach $record -> getGoods() -> parent -> relations -> details as $detail}
	{$detail_record = $detail->to}

	{$detail_name = $detail_record.name}
	{if $detail_record and !empty($record.$detail_name)}
		<li class="g-info-l-i">
			<span class="g-info-l-i-prop">
                {if !empty($detail_record.filter_title)}
                {$detail_record.filter_title}:
                {else}
                {$detail_record.title}:
                {/if}
            </span> {strval($record -> $detail_name)|replace:'/*br*/':'<br>' nofilter}
		</li>
		{$details_counter = $details_counter + 1}
	{/if}
	{if $details_counter >= 6}
		{break}
	{/if}
{/foreach}
{/if}