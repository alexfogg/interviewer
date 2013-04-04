class Home
  @document_ready: ->
    $('#reg_form').on('click', 'a[data-clear-form]', Home.clear_reg_form)
    $('.top-bar-section').on('click', '.login', Home.show_reg_form)
  @clear_reg_form: (e) ->
    e.preventDefault()
    $("#reg_form").hide()
  @show_reg_form: (e) ->
    e.preventDefault()
    $("#reg_form").show()
$(document).ready(Home.document_ready)
