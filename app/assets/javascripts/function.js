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
  mask();
  init_tiny_mce();
  nested_form();
  select2();
  datepicker();
  collapsing_form();
  magnify();
  collapse();
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

function init_tiny_mce() {
  tinymce.remove();
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
    plugins: "image,link,imagetools,media,table,insertdatetime,charmap,print,anchor,searchreplace,visualblocks",

    setup: function (editor) {
      editor.on('change', function () {
        editor.save();
      });
    }
  });

}


function nested_form() {
  $('form').on('click', '.remove_fields', function (event) {
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('fieldset').hide();
    return event.preventDefault();
  });
  
  $('form').on('click', '.add_fields', function (event) {
    var regexp, time;
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    return event.preventDefault();
  });
}


function select2() {
  $("#select2").select2({
    theme: "bootstrap",
    language: "pt-BR"
  });
}


function datepicker() {
  $.fn.datepicker.defaults.format    = "mm/dd/yyyy";
  $.fn.datepicker.defaults.language  = "pt-BR";
  $.fn.datepicker.defaults.autoclose = true;
}

function collapsing_form() {
  $(".collapse-input").unbind().on("change", function() {
    $($(this).data('collapse-target')).toggle();
  });
}

function magnify() {

  $('[data-magnify]').magnify({
    headToolbar: [
      'close'
    ],
    footToolbar: [
      'zoomIn',
      'zoomOut',
      'prev',
      'fullscreen',
      'next',
      'actualSize',
      'rotateRight'
    ],
    title: false
  });


}