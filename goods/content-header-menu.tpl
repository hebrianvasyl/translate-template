{strip}
	<nav class="{if count($menu.www->goods)<7}vert{elseif count($menu.www->goods)>=7}horiz{/if}
	{if count($menu.www->goods)==1} one
	{elseif count($menu.www->goods)==2} two
	{elseif count($menu.www->goods)==3} three
	{elseif count($menu.www->goods)==4} four
	{elseif count($menu.www->goods)==5} five
	{elseif count($menu.www->goods)==6} six
	{elseif count($menu.www->goods)==7} seven
	{elseif count($menu.www->goods)==8} eight
	{elseif count($menu.www->goods)==9} nine
	{elseif count($menu.www->goods)==10} ten
	{/if} m-main">
        <ul id="main_menu">
				{assign var=menu_items value=1}

				{if !empty($settings.package_features.named_filters)}
					{*получаем все нужные именованные фильтры за раз*}
					{$goods_section_ids = []}
					{foreach from=$menu.www->goods item="node"}
						{foreach $node as $sub_node}
							{if ($sub_node->getRecord() and $sub_node->getRecord() instanceof Goods_Record)}
								{$goods_section = $sub_node->getRecord()->getGoodsSection()}
								{$goods_section_id = $goods_section.id}
								{$goods_section_ids.$goods_section_id = $goods_section_id}
							{/if}
						{/foreach}
					{/foreach}

					{GoodsNamedFilters->getPresetsBySections sections=$goods_section_ids assign="named_filters_for_goods_sections"}
				{/if}

				{foreach from=$menu.www->goods item="node"}
                    {if $node.name == 'stock'}
                        {continue}
                    {/if}

					{include file='goods/section_attachment.tpl' scope=parent}

					{if count($node) or $node.name=='stock' and !empty($node.count)}
						<li class="m-main-i" name="m_main_i">
							<div class="m-main-i-wrapper">
								<div class="m-main-i-b">
									{if $section_attachment}
										{$is_image_dafault = $section_attachment.original->isDefault()}
									{/if}
									{if $node->isMediate()}
										<div class="m-main-i-link-b active">
											{if $node->isActive()}
												<div class="m-main-i-link">
													<div class="m-main-i-text v-align-wrapper">
														{include file='goods/content-header-menu-section-attachment.tpl' node=$node}
														<div class="v-align-container">
															<span class="m-main-i-text-content">{$node.title}</span>
														</div>
													</div>
												</div>
											{else}
												<a class="m-main-i-link" href="{$node.href}">
													<div class="m-main-i-text v-align-wrapper">
														{include file='goods/content-header-menu-section-attachment.tpl' node=$node}
														<div class="v-align-container">
															<span class="m-main-i-text-content">{$node.title}</span>
														</div>
													</div>
												</a>
											{/if}
										</div>
									{else}
										<a class="m-main-i-link" href="{$node.href}">
											<div class="m-main-i-text v-align-wrapper">
												{include file='goods/content-header-menu-section-attachment.tpl' node=$node}
												<div class="v-align-container">
													<span class="m-main-i-text-content">{$node.title}</span>
												</div>
											</div>
										</a>
									{/if}

									{include file='goods/menu_subnodes.tpl' node=$node}

								</div>
							</div>
						</li>
                        {assign var=menu_items value=$menu_items+1}
					{/if}
				{/foreach}
			</ul>
			<script type="text/javascript">
				var MoreBlock = new MoreBlock_class();
				MoreBlock.init('main_menu');
			</script>
	</nav>
{/strip}