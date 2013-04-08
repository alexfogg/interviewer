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
    $('.submitAnswer').click(app.submit)
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
  submit: (e) ->
    a = $(this).parent().children('input:checked')  #gets the array
    console.log(a.first().attr('data-answer-id'))
    b= _.pluck(a, attr('data-answer-id'));
    console.log(b[0]) # i can't do ajax calls unless I get the array of ids.

$(document).ready(app.document_ready)
