function blockContextMenu() {
  $('video').bind('contextmenu', function() { return false; });
}

function addAudioTag() {
  let audioPath = $('#audio-path').text();
  let audioElement = $(
    "<audio controls autoplay name='media'>" +
      "<source src='" + audioPath + "'>" +
    "</audio>"
  );
  audioElement.bind('contextmenu', function() { return false; });
  this.modal().find('img').after(audioElement);
}

function fileInputChange(input) {
  if (input.value.endsWith("mp3") || input.value.endsWith("m4a")) {
    $('#cover-upload').show();
  }
}

$(document).ready(function() {
  $('.block-context-menu').data('onContentLoaded', blockContextMenu);
  $('.add-audio-tag').data('onContentLoaded', addAudioTag);
});