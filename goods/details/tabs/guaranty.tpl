<div class="tabs-content-wrap return-tab">
    {$content nofilter}
</div>
<script>
    if (typeof fx == 'undefined') {
        var fx = {};
    }

    Array.each($$('.accordion > .content'), function(element, index){
        var i = 'index-' + index;
        element.setProperty('data-index', index);
        fx[i] = new Fx.Slide(element, {
            resetHeight: true
        });
        fx[i].hide();
    });
</script>