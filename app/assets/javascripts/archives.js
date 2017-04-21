function blockContextMenu() {
  $('video').bind('contextmenu', function() { return false; });
}

function displayCoverArt() {
  let audioURL = $('video').attr("src");
  let coverURL = $('#cover-art-link').text();
  // $('video').insertBefore($(
  //   "<img src='" + coverURL + "'>"
  // ));
  $('video').closest('div').replaceWith($(
    "<div>" +
      "<img src='" + coverURL + "'>" +
      "<br>" +
      "<video controls autoplay name='media' style='height:35px;width:100%'>" +
        "<source src='" + audioURL + "' type='" + "audio/mpeg" + "'>" +
      "</video></div>" +
    "</div>"
  ));
}

function fileInputChange(input) {
  if (input.value.endsWith("mp3")) {
    $('#cover-upload').show();
  }

}

$(document).ready(function() {
  $('.block-context-menu').data('onContentLoaded', blockContextMenu);
  $('.display-cover-art').data('onContentLoaded', displayCoverArt);
});