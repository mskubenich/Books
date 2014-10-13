$ ->
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

$ -> 
  # Create the chart
  $("#container1").highcharts
    chart:
      type: "pie"

    title:
      text: "Browser statistics"

    yAxis:
      title:
        text: "Total percent market share"

    plotOptions:
      pie:
        shadow: false
        center: [
          "50%"
          "50%"
        ]

    tooltip:
      valueSuffix: "%"

    series: [
      {
        name: "Browsers"
        data: gon.browsers
        size: "60%"
        dataLabels:
          formatter: ->
            (if @y > 5 then @point.name else null)

          color: "white"
          distance: -30
      }
      {
        name: "Versions"
        data: gon.browsers
        size: "80%"
        innerSize: "60%"
        dataLabels:
          formatter: ->
            
            # display only if larger than 1
            (if @y > 1 then "<b>" + @point.name + ":</b> " + @y + "%" else null)
      }
    ]

$ ->  
  # Create the chart
  $("#container2").highcharts
    chart:
      type: "pie"

    title:
      text: "Chart the type of operating system"

    yAxis:
      title:
        text: "Total percent market share"

    plotOptions:
      pie:
        shadow: false
        center: [
          "50%"
          "50%"
        ]

    tooltip:
      valueSuffix: "%"

    series: [
      {
        name: "Browsers"
        data: gon.os
        size: "60%"
        dataLabels:
          formatter: ->
            (if @y > 5 then @point.name else null)

          color: "white"
          distance: -30
      }
      {
        name: "Versions"
        data: gon.os
        size: "80%"
        innerSize: "60%"
        dataLabels:
          formatter: ->
            
            # display only if larger than 1
            (if @y > 1 then "<b>" + @point.name + ":</b> " + @y + "%" else null)
      }
    ]

$ ->
  # Create the chart
  $("#container3").highcharts
    chart:
      type: "pie"

    title:
      text: "Device statistics"

    yAxis:
      title:
        text: "Total percent market share"

    plotOptions:
      pie:
        shadow: false
        center: [
          "50%"
          "50%"
        ]

    tooltip:
      valueSuffix: "%"

    series: [
      {
        name: "Browsers"
        data: gon.devices
        size: "60%"
        dataLabels:
          formatter: ->
            (if @y > 5 then @point.name else null)

          color: "white"
          distance: -30
      }
      {
        name: "Versions"
        data: gon.devices
        size: "80%"
        innerSize: "60%"
        dataLabels:
          formatter: ->
            
            # display only if larger than 1
            (if @y > 1 then "<b>" + @point.name + ":</b> " + @y + "%" else null)
      }
    ]

  return
