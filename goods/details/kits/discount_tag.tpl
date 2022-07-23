{if $price}
	{$discount = (($price-$price_with_discount)/$price*100)|round}
	{if $discount > 99}{$discount = 99}{/if}
	{*{if $discount < 1}{$discount = 1}{/if}*}

	{if $kit.kit.is_show_full_discount and $price > $price_with_discount and $discount > 0}
		<div class="tag">
			-{round($discount)}%
		</div>
	{/if}
{/if}