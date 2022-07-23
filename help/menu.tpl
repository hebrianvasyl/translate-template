<div class="help-menu">
    <ul>
        {*{if $menu.www->news}*}
            {*<li class="float-lt{if $menu.www->news->isMediate()} active{/if}">*}
                {*<a href="{$menu.www->news.href}">{$menu.www->news.title}</a>*}
            {*</li>*}
        {*{/if}*}
        {if $menu.www->qa}
            <li class="float-lt{if $menu.www->qa->isMediate()} active{/if}">
                <a href="{$menu.www->qa.href}">{$menu.www->qa.title}</a>
            </li>
        {/if}
        {if $menu.www->articles}
            <li class="float-lt{if $menu.www->articles->isMediate() || $menu.www->help->isMediate()} active{/if}">
                <a href="{$menu.www->articles.href}">{$menu.www->articles.title}</a>
            </li>
        {/if}
        {if $menu.www->videocontent}
            <li class="float-lt{if $menu.www->videocontent->isMediate()} active{/if}">
                <a href="{$menu.www->videocontent.href}">{$menu.www->videocontent.title}</a>
            </li>
        {/if}
    </ul>
</div>