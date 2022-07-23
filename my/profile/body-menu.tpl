{Users->getUser assign="user"}
<aside class="sidebar-sort sidebar float-lt">
	<ul class="cabinet-tabs">
		{foreach from=$menu.my->profile item=node name=menu_top}
            {if $user.user_type != 'dealer' && $node.name == 'agreements'}
                {continue}
            {/if}
			{if $node->isActive()}
				<li class="cabinet-tabs-i active">{$node.title}</li>
			{elseif $node->isMediate()}
				<li class="cabinet-tabs-i active"><a href="{$node.href}">{$node.title}</a></li>
			{else}
				<li class="cabinet-tabs-i"><a href="{$node.href}" class="novisited">{$node.title}</a></li>
			{/if}
		{/foreach}
	</ul>
</aside>