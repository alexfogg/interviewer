class Home
  @document_ready: ->
    $('#reg_form').on('click', 'a[data-clear-form]', Home.clear_reg_form)

  @clear_reg_form: (e) ->
    e.preventDefault()
    $("#reg_form").remove()

$(document).ready(Home.document_ready)
