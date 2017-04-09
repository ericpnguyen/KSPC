function blockContextMenu() {
  console.log(this);
  $('video').bind('contextmenu', function() { return false; });
}

$(document).ready(function() {
  $('.block-context-menu').data('onContentLoaded', blockContextMenu);
});