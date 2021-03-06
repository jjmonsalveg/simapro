#= require moment
#= require bootstrap-datetimepicker
#= require jquery-ui/jquery-ui.js
#= require jquery.appendGrid/jquery.appendGrid-1.5.2.js
#= require moment/es
#= require jquery-validation-1.13.1/jquery.validate
#= require jquery.inputmask/jquery.inputmask.js
#= require jquery.inputmask/jquery.inputmask.regex.extensions

jQuery(document).ready ($) ->

  jQuery.validator.addClassRules( 'nro_cuadricula', {
    required: true,
    number: true,
    minlength: 1,
    maxlength: 1
  });
  jQuery.validator.addClassRules( 'fi', {
    required: true,
    number: true,
    minlength: 1,
    maxlength: 1
  });
  jQuery.validator.addClassRules( 'bi', {
    required: true,
    number: true,
    minlength: 1,
    maxlength: 1
  });
  jQuery.validator.addClassRules( 'nro_arbol', {
    required: true,
    number: true,
    minlength: 1,
    maxlength: 2
  });
  jQuery.validator.addClassRules( 'especie', {
    required: true,
    minlength: 1,
    maxlength: 120
  });
  jQuery.validator.addClassRules( 'dap_cap', {
    required: true,
    number: true,
    minlength: 1,
    maxlength: 4
  });
  jQuery.validator.addClassRules( 'altura_fuste', {
    required: true,
    number: true,
    minlength: 1,
    maxlength: 4
  });

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
  $('#nro_arboles_registrar').inputmask 'Regex',
    regex: '[0-9]{1..3}'

  especies = new Array();
  arboles = new Array();

  $('#tipo_parcela_inventario_select').change ->
    nro_arboles = $('#nro_arboles_registrar').val()
    if ($(this).val() != '') && (nro_arboles != '')
      $('#loading_form_tipo_parcela').show()
      $('#nro_arboles_nulo').hide()
      $.ajax
        type: "POST"
        url: "/mediciones_inventario_estatico/load_tipo_parcela"
        dataType: "HTML"
        data:
          tipo_parcela_inventario: $(this).val()
          parcela_id: $('#parcela_manejo_id').val()
        success: (data) ->
          $('#form_tipo_parcela').empty()
          $('#form_tipo_parcela').append(data)
          datetime_pickers()
          $.ajax
            type: "POST"
            url: "/mediciones_inventario_estatico/load_arboles"
            dataType: "json"
            data:
              parcela_id: $('#parcela_manejo_id').val()
              tipo_parcela_inventario: $('#tipo_parcela_inventario_select').val()
            success: (data) ->
              arboles = data
              $.ajax
                type: "POST"
                url: "/mediciones_inventario_estatico/load_especies"
                dataType: "json"
                data:
                  parcela_id: $('#parcela_manejo_id').val()
                success: (data) ->
                  especies = data
                  form_parcela_submit(especies, arboles, nro_arboles)
    else
      $('#form_tipo_parcela').empty()
      $('#nro_arboles_nulo').show()
      $('#nro_arboles_registrar').focus()


datetime_pickers = ->
  $('#fecha_inicio_datetimepicker').datetimepicker
    locale: 'es'

  $('#fecha_fin_datetimepicker').datetimepicker
    locale: 'es'

