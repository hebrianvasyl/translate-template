{if $menu.www}{strip}
{*TODO: не лучшее решение*}
	{$current_promo_status = ''}
	{foreach $menu.www->promotions as $promo_status}
		{foreach $promo_status as $promotion}
			{if $record.id == $promotion.id}
				{$current_promo_status = $promo_status}
				{break}
			{/if}
		{/foreach}
		{if !empty($current_promo_status)}
			{break}
		{/if}
	{/foreach}
	{*
		Когда current_promo_status empty, значит акция заблокирована, и не важно какой в ссылке будет статус,
		т.к. все равно попадем на 404. В этом случае подставляем past как заглушку
	*}
{/strip}{$menu.www->promotions.href}{if !empty($current_promo_status)}{$current_promo_status}{else}past{/if}/{$record.name}{$smarty.const.SITE_EXTENTION_DEFAULT}{/if}