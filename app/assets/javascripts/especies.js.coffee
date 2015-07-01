#= require datable
#= require bootstrapValidator/bootstrapValidator
#= require input-mask/jquery.inputmask.js
#= require input-mask/jquery.inputmask.regex.extensions.js
#= require cocoon

jQuery(document).ready ($) ->

  $('#form_especie').bootstrapValidator
    feedbackIcons:
      valid: 'fa fa-check ',
      invalid: 'fa fa-times',
      validating: 'fa fa-refresh'
    live: 'submitted'
    fields:
      "especie[nombre_comun]":
        validators:
          notEmpty:
            message: 'El campo Nombre Común es obligatorio.'

  $('#especie_dmc').inputmask("Regex", {
    regex: "[0-9.]{1,9}%"
  });

  $('#especie_densidad').inputmask("Regex", {
    regex: "[0-9.]{1,9}%"
  });

  $('#select_especie_forestal').on 'change', ->
    optionSelect =$('#select_especie_forestal option:selected').val().toString()
    if optionSelect != ""
      $.ajax
        type: "GET"
        url: "/especies/"+optionSelect+"/ajax_uso"
        dataType: "html"
        success: (data) ->
          $('#form-check-usos-especie').html(data)
          $("html, body").animate({ scrollTop: 250}, "slow")
    else
      $('#form-check-usos-especie').html('')