form_parcela_submit = (especies,  arboles, nro_arboles) ->

  $('#loading_table_arboles').hide()
  $('#div_table_arboles').show()

  #CREACIÓN DE ARRAY DE ESPECIES QUE VIENEN DE LA TABLA
  nombre_especies = [];
  $.each especies, (index, especie) ->
    nombre_especies.push(especie.nombre_comun)
  nro_arbol_delete = ''
  bi_delete = ''

  #TABLA TIPO EXCEL PARA LA INSERCION DE ARBOLES
  if jQuery.isEmptyObject(arboles)
    $('#table_arboles_inventario').appendGrid
      initRows: nro_arboles,
      columns: [
        {name: 'numero_cuadricula', display: 'Cuad.', type: 'text', ctrlAttr: { maxlength: 4 }, ctrlCss: { width: '70px'}, ctrlClass: 'nro_cuadricula'},
        {name: 'fi', display: 'Fi', type: 'select', ctrlCss: { width: '70px'}, ctrlOptions: { Ba: 'B', La: 'L', Ca: 'C'}, ctrlClass: 'fi'},
        {name: 'nro_arbol', display: 'Árbol', ctrlAttr: { maxlength: 4 }, type: 'text', ctrlCss: { width: '70px'}, ctrlClass: 'nro_arbol'},
        {name: 'bi', display: 'BI', type: 'text', ctrlAttr: { maxlength: 2 }, ctrlCss: { width: '70px'}, ctrlClass: 'bi'},
        {name: 'especie', display: 'Especie', type: 'ui-autocomplete', uiOption: { source: nombre_especies } , ctrlAttr: { maxlength: 120 }, ctrlCss: { width: '300px'}, ctrlClass: 'especie'},
        {name: 'dap_cap', display: 'DAP/CAP', type: 'text', ctrlAttr: { maxlength: 6 }, ctrlCss: { width: '100px'}, ctrlClass: 'dap_cap'},
        {name: 'altura_fuste', display: 'Altura Fuste', ctrlAttr: { maxlength: 6 }, ctrlCss: { width: '100px'}, ctrlClass: 'altura_fuste'},
        {name: 'calidad', display: 'Calidad', type: 'select', ctrlCss: { width: '70px'}, ctrlOptions: { B: 'B', R: 'R', M: 'M'}},
      ]
      hideRowNumColumn: true
      hideButtons:
        removeLast: true
        moveUp: true
        moveDown: true
      beforeRowRemove: (caller, rowIndex) ->
        rowIndex += 1
        nro_arbol_delete = $('#table_arboles_inventario_nro_arbol_' + rowIndex).val()
        bi_delete = $('#table_arboles_inventario_bi_' + rowIndex).val()
        return confirm('¿Está seguro que desea eliminar el árbol?')
      afterRowRemoved: (caller, rowIndex) ->
        remove_tree(nro_arbol_delete, bi_delete);
      afterRowInserted: (caller, parentRowIndex, addedRowIndex) ->
        table_behavior(nombre_especies)
        restricciones_numericas()
        valores_maximos_dap_cap()
  else
    $('#table_arboles_inventario').appendGrid
      initRows: nro_arboles,
      columns: [
        {name: 'numero_cuadricula', display: 'Cuad.', type: 'text', ctrlAttr: { maxlength: 4 }, ctrlCss: { width: '70px'}, ctrlClass: 'nro_cuadricula'},
        {name: 'fi', display: 'Fi', type: 'select', ctrlCss: { width: '70px'}, ctrlOptions: { Ba: 'B', La: 'L', Ca: 'C'}, ctrlClass: 'fi'},
        {name: 'nro_arbol', display: 'Árbol', ctrlAttr: { maxlength: 4 }, type: 'text', ctrlCss: { width: '70px'}, ctrlClass: 'nro_arbol'},
        {name: 'bi', display: 'BI', type: 'text', ctrlAttr: { maxlength: 2 }, ctrlCss: { width: '70px'}, ctrlClass: 'bi'},
        {name: 'especie', display: 'Especie', type: 'ui-autocomplete', uiOption: { source: nombre_especies } , ctrlAttr: { maxlength: 120 }, ctrlCss: { width: '300px'}, ctrlClass: 'especie'},
        {name: 'dap_cap', display: 'DAP/CAP', type: 'text', ctrlAttr: { maxlength: 6 }, ctrlCss: { width: '100px'}, ctrlClass: 'dap_cap'},
        {name: 'altura_fuste', display: 'Altura Fuste', ctrlAttr: { maxlength: 6 }, ctrlCss: { width: '100px'}, ctrlClass: 'altura_fuste'},
        {name: 'calidad', display: 'Calidad', type: 'select', ctrlCss: { width: '70px'}, ctrlOptions: { B: 'B', R: 'R', M: 'M'}},
      ]
      initData: arboles
      hideRowNumColumn: true
      hideButtons:
        removeLast: true
        moveUp: true
        moveDown: true
      beforeRowRemove: (caller, rowIndex) ->
        rowIndex += 1
        nro_arbol_delete = $('#table_arboles_inventario_nro_arbol_' + rowIndex).val()
        bi_delete = $('#table_arboles_inventario_bi_' + rowIndex).val()
        return confirm('¿Está seguro que desea eliminar el árbol?')
      afterRowRemoved: (caller, rowIndex) ->
        remove_tree(nro_arbol_delete, bi_delete);
      afterRowInserted: (caller, parentRowIndex, addedRowIndex) ->
        table_behavior(nombre_especies)
        restricciones_numericas()
        valores_maximos_dap_cap()

  $('#send_form').click ->
    $('#table_arboles_inventario').appendGrid('removeEmptyRows')
    send_form()

  table_behavior(nombre_especies)

  $('.append').click ->
    table_behavior(nombre_especies)


  valores_maximos_dap_cap()

  restricciones_numericas()

  cambio_dap_cap()

