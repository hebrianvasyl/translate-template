{capture name=menu_subnodes}
	{strip}
        {if $node|count > 9}
            {$rows = (($node|count) / 5)|floor}
        {else}
            {$rows = 1}
        {/if}
		<div class="node-wrapper">
			<div class="node-wrapper-content">
				{*<!--[if IE]><div class="whitespace"></div><![endif]-->*}
				<div  class="node-menu" name="menu-subnode">
					<table>
						{$subnodes_counter = 0}
						<tr>
							{foreach $node as $subnode}
							{if ($subnode instanceof Goods_Menu_Node_Section and $subnode->getRecord())}
							{$subnodes_counter = $subnodes_counter+1}
							<td class="node-menu-i" name="more_parent">
								<div class="node-menu-i-title">
									<a class="node-menu-i-title-link"
									   href="{if $subnode->parent.name != 'stock'}{$subnode.href}{else}{$subnode->parent.href}#{$subnode.name}{/if}">
                                        {if isset($subnode.record.title_for_menu) && !empty($subnode.record.title_for_menu)}
                                        {$subnode.record.title_for_menu nofilter}
                                        {else}
                                        {$subnode.title}
                                        {/if}
										{include file='goods/content-header-menu-attachment.tpl' node=$subnode}
									</a>
								</div>
								<ul class="node-menu-i-l">

									{$section_node = $subnode}
									{include file='goods/get_subnodes_source_by_section_node.tpl' scope=parent}

									{$sub_subnodes_counter = 0}

									{foreach $subnodes_source as $subsubnode}
										{if ($subsubnode instanceof Stores_Catalogs_Offers_NamedFilters_Record
											or $subsubnode instanceof Menu_Node and $subsubnode->getRecord())
											or ($subsubnode instanceof VHTopmenu_Record and $subsubnode.title and $subsubnode.href)}
											<li class="node-menu-i-l-i">
												<a class="node-menu-i-l-i-link" href="{$subsubnode.href}">{$subsubnode.title}</a>
											</li>
											{$sub_subnodes_counter = $sub_subnodes_counter + 1}

											{if (($sub_subnodes_counter == 9) && ($subnodes_source|@count > 10))}
								</ul>
								<ul class="node-menu-i-l" name="categories_cut">
											{/if}
										{/if}
									{/foreach}
								</ul>
								{if ($sub_subnodes_counter > 10)}
									<a onclick="return false" more_hide name="more_categories" href="#" class="link-more novisited">
										<span class="underline">Еще</span>▼
									</a>
								{/if}

							</td>

							{if ($rows > 1 and $subnodes_counter % 5 == 0)}</tr><tr>{/if}
							{/if}
							{/foreach}

                            {VHTopmenu->getRecords record_id=$node.id is_section=1 assign="sections"}

							{if $sections|count > 9}
								{$rows = (($sections|count) / 5)|floor}
							{else}
								{$rows = 1}
							{/if}

                            {foreach $sections as $section}
                            {$subnodes_counter = $subnodes_counter+1}
                            <td class="node-menu-i" name="more_parent">
                                <div class="node-menu-i-title">
                                    <a class="node-menu-i-title-link" href="{if $section.href}{$section.href}{else}#{/if}">
                                        {$section.title nofilter}

                                        {if count($section->attachments->image)}
                                        <div class="node-menu-i-title-link-img">
                                            <img alt="{$section.title|escape:'quotes'}" title="{$section.title|escape:'quotes'}" name="top-{$section.id}" data-src="{$section->attachments->image.original.url}" width="{$section->attachments->image.original.width}" height="{$section->attachments->image.original.height}" class="lazyload" />
                                        </div>
                                        {/if}
                                    </a>
                                </div>

                                {VHTopmenu->getRecords parent_id=$section.id assign="subs"}

                                {if $subs}
                                <ul class="node-menu-i-l">
                                    {$sub_subnodes_counter = 0}

                                    {foreach $subs as $subsubnode}
                                    {if ($subsubnode instanceof Stores_Catalogs_Offers_NamedFilters_Record
                                    or $subsubnode instanceof Menu_Node and $subsubnode->getRecord())
                                    or ($subsubnode instanceof VHTopmenu_Record and $subsubnode.title and $subsubnode.href)}
                                    <li class="node-menu-i-l-i">
                                        <a class="node-menu-i-l-i-link" href="{$subsubnode.href}">{$subsubnode.title}</a>
                                    </li>
                                    {$sub_subnodes_counter = $sub_subnodes_counter + 1}

                                    {if (($sub_subnodes_counter == 9) && ($subs|@count > 10))}
                                </ul>
                                <ul class="node-menu-i-l" name="categories_cut">
                                    {/if}
                                    {/if}
                                    {/foreach}
                                </ul>
                                {if ($sub_subnodes_counter > 10)}
                                <a onclick="return false" more_hide name="more_categories" href="#" class="link-more novisited">
                                    <span class="underline">Еще</span>▼
                                </a>
                                {/if}
                                {/if}
                            </td>

                            {if ($rows > 1 and $subnodes_counter % 5 == 0)}</tr><tr>{/if}
                            {/foreach}
						</tr>
					</table>
				</div>
			</div>
		</div>
	{/strip}
{/capture}

{if $subnodes_counter > 0}
	{$smarty.capture.menu_subnodes nofilter}
{/if}