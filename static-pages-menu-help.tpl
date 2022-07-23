<aside class="b-static-sidebar float-lt">
	<ul class="static-pages-l">
		{if $menu.www->about}
			<li class="static-pages-l-i">
				{if $menu.www->about->isMediate()}
					<span class="static-pages-l-i-link active">{$menu.www->about.title}</span>
				{else}
					<a href="{$menu.www->about.href}" class="static-pages-l-i-link">{$menu.www->about.title}</a>
				{/if}
			</li>
		{/if}
		{if $menu.www->news->isMediate()}
			<li class="static-pages-l-i">
				<span class="static-pages-l-i-link static-pages-title">{$menu.www->news.title}</span>
				<ul class="multi-menu-l">
					{foreach from=$menu.1->years item=year}
					<li class="{if $year->isMediate() or $year->isActive()}active{/if} multi-menu-l-i">
						{if $year->isMediate()}
							{if $year->isActive()}
								<span class="multi-menu-text">{$year.name}</span>
							{elseif $year->isMediate()}
								<a href="{$year.href}" class="multi-menu-text link">{$year.name}</a>
							{/if}
						{else}
							<a href="{$year.href}" class="multi-menu-text link">{$year.name}</a>
						{/if}
						{/foreach}
					</li>
				</ul>
			</li>
		{else}
			<li class="static-pages-l-i">
				<a class="static-pages-l-i-link" href="{$menu.www->news.href}">{$menu.www->news.title}</a>
			</li>
		{/if}
		{if $menu.www->promotions->isMediate()}
			<li class="static-pages-l-i">
				<span class="static-pages-l-i-link static-pages-title">{$menu.www->promotions.title}</span>
				<ul class="multi-menu-l">
					{foreach from=$menu.www->promotions item=status}
						<li class="{if $status->isMediate() or $status->isActive()}active{/if} multi-menu-l-i">
							{if $status == $menu.active}
								<span class="multi-menu-text">{$status.title}</span>
							{else}
								<a href="{$status.href}" class="multi-menu-text link">{$status.title}</a>
							{/if}
						</li>
					{/foreach}
				</ul>
			</li>
		{else}
			<li class="static-pages-l-i">
				<a class="static-pages-l-i-link" href="{$menu.www->promotions.href}">{$menu.www->promotions.title}</a>
			</li>
		{/if}

        <li class="static-pages-l-i">
            <a class="static-pages-l-i-link" href="{$menu.www->catalogs.href}">{$menu.www->catalogs.title}</a>
        </li>

		<li class="static-pages-l-i">
			{assign var="help_active" value=false}
            {assign var="active_page" value=''}
			{if isset($menu.active.name)}
				{if $menu.active.controller == '/Faq/controller.xml'}
					{assign var="help_active" value=true}
                    {assign var="active_page" value='qa'}
				{elseif $menu.active.controller == '/Articles/controller.xml'}
					{assign var="help_active" value=true}
					{assign var="active_page" value='articles'}
				{elseif $menu.active.controller == '/Videocontent/controller.xml'}
					{assign var="help_active" value=true}
                    {assign var="active_page" value='videocontent'}
				{/if}
			{/if}
			{if $help_active || $menu.www->help->isMediate()}
				<span class="static-pages-l-i-link static-pages-title">{$menu.www->help.title}</span>
				<ul class="multi-menu-l">
                    {if $menu.www->qa}
						<li class="{if $active_page == 'qa'}active{/if} multi-menu-l-i">
                            {if $active_page == 'qa'}
								<span class="multi-menu-text">{$menu.www->qa.title}</span>
							{else}
								<a href="{$menu.www->qa.href}">{$menu.www->qa.title}</a>
							{/if}
						</li>
                    {/if}
                    {if $menu.www->articles}
						<li class="{if $active_page == 'articles'}active{/if} multi-menu-l-i">
                            {if $active_page == 'articles'}
								<span class="multi-menu-text">{$menu.www->articles.title}</span>

                                {Controller->getRecords parent_id=0 is_section=1 order=order assign=categories}
                                {if count($categories)}
									<ul class="static-page-sub-categories">
                                        {if ($menu.active != $menu.www->articles)}
											<li>
												<a href="{$menu.www->articles.href}">Все</a>
											</li>
                                        {else}
											<li class="active">
												<span>Все</span>
											</li>
                                        {/if}

                                        {foreach from=$categories item=category}
                                            {if isset($menu.active.record) && $menu.active.record->name.value == {$category.name}}
												<li class="active">
													<span>{$category.title}</span>
												</li>
                                            {else}
												<li>
													<a href="{$category.href}">{$category.title}</a>
												</li>
                                            {/if}
                                        {/foreach}
									</ul>
                                {/if}
                            {else}
								<a href="{$menu.www->articles.href}">{$menu.www->articles.title}</a>
                            {/if}
						</li>
                    {/if}
                    {if $menu.www->videocontent}
						<li class="{if $active_page == 'videocontent'}active{/if} multi-menu-l-i">
                            {if $active_page == 'videocontent'}
								<span class="multi-menu-text">{$menu.www->videocontent.title}</span>

                                {Controller->getRecords parent_id=0 is_section=1 order=order assign=categories}
                                {if count($categories)}
									<ul class="static-page-sub-categories">
										{if ($menu.active != $menu.www->videocontent)}
											<li>
												<a href="{$menu.www->videocontent.href}">Все</a>
											</li>
										{else}
											<li class="active">
												<span>Все</span>
											</li>
                                        {/if}

										{foreach from=$categories item=category}
											{if isset($menu.active.record) && $menu.active.record->name.value == {$category.name}}
												<li class="active">
													<span>{$category.title}</span>
												</li>
											{else}
												<li>
													<a href="{$category.href}">{$category.title}</a>
												</li>
											{/if}
										{/foreach}
									</ul>
                                {/if}
                            {else}
								<a href="{$menu.www->videocontent.href}">{$menu.www->videocontent.title}</a>
                            {/if}
						</li>
                    {/if}
				</ul>
			{else}
				<a href="{$menu.www->articles.href}" class="static-pages-l-i-link">{$menu.www->help.title}</a>
			{/if}
		</li>
		{*{if $menu.www->articles->isMediate()}*}
			{*<li class="static-pages-l-i">*}
				{*{if $menu.www->articles->isActive()}*}
					{*<span class="static-pages-l-i-link static-pages-title">{$menu.www->articles.title}</span>*}
				{*{else}*}
					{*<a class="static-pages-l-i-link" href="{$menu.www->articles.href}">{$menu.www->articles.title}</a>*}
				{*{/if}*}
				{*{foreach from=$menu.www->articles item="node"}*}
					{*{if $node.record and $node.record->isSection() and count($node.children)}*}
						{*{if count($node.children)}*}
							{*<ul class="multi-menu-l">*}
								{*<li class="{if $node->isMediate() && count($node)}mediate{/if} {if $node->isActive()}active{/if} multi-menu-l-i">*}
									{*{if $node->isActive()}*}
										{*<span class="multi-menu-text">{$node.title}</span>*}
									{*{else}*}
										{*<a href="{$node.href}" class="multi-menu-text link">{$node.title}</a>*}
									{*{/if}*}
									{*{if $node->isMediate()}*}
										{*<ul class="multi-menu-l">*}
											{*{foreach from=$node item="subnode"}*}
												{*{if $subnode.record and $subnode.record->isSection() and count($subnode.children)}*}
													{*<li class="{if $subnode->isMediate()}active{elseif $subnode->isActive()}active{/if} multi-menu-l-i">*}
														{*{if $subnode->isActive()}*}
															{*<span class="multi-menu-text">{$subnode.title}</span>*}
														{*{elseif $subnode->isMediate()}*}
															{*<a href="{$subnode.href}" class="multi-menu-text link">{$subnode.title}</a>*}
															{*<span class="multi-menu-text">{$subnode.title}</span>*}
														{*{else}*}
															{*<a href="{$subnode.href}" class="multi-menu-text link">{$subnode.title}</a>*}
														{*{/if}*}
													{*</li>*}
												{*{/if}*}
											{*{/foreach}*}
										{*</ul>*}
									{*{/if}*}
								{*</li>*}
							{*</ul>*}
						{*{/if}*}
					{*{/if}*}
				{*{/foreach}*}
			{*</li>*}
		{*{else}*}
			{*<li class="static-pages-l-i">*}
				{*<a class="static-pages-l-i-link" href="{$menu.www->articles.href}">{$menu.www->articles.title}</a>*}
			{*</li>*}
		{*{/if}*}
		{*{if $menu.www->videocontent->isMediate()}*}
			{*<li class="static-pages-l-i">*}
				{*{if $menu.www->videocontent->isActive()}*}
					{*<span class="static-pages-l-i-link static-pages-title">{$menu.www->videocontent.title}</span>*}
				{*{else}*}
					{*<a class="static-pages-l-i-link" href="{$menu.www->videocontent.href}">{$menu.www->videocontent.title}</a>*}
				{*{/if}*}
				{*{foreach from=$menu.www->videocontent item="node"}*}
					{*{if $node.record and $node.record->isSection() and count($node.children)}*}
						{*{if count($node.children)}*}
							{*<ul class="multi-menu-l">*}
								{*<li class="{if $node->isMediate() && count($node)}mediate{/if} {if $node->isActive()}active{/if} multi-menu-l-i">*}
									{*{if $node->isActive()}*}
										{*<span class="multi-menu-text">{$node.title}</span>*}
									{*{else}*}
										{*<a href="{$node.href}" class="multi-menu-text link">{$node.title}</a>*}
									{*{/if}*}
									{*{if $node->isMediate()}*}
										{*<ul class="multi-menu-l">*}
											{*{foreach from=$node item="subnode"}*}
												{*{if $subnode.record and $subnode.record->isSection() and count($subnode.children)}*}
													{*<li class="{if $subnode->isMediate()}active{elseif $subnode->isActive()}active{/if} multi-menu-l-i">*}
														{*{if $subnode->isActive()}*}
															{*<span class="multi-menu-text">{$subnode.title}</span>*}
														{*{elseif $subnode->isMediate()}*}
															{*<a href="{$subnode.href}" class="multi-menu-text link">{$subnode.title}</a>*}
															{*<span class="multi-menu-text">{$subnode.title}</span>*}
														{*{else}*}
															{*<a href="{$subnode.href}" class="multi-menu-text link">{$subnode.title}</a>*}
														{*{/if}*}
													{*</li>*}
												{*{/if}*}
											{*{/foreach}*}
										{*</ul>*}
									{*{/if}*}
								{*</li>*}
							{*</ul>*}
						{*{/if}*}
					{*{/if}*}
				{*{/foreach}*}
			{*</li>*}
		{*{else}*}
			{*<li class="static-pages-l-i">*}
				{*<a class="static-pages-l-i-link" href="{$menu.www->videocontent.href}">{$menu.www->videocontent.title}</a>*}
			{*</li>*}
		{*{/if}*}
		{if $menu.www->wholesale}
			<li class="static-pages-l-i">
				{if $menu.www->wholesale->isMediate()}
					<span class="static-pages-l-i-link active">{$menu.www->wholesale.title}</span>
				{else}
					<a href="{$menu.www->wholesale.href}" class="static-pages-l-i-link">{$menu.www->wholesale.title}</a>
				{/if}
			</li>
		{/if}
		{if $menu.www->guaranty}
			<li class="static-pages-l-i">
				{if $menu.www->guaranty->isMediate()}
					<span class="static-pages-l-i-link active">{$menu.www->guaranty.title}</span>
				{else}
					<a href="{$menu.www->guaranty.href}" class="static-pages-l-i-link">{$menu.www->guaranty.title}</a>
				{/if}
			</li>
		{/if}
		{if $menu.www->help2}
			<li class="static-pages-l-i">
				{if $menu.www->help2->isMediate()}
					<span class="static-pages-l-i-link active">{$menu.www->help2.title}</span>
				{else}
					<a href="{$menu.www->help2.href}" class="static-pages-l-i-link">{$menu.www->help2.title}</a>
				{/if}
			</li>
		{/if}
		{if $menu.www->dostavka_i_oplata}
			<li class="static-pages-l-i">
				{if $menu.www->dostavka_i_oplata->isMediate()}
					<span class="static-pages-l-i-link active">{$menu.www->dostavka_i_oplata.title}</span>
				{else}
					<a href="{$menu.www->dostavka_i_oplata.href}" class="static-pages-l-i-link">{$menu.www->dostavka_i_oplata.title}</a>
				{/if}
			</li>
		{/if}
		{if $menu.www->contacts}
			<li class="static-pages-l-i">
				{if $menu.www->contacts->isMediate()}
					<span class="static-pages-l-i-link active">{$menu.www->contacts.title}</span>
				{else}
					<a href="{$menu.www->contacts.href}" class="static-pages-l-i-link">{$menu.www->contacts.title}</a>
				{/if}
			</li>
		{/if}
	</ul>
</aside>