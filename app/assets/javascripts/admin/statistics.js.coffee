$ ->
  #Create the chart
  if gon? && gon.visits?
    $("#container").highcharts "StockChart",
      rangeSelector:
        selected: 1
        inputEnabled: $("#container").width() > 480

      title:
        text: "Visitor Statistics"

      series: [
          name: "VS"
          data: gon.visits
          tooltip:
            valueDecimals: 2
      ]
