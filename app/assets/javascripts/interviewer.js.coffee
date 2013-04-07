# class Home
#   @document_ready: ->
#     $('#reg_form').on('click', 'a[data-clear-form]', Home.clear_reg_form)
#     $('.top-bar-section').on('click', '.login', Home.show_reg_form)
#     $('body').on('keyup', '#search', Home.filter_interviews)
#   @clear_reg_form: (e) ->
#     e.preventDefault()
#     $("#reg_form").hide()
#   @show_reg_form: (e) ->
#     e.preventDefault()
#     $("#reg_form").show()
#   @filter_interviews: (e) ->
#     query = $('#search').val()
#     settings =
#       dataType: 'script'
#       type: 'get'
#       url: "/interviews/search?query=#{query}"
#     $.ajax(settings)

window.app =
  document_ready: ->
    $('#reg_form').on('click', 'a[data-clear-form]', app.clear_reg_form)
    $('.top-bar-section').on('click', '.login', app.show_reg_form)
    $('body').on('keyup', '#searchinterview', app.filter_interviews)
    # $('body').on('keyup', '#search', app.filter_interviews) ## add filter interviews
    $('body').on('token', '.stripe-button', app.token_generated)
  token_generated: (e, token) ->
    e.preventDefault()
    $(this).siblings('form').append("<input type=hidden name=token value=#{token.id}>").submit()
    console.log(token)
  clear_reg_form: (e) ->
    e.preventDefault()
    $("#reg_form").hide()
  show_reg_form: (e) ->
    e.preventDefault()
    $("#reg_form").show()
  filter_interviews: (e) ->
    query = $('#searchinterview').val()
    settings =
      dataType: 'script'
      type: 'get'
      url: "/interviews/search?query=#{query}"
    $.ajax(settings)
$(document).ready(app.document_ready)
