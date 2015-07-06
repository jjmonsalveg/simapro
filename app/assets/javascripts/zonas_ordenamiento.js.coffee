#= require jasny/jasny-bootstrap
#= require datable
#= require bootstrapValidator/bootstrapValidator
#= require ubicacion_territorial
#= require jquery-fileupload
#= require document_upload
#= require lightbox/js/lightbox.min.js
#= require jquery.inputmask/jquery.inputmask.js
#= require jquery.inputmask/jquery.inputmask.extensions
#= require jquery.inputmask/jquery.inputmask.numeric.extensions
#= require jquery.inputmask/jquery.inputmask.regex.extensions




jQuery(document).ready ($) ->
  add_mask($('#zona_ordenamiento_area'))

  $('#form_zona_ordenamiento').bootstrapValidator
    feedbackIcons:
      valid: 'fa fa-check ',
      invalid: 'fa fa-times',
      validating: 'fa fa-refresh'
    live: 'enable'
    fields:
      "zona_ordenamiento[nombre]":
        validators:
          notEmpty:
            message: 'Nombre es Obligatorio'
          regexp:
            regexp: /^.{0,64}$/
            message: "Nombre muy extenso"
      "zona_ordenamiento[abreviado]":
        validators:
          notEmpty:
            message: 'Nombre Abreviado es Obligatorio'
          regexp:
            regexp: /^.{0,12}$/
            message: "Nombre Abreviado muy extenso"
      "zona_ordenamiento[unidad_ordenacion_id]":
        validators:
          notEmpty:
            message: 'Unidad de Ordenación es Obligatorio'
      "zona_ordenamiento[ubicacion]" :
        validators:
          notEmpty:
            message: 'Ubicación es obligatorio'
      "zona_ordenamiento[area]":
        validators:
          notEmpty:
            message: 'Area es Obligatorio'
#          regexp:
#            regexp: /^([0-9]*[1-9][0-9]*([\.][0-9]{1,2}){0,1}|[0-9]+\.([1-9]|\d[1-9]))$/
#            message: "No cumple con formato 999999999,99"
      "zona_ordenamiento[usos]":
        validators:
          notEmpty:
            message: 'Uso o Actividades Permitidas es Obligatorio'
          regexp:
            regexp: /^.{0,64}$/
            message: 'Usos debe contener máximo 64 caracteres'

  $('#zona_ordenamiento_area').blur ->
#    $(this).val(parseFloat($(this).val()).toFixed())
#    add_mask($('#zona_ordenamiento_area'))

window.add_mask = (field) ->
  $('#' + field.attr('id')).inputmask 'decimal',
    radixPoint: "."
#    groupSeparator: "."
    digits: 2
    autoGroup: true
    rightAlign: false
    allowMinus: false
    allowPlus: false
#    autoUnmask: true
    onKeyUp: () ->
      $("form").bootstrapValidator('revalidateField', $(this))
#    onUnMask: (maskedValue, unmaskedValue) ->
#      return maskedValue