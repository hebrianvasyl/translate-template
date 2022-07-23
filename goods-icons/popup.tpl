<div id="{$parent_id}"></div>
<script>
    (function(){
        var button   = $('{$button_id}'),
            template = '{template_js_fetch file="goods-icons/_jst/popup.jst"}',
            popup    = new Popup_class(template, '{$parent_id}');

        popup.options.single = true;
        popup.setContent('{$content nofilter}');

//        var onButtonMouseOver = function(e){
//            popup.open();
//        };

//        var onButtonMouseLeave = function(e){
//            popup.close();
//        };

//        var onPopupOpen = function(){
//            button.removeEvent('mouseover', onButtonMouseOver);
//        };

//        var onPopupClose = function(){
//            button.addEvent('mouseover', onButtonMouseOver);
//        };

        var onButtonClick = function(e){
            e.stop();
            popup.open();

            var popup_block = $$('#{$parent_id} .popup')[0];
            if(popup_block) {
                var popup_size = popup_block.getSize();
                var margin_top = Math.round(popup_size.y / 2);
                popup_block.setStyles({
                    marginTop: '-' + margin_top + 'px',
                    top: '50%'
                });
            }
        };

//        button.addEvent('mouseover', onButtonMouseOver);
//        button.addEvent('mouseleave', onButtonMouseLeave);
        button.addEvent('click', onButtonClick);

//        popup.addEvent('open', onPopupOpen);
//        popup.addEvent('closePopup', onPopupClose);
    }());
</script>