ready = function () {
  updateJs();
}

$(document).on('turbolinks:request-start', function () {
  Turbolinks.clearCache();
})

$(document).on('turbolinks:load', ready);
$(document).ready(ready);

function updateJs() {
  sideNav();
  sideNavToggle();
  sidePanelToggle();
  closeModal();
}


function closeModal() {
  $(".close").on('click', function() {
    $("#modal").modal('hide');
  });
}