function blockContextMenu() {
  $('video').bind('contextmenu', function() { return false; });
}

function fileInputChange(input) {
  if (input.value.endsWith("mp3")) {
    $('#cover-upload').show();
  }
}

$(document).ready(function() {
  $('.block-context-menu').data('onContentLoaded', blockContextMenu);
});