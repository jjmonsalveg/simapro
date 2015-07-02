#= require moment
#= require bootstrap-datetimepicker
#= require moment/es

jQuery(document).ready ($) ->

  $('#bloque_manejo').change ->
    if $(this).val() != ''
      $('#loading_parcela').show()
      $.ajax
        type: "POST"
        url: "/mediciones_inventario_estatico/select_parcela_inventario"
        dataType: "HTML"
        data:
          bloque_manejo_id: $(this).val()
        success: (data) ->
          $('#parcela_inventario_medicion').empty()
          $('#parcela_inventario_medicion').append(data)
          load_formulario()
    else
      $('#parcela_inventario_medicion').empty()


load_formulario = ->
  $('#parcela_manejo_select').change ->
    if $(this).val() != ''
      $('#loading_formulario').show()

      $.ajax
        type: "POST"
        url: "/mediciones_inventario_estatico/load_form"
        dataType: "HTML"
        data:
          parcela_id: $(this).val()
        success: (data) ->
          $('#form_parcela').empty()
          $('#form_parcela').append(data)
          load_tipo_parcela()
    else
      $('#form_parcela').empty()

load_tipo_parcela = ->
  $('#tipo_parcela_inventario_select').change ->
    if $(this).val() != ''
      $('#loading_form_tipo_parcela').show()
      $.ajax
        type: "POST"
        url: "/mediciones_inventario_estatico/load_form"
        dataType: "HTML"
        data:
          parcela_id: $(this).val()
        success: (data) ->
          $('#form_parcela').empty()
          $('#form_parcela').append(data)
    else
      $('#form_tipo_parcela').empty()

datetime_pickers = ->
  $('#fecha_inicio_datetimepicker').datetimepicker
    viewMode: 'months',
    locale: 'es'

  $('#fecha_fin_datetimepicker').datetimepicker
    viewMode: 'months',
    locale: 'es'