{if $record->article and $menu.www}{$menu.www->articles.href}{if $record->article->parent && $record->article->parent->parent}{$record->article->parent->parent.name}/{/if}{if $record->article->parent}{$record->article->parent.name}/{/if}{$record->article.name}/{/if}