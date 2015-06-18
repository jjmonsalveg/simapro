#= require datable
#= require bootstrapValidator/bootstrapValidator
#= require input-mask/jquery.inputmask.js
#= require input-mask/jquery.inputmask.regex.extensions.js
#= require cocoon

jQuery(document).ready ($) ->

  $('#bloque_manejo_area').inputmask("Regex", {
    regex: "[0-9.]{1,9}%"
  });