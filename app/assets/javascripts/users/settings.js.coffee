#= require jquery-dynamic-selectable-unidad-manejo
jQuery(document).ready ($) ->
  $('select[data-dynamic-selectable-url][data-dynamic-selectable-target]').dynamicSelectable();

  $('#guardar-subcuenca-usuario').click ->
    $.ajax
      type: "POST"
      url: "/save_subcuenca"
      dataType: "JSON"
      data:
        id: $('#settings_subcuenca').val()
      success: (data) ->
        console.log(data)