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
  collapse();
  close_modal();
  mask();
  initTinyMCE();
}

function collapse() {
  $(".collapsing-content-link").unbind().click(function () {
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

function initTinyMCE() {
  //tinymce.remove();
  tinymce.init({
    selector: 'textarea.tinymce',
    language: 'pt_BR',
    indentation: '20pt',
    indent_use_margin: true,
    fontsize_formats: '8pt 10pt 12pt 14pt 18pt 24pt 36pt',
    toolbar: [
      "styleselect | bold italic | alignleft aligncenter alignright alignjustify",
      "bullist numlist outdent indent | link image | code | codesample | fontsizeselect"
    ],
    plugins: "image,link,code,codesample,imagetools,media,table,insertdatetime,charmap,print,preview,anchor,searchreplace,visualblocks,fullscreen",

    setup: function (editor) {
      editor.on('change', function () {
        editor.save();
      });
    }
  });

}
