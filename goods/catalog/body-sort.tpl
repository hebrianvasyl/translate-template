<div class="m-sort" name="menu_sort_view">
	<div id="filter-selected"></div>
	<ul class="m-sort-i m-sort-i-l" style="display: none;">
		{foreach from=$menu.active->view item=node name=view}
			{if $node->isSelected()}
				<li class="m-sort-i-l-i float-lt active"><span class="m-sort-i-l-i-link {$node.name} after tile novisited">{$node.title}</span></li>
			{else}
				<li class="m-sort-i-l-i float-lt"><a href="{$node.href}" name="change-view-link" class="m-sort-i-l-i-link {$node.name} after tile novisited">{$node.title}</a></li>
			{/if}
		{/foreach}
	</ul>
    <div class="filter-row">
        <div class="filter-menu" onclick="FilterOpen()">
            <svg width="58px" height="65px" viewBox="0 0 58 65" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:sketch="http://www.bohemiancoding.com/sketch/ns">
                <defs></defs>
                    <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" sketch:type="MSPage">
                        <g id="Filter" sketch:type="MSLayerGroup" transform="translate(1.000000, 1.000000)" stroke="#6B6C6E" stroke-width="2">
                            <path d="M54,0 L2,0 C0.9,0 0,0.9 0,2 L21,33 C21,33.7 21.4,34.4 22,34.7 L22,62 L34,55 L34,34.7 C34.6,34.4 35,33.7 35,33 L56,2 C56,0.9 55.1,0 54,0 L54,0 Z" id="Shape" sketch:type="MSShapeGroup"></path>
                            <path d="M7,4 L23,28" id="Shape" sketch:type="MSShapeGroup"></path>
                        </g>
                    </g>
            </svg>
            <span>
                Фильтр
            </span>
        </div>
        <div class="m-sort-i m-sort-select">
            <select class="m-sort-select-i">
                {foreach from=$menu.active->sort item="node"}
                    <option name="sort_item" value="{$node.href}"{if $node->isSelected()} selected="selected"{/if}>{$node.title nofilter}</option>
                {/foreach}
            </select>
        </div>
    </div>
</div>
<script>
	new GTMEvents([
			{ //изменение порядка сортировки
				selector: '[name=menu_sort_view] select',
				event: 'change',
				gtm_data: {
					event: "OWOX",
					eventCategory: 'Catalog',
					eventAction: 'switchSorting',
					eventLabel: '{$menu.active.record['id']}'
				}
			},
			{ //изменение вида отображения
				selector: '[name=menu_sort_view] [name=change-view-link]',
				event: 'click',
				gtm_data: {
					event: "OWOX",
					eventCategory: 'Catalog',
					eventAction: 'switchView',
					eventLabel: '{$menu.active.record['id']}'
				}
			}
		]);
</script>