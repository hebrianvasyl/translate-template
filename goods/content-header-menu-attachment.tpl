{if !empty($node)}
    {$category = $node->getRecord()}
{/if}

{if !($category instanceof Goods_Record)}
    {$section_attachment = null}
{elseif !empty($category->attachments->top) and count($category->attachments->top)}
    {$section_attachment = $category->attachments->top}
{elseif $goods_section = $category->getGoodsSection()}
    {$section_attachment = $goods_section->attachments->top}
{else}
    {$section_attachment = null}
{/if}

{if count($section_attachment)}
<div class="node-menu-i-title-link-img">
    <img
        alt="{$category.title|escape:'quotes'}"
        title="{$category.title|escape:'quotes'}"
        name="top-{$category.id}" data-src="{$section_attachment.medium.url}"
        width="{$section_attachment.medium.width}"
        height="{$section_attachment.medium.height}"
        class="lazyload"
    >
</div>
{/if}