send_form = ->
  form = $('#form-parcela-inventario , #form-parcela-inventario-1').serialize()
  $.ajax
    url: '/mediciones_inventario_estatico/save'
    type: 'POST'
    dataType: 'json'
    beforeSend: (xhr) -> xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
    data: form
    success: (data) ->
      setTimeout ->
        toastr.options = {
          closeButton: true,
          progressBar: true,
          showMethod: 'slideDown',
          timeOut: 2000
        };
        if data == 'true'
          toastr.success('Se han guardado los datos con éxito');
        else
          toastr.warning('Ocurrio un error guardando los datos');
        300

table_behavior = (nombre_especies) ->

  #FUNCION PARA PONER EL NUMERO DEL CUADRANTE DEL ARBOL SELECCIONADO EN EL SIGUIENTE ARBOL
  $(".nro_cuadricula").blur ->
    num = $(this).val()
    id_array = $(this).attr('id').split('_')
    row = id_array[id_array.length-1]
    row = parseInt(row) + 1
    if $('#table_arboles_inventario_numero_cuadricula_'+ row ).val() == ''
      $('#table_arboles_inventario_numero_cuadricula_'+ row ).val(num)

  #GUARDAR LA ESPECIE SI NO SE ENCUENTRA Y AGREGARLA AL ARRAY DE AUTOCOMPLETE
  $('.especie').blur ->
    especie = $(this).val()
    unless (jQuery.inArray(especie, nombre_especies) > -1)
      $.ajax
        type: "POST"
        url: "/mediciones_inventario_estatico/save_especie"
        dataType: "JSON"
        data:
          especie: $(this).val()
        success: (data) ->
          nombre_especies.push(especie)

  #PONER ARBOL SIGUIENTE
  $('.bi').blur ->
    id_array = $(this).attr('id').split('_')
    row = parseInt(id_array[id_array.length-1])
    num = parseInt($('#table_arboles_inventario_nro_arbol_' + row ).val())
    row += 1
    if($(this).val() == '1') && ($('#table_arboles_inventario_bi_' + row ).val() == '')
      $('#table_arboles_inventario_nro_arbol_' + row ).val(num)
      $('#table_arboles_inventario_bi_' + row ).val('2')
    if($(this).val() == '0') && ($('#table_arboles_inventario_bi_' + row ).val() == '')
      num += 1
      $('#table_arboles_inventario_nro_arbol_' + row ).val(num)

#ELIMINAR ARBOL
remove_tree = (nro_arbol, bi) ->
  if((nro_arbol != '') && (bi != ''))
    $.ajax
      type: "POST"
      url: "/mediciones_inventario_estatico/delete_arbol_ajax"
      dataType: "JSON"
      data:
        nro_arbol: nro_arbol
        bi: bi
        tipo_parcela: $('#tipo_parcela_inventario_select').val()
        parcela_manejo_id: $('#parcela_manejo_id').val()
      success: (data) ->
        setTimeout ->
          toastr.options = {
            closeButton: true,
            progressBar: true,
            showMethod: 'slideDown',
            timeOut: 2000
          };
          if data == 'true'
            toastr.success('Árbol eliminado con éxito');
          else
            toastr.warning('Ocurrio un error eliminando el árbol');
          300

valores_maximos_dap_cap = ->

  $('.dap_cap').keyup ->
    if $('#parcela_inventario_medicion_parcela_inventario_medicion_dap_true').prop('checked')
      if $(this).val() > 250
        $(this).val 250
    else
      if $(this).val() > 1800
        $(this).val 1800

restricciones_numericas = ->

  $('.dap_cap').inputmask 'Regex',
    regex: '[0-9.]{1..6}'

  $('.altura_fuste').inputmask 'Regex',
    regex: '[0-9.]{1..6}'

  $('.nro_cuadricula').inputmask 'Regex',
    regex: '[0-9]{1..4}'

  $('.nro_arbol').inputmask 'Regex',
    regex: '[0-9]{1..4}'

  $('.bi').inputmask 'Regex',
    regex: '[0-9]'

cambio_dap_cap = ->

  $('#parcela_inventario_medicion_parcela_inventario_medicion_dap_true').click ->
    $(':input[class=dap_cap]').each (index, element) ->
      old_value = $('#' + this.id).val()
      if old_value != ''
        new_value = (old_value / Math.PI).toFixed(2)
      else
        new_value = old_value
      $('#' + this.id).val(new_value)

  $('#parcela_inventario_medicion_parcela_inventario_medicion_dap_false').click ->
    $(':input[class=dap_cap]').each (index, element) ->
      old_value = $('#' + this.id).val()
      if old_value != ''
        new_value = (old_value * Math.PI).toFixed(2)
      else
        new_value = old_value
      $('#' + this.id).val(new_value)
