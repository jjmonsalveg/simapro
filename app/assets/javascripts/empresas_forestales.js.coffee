# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require input-mask/jquery.inputmask.js
#= require input-mask/jquery.inputmask.regex.extensions.js
#= require bootstrapValidator/bootstrapValidator
#= require datable
#= require jquery-fileupload
#= require document_upload
#= require lightbox/js/lightbox.min.js

jQuery(document).ready ($) ->
  $("#form_empresa_forestal").bind "submit", ->
    $(this).find(":input").removeAttr "disabled"
    return

  calcular_area_inventario = ->
    ancho=$('#empresa_forestal_parcela_inv_ancho').val()
    long=$('#empresa_forestal_parcela_inv_long').val()
    $('#empresa_forestal_area_parcela_inv').val(ancho * long)

  $('#empresa_forestal_parcela_inv_long').on 'change', ->
    calcular_area_inventario()

  $('#empresa_forestal_parcela_inv_ancho').on 'change', ->
    calcular_area_inventario()



  calcular_area_cuadricula_inventario = ->
    ancho=$('#empresa_forestal_cuadricula_inv_ancho').val()
    long=$('#empresa_forestal_cuadricula_inv_long').val()
    $('#empresa_forestal_area_cuadricula_inv').val(ancho * long)

  $('#empresa_forestal_cuadricula_inv_long').on 'change', ->
    calcular_area_cuadricula_inventario()

  $('#empresa_forestal_cuadricula_inv_ancho').on 'change', ->
    calcular_area_cuadricula_inventario()


  $("#empresa_forestal_parcela_manejo_long").inputmask "9999999",
    placeholder: ""
  $("#empresa_forestal_parcela_manejo_ancho").inputmask "9999999",
    placeholder: ""
  $("#empresa_forestal_parcela_inv_long").inputmask "9999999",
    placeholder: ""
  $("#empresa_forestal_parcela_inv_ancho").inputmask "9999999",
    placeholder: ""
  $("#empresa_forestal_cuadricula_inv_long").inputmask "9999999",
    placeholder: ""
  $("#empresa_forestal_cuadricula_inv_ancho").inputmask "9999999",
    placeholder: ""
  $("#empresa_forestal_rif").inputmask("Regex", {regex: "^[VEJPG]-(([0-9]{0,2}[0-9]{1,3}[0-9]{3})|([0-9]{0,3}[0-9]{3})|([0-9]{3}))[0-9]$"})


  $('#form_empresa_forestal').bootstrapValidator
    feedbackIcons:
      valid: 'fa fa-check ',
      invalid: 'fa fa-times',
      validating: 'fa fa-refresh'
    live: 'enable'
    fields:
      "empresa_forestal[rif]":
        validators:
          notEmpty:
            message: 'Rif es Obligatorio'
          regexp:
            regexp: /^[VEJPG]-(([0-9]{0,2}[0-9]{1,3}[0-9]{3})|([0-9]{0,3}[0-9]{3})|([0-9]{3}))[0-9]$/
            message: "Rif debe cumplir con formato p.e: V-9999999999"