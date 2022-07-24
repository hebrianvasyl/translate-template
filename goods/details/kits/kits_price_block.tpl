<div class="g-l-i-block">
	<div class="kit-price">
		<div class="price-block">
            {if $cost_with_discount->getValue() < $cost->getValue()}
                {$discount = floor(($cost->getValue() - $cost_with_discount->getValue()) / $cost->getValue() * 100)}
                <span class="pp-price-old-wrap tabs-all">
					<span class="pp-price-cost pp-price-cost-old old-price">{$cost nofilter}</span>
                    {if $discount > 0}
                    <span class="pp-price-discount-value">-{$discount}%</span>
                    {/if}
				</span>
            {/if}
			<span class="kit-price-cost price">{$cost_with_discount nofilter}</span>
            {if $cost_with_discount->getValue() < $cost->getValue()}
            <span class="kit-price-discount-price">{'Экономия'|translate} {round($cost->getValue() - $cost_with_discount->getValue())} грн</span>
            {/if}
			<div name="buy_kit_details"></div>
		</div>
	</div>
</div>

{if $cost_with_discount->getValue() < $cost->getValue()}
<input type="hidden" name="discount_value" value="{($cost->getValue() - $cost_with_discount->getValue())|round}">
<script>
$('discount_cost{$kit_id}').set('html', {($cost->getValue() - $cost_with_discount->getValue())|round});
</script>
{/if}