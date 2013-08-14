"

$(function () {
  $('#benchmark-graph').highcharts({
      title: {
          text: 'Prime Enumerators',
          x: -20 //center
      },
      subtitle: {
          text: 'Performance',
          x: -20
      },
      xAxis: {
          categories: [10, 50, 1000, 10000]
      },
      yAxis: {
          title: {
              text: 'Time (milliseconds)'
          },
          plotLines: [{
              value: 0,
              width: 1,
              color: '#808080'
          }]
      },
      tooltip: {
          valueSuffix: 'milliseconds'
      },
      legend: {
          layout: 'vertical',
          align: 'right',
          verticalAlign: 'middle',
          borderWidth: 0
      },
      series: [{
        
          name: 'PrimeEnumerator::Eratosthenes',
          data: [1, 2, 3]
        
          name: 'PrimeEnumerator::LazyEratosthenes',
          data: [1, 2, 3]
        
          name: 'PrimeEnumerator::CurriedEratosthenes',
          data: [1, 2, 3]
        
          name: 'PrimeEnumerator::TrialDivision',
          data: [1, 2, 3]
        
      }]
  });
});
"
