#= require input-mask/jquery.inputmask.js
#= require input-mask/jquery.inputmask.regex.extensions.js
#= require jasny/jasny-bootstrap
#= require datable
#= require bootstrapValidator/bootstrapValidator

jQuery(document).ready ($) ->
    $('#form_bloque_ordenacion').bootstrapValidator
      feedbackIcons:
        valid: 'fa fa-check ',
        invalid: 'fa fa-times',
        validating: 'fa fa-refresh'
      live: 'submitted'
      fields:
        "bloque_ordenacion[nombre]":
          validators:
            notEmpty:
              message: 'El campo Nombre es obligatorio.'
        "bloque_ordenacion[abreviado]":
          validators:
            notEmpty:
              message: 'El campo Nombre Abreviado es obligatorio.'
        "bloque_ordenacion[area]":
          validators:
            notEmpty:
              message: 'El campo Área Abreviado es obligatorio.'
            regex:
              numeric:
                message: 'Debe ser un valor numérico, decimales separados por punto.'

    $('#bloque_ordenacion_area').inputmask("Regex", {
      regex: "[0-9.]{1,9}%"
    });