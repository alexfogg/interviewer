 $(function(){
  show_chart();
});


function show_chart()
{

  $.ajax({
      dataType: 'json',
      type: "get",
      url: "/users/userchart/"
  }).done(process_activity);

  return false;
}

function process_activity(chartdata)
{
  $('#chart').empty();

  Morris.Line({
    element: 'chart',
    data: chartdata,
    xkey: 'email',
    ykeys: ['name'],
    labels: ['Actual Wait'],
    ymin: 'auto',
    ymax: 'auto'
  });
}
