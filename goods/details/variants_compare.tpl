{if !empty($icons)}
<table class="variants-l-icons">
    {foreach from=$icons item='icon'}
    <tr>
        <td>
            <img alt="{$icon.title|replace:'<br>':''|replace:'/*br*/':''|escape:'quotes'}"
                    title="{$icon.title|replace:'<br>':''|replace:'/*br*/':''|escape:'quotes'}"
                    data-src="{$icon.url}"
                    width="{$icon.width}"
                    height="{$icon.height}"
                    class="lazyload"
            >
        </td>
        <td>
            {$icon.title|replace:'/*br*/':'<br>'|escape:'quotes' nofilter}
        </td>
    </tr>
    {/foreach}
</table>
{else}
<ul class="pp-characteristics-l">
    {foreach from=$characteristics item='detail'}
    <li class="pp-characteristics-l-i"><span class="pp-characteristics-l-i-text">{$detail.title}:</span><br>{$detail|replace:'/*br*/':'<br>' nofilter}</li>
    {/foreach}
</ul>
{/if}