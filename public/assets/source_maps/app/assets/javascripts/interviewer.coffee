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
    a = $(this).parent().children('input:checked')  #gets the array, c is answer ids
    interview_id = parseInt($('.q').first().attr('data-interview-id'))
    console.log(interview_id)
    token = $('#show').data('auth-token')
    c = []
    progress_id = $('.progress').text()
    (a).each (idx, el) ->
      c.push $(this).attr("data-answer-id")
    settings =
      datatype: 'json'
      data: {authenticity_token: token, answer_ids: c, progress_id: progress_id}
      type: "get"
      url: "/progresses/#{interview_id}"
    $.ajax(settings)
$(document).ready(app.document_ready)


