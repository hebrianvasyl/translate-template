{*Узнаем, в $section_node подкатегории или производители.
Для этого у первого элемента спрашиваем группу*}
{$first_sub_node = $section_node -> getFirst()}

{VHTopmenu->getRecords record_id=$section_node.id assign="subs"}
{*Приоритет: подкатегории, именов. фильтры, производители (подноды)*}
{if $subs}
	{$subnodes_source = $subs}
{elseif ($section_node|@count) and $first_sub_node.group == 'goods'}
	{$subnodes_source = $section_node}
{elseif ($section_node->getRecord() instanceof Goods_Record)}
	{$goods_section = $section_node->getRecord()->getGoodsSection()}
	{$goods_section_id = $goods_section.id}
	{if !empty($named_filters_for_goods_sections.$goods_section_id)}
		{$subnodes_source = $named_filters_for_goods_sections.$goods_section_id}
	{else}
		{$subnodes_source = $section_node}
	{/if}
{else}
    {$subnodes_source = $section_node}
{/if}