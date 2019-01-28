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
  mask();
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

function mask() {
  $('.date').mask("00/00/0000", { placeholder: "__/__/____" });
  $('.hour').mask("00:00", { placeholder: "00:00" });
  $('.cpf').mask("000.000.000-00", { placeholder: "000.000.000-00" });
  $('.cnpj').mask("00.000.000/0000-00", { placeholder: "00.000.000/0000-00" });
  $('.document_number').mask("000-000.000/0000", { placeholder: "000-000.000/0000" });
  $('.cep').mask("00000-000", { placeholder: "00000-000" });
  $('.percent').mask("00.0", { placeholder: "00.0" });
  $('.coin').mask("######0.00", { reverse: true });
  $('.money').mask('000.000.000.000,00', { reverse: true });
}