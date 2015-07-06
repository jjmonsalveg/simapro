# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
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
  add_mask($('#unidad_ordenacion_area'))

  $('#form_unidad_ordenacion').bootstrapValidator
    feedbackIcons:
      valid: 'fa fa-check ',
      invalid: 'fa fa-times',
      validating: 'fa fa-refresh'
    live: 'enable'
    fields:
      "unidad_ordenacion[nombre]":
        validators:
          notEmpty:
            message: 'Nombre es Obligatorio'
          regexp:
            regexp: /^.{0,64}$/
            message: "Nombre muy extenso"
      "unidad_ordenacion[codigo]":
        validators:
          notEmpty:
            message: 'Código es Obligatorio'
          stringLength:
            max: 3
            message: 'Por favor ingrese menos de %s caracteres'
      "unidad_ordenacion[reserva_forestal_id]":
        validators:
          notEmpty:
            message: 'Reserva Forestal es Obligatorio'
      "unidad_ordenacion[ubicacion]" :
        validators:
          notEmpty:
            message: 'Ubicación es obligatorio'
      "unidad_ordenacion[area]":
        validators:
          notEmpty:
            message: 'Area es Obligatorio'
#          regexp:
#            regexp: /^([0-9]*[1-9][0-9]*([\.][0-9]{1,2}){0,1}|[0-9]+\.([1-9]|\d[1-9]))$/
#            message: "No cumple con formato 999999999,99"
      "unidad_ordenacion[nro_contrato]":
        validators:
          notEmpty:
            message: 'Uso o Actividades Permitidas es Obligatorio'
          stringLength:
            max: 16
            message: 'Por favor ingrese menos de %s caracteres'

  $('#unidad_ordenacion_area').blur ->
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