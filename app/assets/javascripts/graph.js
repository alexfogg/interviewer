 $(function(){
  show_chart();
});


function show_chart()
{

  $.ajax({
      dataType: 'json',
      type: "get",
      url: "/userchart/"
  }).done(process_activity);

}

function process_activity(chartdata)
{
  $('#chart').empty();

  Morris.Line({
    element: 'chart',
    data: chartdata,
    xkey: 'date',
    ykeys: ['num_right'],
    labels: ['Scores'],
    ymin: 'auto',
    ymax: 'auto'
  });
}
