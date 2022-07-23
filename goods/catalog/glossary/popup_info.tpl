<div class="info-popup-parent" id='details_parent_{$field.id}'>
	<a class="info-link" id='details_{$field.id}' href="#"
	   name="info-link"
	>
		<img class="info-link-img" src="{$settings.path.design}/_.gif">
	</a>
</div>
<script>
	var info_popup{$field.id} = new Popup_class('{template_js_fetch file="_jst/popup-light.jst"}','details_parent_{$field.id}');

	info_popup{$field.id}.setContent(
		'{template_js_fetch file="goods/catalog/glossary/jst/glossary-popup.jst" field=$field glossary_href=$glossary_href}'
	);
	$('details_{$field.id}').addEvent(
		'click', function (e) {
			e.stop();
			info_popup{$field.id}.open();
			var popup = $$('#details_parent_{$field.id} .popup')[0];
			if(popup) {
                var popup_size = popup.getSize();
                var margin_top = Math.round(popup_size.y / 2);
                popup.setStyles({
					marginTop: '-' + margin_top + 'px',
					top: '50%'
				});
            }
		}
	);
</script>