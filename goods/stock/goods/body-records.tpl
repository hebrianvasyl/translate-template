{foreach $menu.active->goods as $goods_node}

	{include file="goods/catalog/body-records.tpl" section=$goods_node->getRecord()}

{/foreach}