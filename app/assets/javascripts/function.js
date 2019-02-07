ready = function () {
  update_js();
}

$(document).on('turbolinks:request-start', function () {
  Turbolinks.clearCache();
})

$(document).on('turbolinks:load', ready);
$(document).ready(ready);

function update_js() {
  sidebar_collapsed();
  close_modal();
}

function sidebar_collapsed() {
  $(".collapsing-link").unbind().click(function() {
    $(this).closest(".card").children(".card-body:nth-child(2)").toggle();

    if ($(this).children("i").hasClass('fa-plus')) {
      $(this).children("i").removeClass('fa-plus');
      $(this).children("i").addClass('fa-minus');
    } else {
      $(this).children("i").addClass('fa-plus');
      $(this).children("i").removeClass('fa-minus');
    }
  });
}

function close_modal() {
  $(".close").unbind().click(function() {
    $("#modal").modal('hide');
  })
}