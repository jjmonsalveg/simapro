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
#= require jquery-ui/jquery-ui.js
#= require jquery.appendGrid/jquery.appendGrid-1.5.2.js
#= require moment
#= require moment/es
#= require jquery-validation-1.13.1/jquery.validate
#= require jquery.inputmask/jquery.inputmask.js
#= require jquery.inputmask/jquery.inputmask.regex.extensions

jQuery(document).ready ($) ->

  $('#reporte_form').bootstrapValidator
    feedbackIcons:
      valid: 'fa fa-check ',
      invalid: 'fa fa-times',
      validating: 'fa fa-refresh'
    live: 'enable'
    fields:
      "especificacion_diametrica":
        validators:
          notEmpty:
            message: 'Debe introducir una Especificación Diametrica'
          greaterThan:
            inclusive: true
            value: 0
            message: 'Especificación Diametrica mayor a 0'
      "parcela":
        validators:
          notEmpty:
            message: 'Debe seleccionar una opción'

  $('#send_form').attr("disabled", $('#parcela').val()=="")

  $('#tipo_inventario').change ->
    console.log("tipoinventario")
    $.ajax
      type: "POST"
      url: "reporte_masa_forestalx_criterio/find_parcelas_por_tipo_inventario"
      dataType: "json"
      data:
        tipo_inventario_id: $(this).val()
      success: (data) ->
        console.log("success")
        $('#parcela').empty().append new Option('Seleccione un bloque', '')
        $.each data, (i, row)->
          console.log("success each")
          $('#parcela').append new Option(row.azimut, row.id)
        return

  $('#parcela').change ->
    $('#send_form').attr("disabled", $('#parcela').val()=="")


  $('#send_form').click ->
    load_masa_forestal($('#tipo_inventario').val(), $('#parcela').val(), $('#especificacion_diametrica').val(), $('input[name=criterio]:checked').val())

load_masa_forestal = (tipo_inventario, parcela, especificacion_diametrica, criterio) ->
  $.ajax
    type: "POST"
    url: "reporte_masa_forestalx_criterio/procesar"
    dataType: "json"
    data:
      tipo_inventario_id: tipo_inventario
      parcela_id: parcela
      especificacion_diametrica_val: especificacion_diametrica
      tipo_criterio: criterio
    success: (data) ->
      console.log(data)
      t = $('#table_reporte').DataTable()
      t.rows().remove()
      for data_each in data
        console.log(data_each)
#        data_e = JSON.parse(data_each)
#        console.log(data_e)
        t.row.add( [
          data_each[0],
          data_each[1]
          data_each[2],
          data_each[3],
          data_each[4]
        ] ).draw()
#      $('#table_reporte_body').empty().append(data)
      return

