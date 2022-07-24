<nav itemscope itemtype="http://schema.org/WebPage">
	<ul itemprop="breadcrumb" class="breadcrumbs-l clearfix">
		{if $menu->getCacheHttpLabel() == 'my'}
			<li class="breadcrumbs-l-i float-lt">
				<span itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
					<a href="{$menu.www.href}" itemprop="url" class="novisited">
						<span itemprop="title">{'Интернет магазин IntexPool'|translate}</span>
					</a>
				</span>
			</li>
			<li class="float-lt breadcrumbs-l-i separate">/</li>
		{/if}
		{assign var=group_name value='goods'}
		{foreach from=$menu item=node name=breadcrumbs}
            {if empty($node.title)}
                {continue}
            {/if}
			{*если у нас хлебная крошка совпала с выводимым товаром, то прерываем на этом вывод крошек,
				так как название товара и все, что после него, в хл. крошках нам не нужно*}
			{if !empty($record) && $node.record===$record && $record->isRecord()}
				{break}
			{/if}
			{if !$smarty.foreach.breadcrumbs.last}
				<li class="breadcrumbs-l-i float-lt" itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
					<a href="{if $node->parent.name != 'stock'}{$node.href}{else}{$node->parent.href}#{$node.name}{/if}" itemprop="url" class="novisited">
						<span itemprop="title">{$node.title|replace:'/*br*/':' '|replace:'<br>':' '}</span>
					</a>
				</li>
				<li class="float-lt breadcrumbs-l-i separate">/</li>
			{/if}
			{if $smarty.foreach.breadcrumbs.last && !empty($show_last_breadcrumb) && $show_last_breadcrumb}
				<li class="breadcrumbs-l-i float-lt" itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
					<span itemprop="title">{$node.title|replace:'/*br*/':' '|replace:'<br>':' '}</span>
				</li>
			{/if}
		{/foreach}

		{if !empty($show_producer_breadcrumb) && !empty($record->producer) && $record->producer->isActive()}
			{assign var='producer_name' value=$record->producer.name}
			{assign var='producer_node' value=$node->parent->producers->$producer_name}
			<li class="float-lt breadcrumbs-l-i" itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
				<a href="{$producer_node.href}" itemprop="url" class="novisited">
					<span itemprop="title">{$record->producer.title}</span>
				</a>
			</li>

			{if $record->series}
				{$series_node =  $producer_node->series->{$record->series.name}}

				{if $series_node}
					<li class="float-lt breadcrumbs-l-i separate">/</li>
					<li class="float-lt breadcrumbs-l-i" itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
						<a href="{$series_node.href}" itemprop="url">
							<span itemprop="title">{$record->series.title}</span>
						</a>
					</li>
				{/if}

			{/if}

		{/if}

	</ul>
</nav>