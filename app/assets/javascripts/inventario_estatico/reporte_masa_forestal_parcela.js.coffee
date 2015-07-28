#= require datable
jQuery(document).ready ($) ->

  #HABILITAR O DESHABILITAR SELECT DE ESPECIES Y
  #CHECK BOXES DE GRUPO DE ESPECIE
  if $('#especie_true').is(':checked')
    $('#especie_select').prop('disabled', false);
    $('#table_grupo_especies input[type=checkbox]').attr('disabled','true');
  else
    $('#especie_select').prop('disabled', 'disabled');
    $('#table_grupo_especies input[type=checkbox]').attr('disabled', false);

  $('#especie_true').click ->
    $('#especie_select').prop('disabled', false);
    $('#table_grupo_especies input[type=checkbox]').attr('disabled','true');

  $('#especie_false').click ->
    $('#especie_select').prop('disabled', 'disabled');
    $('#table_grupo_especies input[type=checkbox]').attr('disabled', false);


  $('#procesar_masa_parcela').click ->
    $(this).prop('disabled', 'disabled')
    $('#table_reporte_masa_parcela_div').empty()
    $('#loading_reporte_masa_parcela').show()
    $.ajax
      type: 'POST'
      url: '/inventario_estatico/load_table_masa_parcela'
      dataType: 'HTML'
      data:
        tipo_parcela_inventario_id: $('#tipo_parcela_inventario_select').val()
        especificacion_diametrica: $('#especificacion_diametrica_field').val()
      success: (data) ->
        $('#loading_reporte_masa_parcela').hide()
        $('#table_reporte_masa_parcela_div').empty()
        $('#table_reporte_masa_parcela_div').append(data)
        datatable_dinamico()


datatable_dinamico = ->
  $('#datatable-masa-parcela').dataTable

    'dom': 'T<"clear">lfrtip'
    'tableTools':
      'sSwfPath': '../assets/dataTables/swf/copy_csv_xls_pdf.swf'
      "aButtons": [
        {
          "sExtends":     "copy",
          "sButtonText":  'Copiar &nbsp; <i class="fa fa-files-o"></i>'
        },
        {
          "sExtends":     "csv",
          "sButtonText":  'Excel &nbsp; <i class="fa fa-file-excel-o"></i>'
        },
        {
          "sExtends":         "pdf",
          "sPdfOrientation":  "landscape",
          "sButtonText":      'PDF &nbsp; <i class="fa fa-file-pdf-o"></i>'
        },
        {
          "sExtends":         "print",
          "sPdfOrientation":  "landscape",
          "sButtonText":      'Imprimir &nbsp; <i class="fa fa-print"></i>'
        },
      ]
    "language": {
      "sProcessing":    'Procesando... <i class="fa fa-spinner fa-spin"></i>',
      "sLengthMenu":    "Mostrar _MENU_ Registros",
      "sZeroRecords":   "No se encontraron resultados",
      "sEmptyTable":    "Ningún dato disponible en esta tabla",
      "sInfo":          "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
      "sInfoEmpty":     "Mostrando registros del 0 al 0 de un total de 0 registros",
      "sInfoFiltered":  "(filtrado de un total de _MAX_ registros)",
      "sInfoPostFix":   "",
      "sSearch":        '<i class="fa fa-search"></i> Buscar: ',
      "sUrl":           "",
      "sInfoThousands":  ",",
      "sLoadingRecords": 'Cargando... <i class="fa fa-spinner fa-spin"></i>',
      "oPaginate": {
        "sFirst":    "Primero",
        "sLast":    "Último",
        "sNext":    'Siguiente <i class="fa fa-angle-right"></i>',
        "sPrevious": '<i class="fa fa-angle-left"></i> Anterior'
      },
      "oAria": {
        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
      }
    }

