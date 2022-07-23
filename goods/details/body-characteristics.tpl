{if $main_details}
	<ul class="pp-characteristics-l">
		{foreach from=$main_details item='detail'}
				<li class="pp-characteristics-l-i"><span class="pp-characteristics-l-i-text">{$detail.title}:</span>&nbsp;{$detail|replace:'/*br*/':' '}</li>
		{/foreach}
	</ul>
{/if}

