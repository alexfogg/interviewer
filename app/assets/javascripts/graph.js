 $(function(){
  show_chart();
  show_chart2();
});

function show_chart()
{
  $.ajax({
      dataType: 'json',
      type: "get",
      url: "/userchart/"
  }).done(process_activity);

function show_chart2()
{
  $.ajax({
      dataType: 'json',
      type: "get",
      url: "/interviewchart/"
  }).done(process_activity2);

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

function process_activity2(chartdata2)
{
  $('#interviewchart').empty();

  Morris.Line({
    element: 'chart',
    data: chartdata2,
    xkey: 'date',
    ykeys: ['num_right'],
    labels: ['Scores'],
    ymin: 'auto',
    ymax: 'auto'
  });
}
