<div id="video_{$video.id}">
    <iframe src="https://www.youtube.com/embed/{$video.ext_video_id}?rel=0" width="500" height="310" frameborder="0" allowfullscreen></iframe>
</div>

<script type="text/javascript">
    $('video_{$video.id}').getParent().show();
</script>