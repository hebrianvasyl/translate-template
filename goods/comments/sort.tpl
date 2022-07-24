
<div class="m-sort-i m-sort-select m-sort-comments">
	<span>{'Сортировка'|translate}</span>
	<select class="m-sort-select-i" id="comments-sort">
		{foreach from=$menu.active->sort item="node"}
			<option name="sort_item" value="{$node.href}"{if $node->isSelected()} selected="selected"{/if}>{$node.title nofilter}</option>
		{/foreach}
	</select>
</div>

<script>

    $('comments-sort').addEvent('change', function (event) {

        event.stop();

        var container = $('comments-parent');

        container.processStart('{template_js_fetch file="_jst/process.jst"}');

        new Request.HTML({
            url: event.target.getProperty('value'),
            update: container ,
            onSuccess: function () {

                container.processStop();

            }
        }).get();

    });

</script>