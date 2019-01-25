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
  collapsingFilter();
}


function closeModal() {
  $(".close").on('click', function() {
    $("#modal").modal('hide');
  });
}

function collapsingFilter() {
  $(".collapsing-filter").unbind().on('click', function() {
    $('.form-filter').toggle();

    if($(this).children('i').hasClass('ei-up-chevron')) {
      $(this).children('i').removeClass('ei-up-chevron');
      $(this).children('i').addClass('ei-down-chevron');
    } else {
      $(this).children('i').removeClass('ei-down-chevron');
      $(this).children('i').addClass('ei-up-chevron');
    }
  })

}