#= require moment
#= require bootstrap-datetimepicker
#= require jquery-ui/jquery-ui.js
#= require jquery.appendGrid/jquery.appendGrid-1.5.2.js
#= require moment/es
#= require jquery-validation-1.13.1/jquery.validate

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

  especies = new Array();

  $('#tipo_parcela_inventario_select').change ->
    if $(this).val() != ''
      $('#loading_form_tipo_parcela').show()
      $.ajax
        type: "POST"
        url: "/mediciones_inventario_estatico/load_tipo_parcela"
        dataType: "HTML"
        data:
          tipo_parcela_inventario: $(this).val()
          parcela_id: $('#parcela_inventario_id').val()
        success: (data) ->
          $('#form_tipo_parcela').empty()
          $('#form_tipo_parcela').append(data)
          datetime_pickers()
          $.ajax
            type: "POST"
            url: "/mediciones_inventario_estatico/load_especies"
            dataType: "json"
            data:
              parcela_id: $('#parcela_inventario_id').val()
            success: (data) ->
              especies = data
              form_parcela_submit(especies)
    else
      $('#form_tipo_parcela').empty()

datetime_pickers = ->
  $('#fecha_inicio_datetimepicker').datetimepicker
    viewMode: 'months',
    locale: 'es'

  $('#fecha_fin_datetimepicker').datetimepicker
    viewMode: 'months',
    locale: 'es'

form_parcela_submit = (especies) ->

  nombre_especies = [];
  $.each especies, (index, especie) ->
    nombre_especies.push(especie.nombre_comun)

  $('#table_arboles_inventario').appendGrid
    initRows: 20,
    columns: [
      {name: 'numero_cuadricula', display: 'Cuad.', type: 'text', ctrlCss: { width: '70px'}, ctrlClass: 'nro_cuadricula'},
      {name: 'fi', display: 'Fi', type: 'text', ctrlCss: { width: '70px'}, ctrlClass: 'fi'},
      {name: 'nro_arbol', display: 'Árbol', type: 'text', ctrlCss: { width: '70px'}, ctrlClass: 'nro_arbol'},
      {name: 'bi', display: 'BI', type: 'text', ctrlCss: { width: '70px'}, ctrlClass: 'bi'},
      {name: 'especie', display: 'Especie', type: 'ui-autocomplete', uiOption: { source: nombre_especies } , ctrlCss: { width: '300px'}, ctrlClass: 'especie'},
      {name: 'dap_cap', display: 'CAP/DAP', type: 'text', ctrlCss: { width: '100px'}, ctrlClass: 'dap_cap'},
      {name: 'altura_fuste', display: 'Altura Fuste', ctrlCss: { width: '100px'}, ctrlClass: 'altura_fuste'},
      {name: 'calidad', display: 'Calidad', type: 'select', ctrlCss: { width: '100px'}, ctrlOptions: { 0: 'B', 1: 'R', 2: 'M'}},
    ]
    hideRowNumColumn: true
    hideButtons:
      removeLast: true

  jQuery.validator.addClassRules({
    nro_cuadricula:
      required: true,
      number: true,
      minlength: 1,
      maxlength: 1
    fi:
      required: true,
      number: true,
      minlength: 1,
      maxlength: 1
    bi:
      required: true,
      number: true,
      minlength: 1,
      maxlength: 1
    nro_arbol:
      required: true,
      number: true,
      minlength: 1,
      maxlength: 2
    especie:
      required: true,
      minlength: 1,
      maxlength: 120
    dap_cap:
      required: true,
      number: true,
      minlength: 1,
      maxlength: 4
    altura_fuste:
      required: true,
      number: true,
      minlength: 1,
      maxlength: 4
  });

  $('#send_form').click ->
    console.log(document.forms[1])
    $('#table_arboles_inventario').appendGrid('removeEmptyRows')
    $(document.forms[1]).validate
      errorLabelContainer: '#ulError',
      wrapper: 'li',
      submitHandler:
        send_form()


send_form = ->
  form = $('#form-parcela-inventario , #form-parcela-inventario-1').serialize()
  console.log(form)
  $.ajax
    url: '/mediciones_inventario_estatico/save'
    type: 'POST'
    dataType: 'json'
    beforeSend: (xhr) -> xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
    data: form
    success: (data) ->
      console.log("HOLA")
      console.log(data)