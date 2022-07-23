{if empty($delimiter)}
	{$delimiter = ' '}
{/if}
{if $record.period_start|@date_format:"%Y" !== $record.period_end|@date_format:"%Y"}

	{$record.period_start|@date_format:"%e"} {$record.period_start|@date_format:"%m"|@month_title:genitive:ru} {$record.period_start|@date_format:"%Y"}
	{$delimiter nofilter}по {$record.period_end|@date_format:"%e"} {$record.period_end|@date_format:"%m"|@month_title:genitive:ru} {$record.period_end|@date_format:"%Y"}

{elseif $record.period_start|@date_format:"%m" !== $record.period_end|@date_format:"%m"}

	{$record.period_start|@date_format:"%e"} {$record.period_start|@date_format:"%m"|@month_title:genitive:ru}
	{$delimiter nofilter}по {$record.period_end|@date_format:"%e"} {$record.period_end|@date_format:"%m"|@month_title:genitive:ru} {$record.period_end|@date_format:"%Y"}

{else}

	{$record.period_start|@date_format:"%e"}
	{$delimiter nofilter}по {$record.period_end|@date_format:"%e"} {$record.period_end|@date_format:"%m"|@month_title:genitive:ru} {$record.period_end|@date_format:"%Y"}

{/if}