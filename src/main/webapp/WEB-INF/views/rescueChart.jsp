<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#chartdiv {
  width: 100%;
  height: 600px;
}
</style>
</head>

<body style="margin: 0px;">
<jsp:include page="navbar.jsp"/><br/><br/><br/>
		<!-- HTML -->
		<h1>야생동물 보호기관 경기도 현황</h1>
		<div id="chartdiv"></div>
		
<!-- Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
<script src="resources/js/jquery-3.4.1.min.js"></script>

<!-- Chart code -->
<script>

$(function() {
	
	$.ajax({
		
		url: "http://192.168.0.186:5000/rescueChart",
		type: "post",
		dataType: "json"				
		
	}).done(function(data){
		viewChart(data);
	});
	
		
	});

function viewChart(json_data) {

	var chart = am4core.create("chartdiv", am4charts.RadarChart);
	
	chart.data = json_data;
	
	chart.innerRadius = am4core.percent(40)
	
	var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
	categoryAxis.renderer.grid.template.location = 0;
	categoryAxis.dataFields.category = "sigun";
	categoryAxis.renderer.minGridDistance = 60;
	categoryAxis.renderer.inversed = true;
	categoryAxis.renderer.labels.template.location = 0.5;
	categoryAxis.renderer.grid.template.strokeOpacity = 0.08;
	
	var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
	valueAxis.min = 0;
	valueAxis.extraMax = 0.1;
	valueAxis.renderer.grid.template.strokeOpacity = 0.08;
	
	chart.seriesContainer.zIndex = -10;
	
	
	var series = chart.series.push(new am4charts.RadarColumnSeries());
	series.dataFields.categoryX = "sigun";
	series.dataFields.valueY = "counts";
	series.tooltipText = "{valueY.value}"
	series.columns.template.strokeOpacity = 0;
	series.columns.template.radarColumn.cornerRadius = 5;
	series.columns.template.radarColumn.innerCornerRadius = 0;
	
	chart.zoomOutButton.disabled = true;
	
	// as by default columns of the same series are of the same color, we add adapter which takes colors from chart.colors color set
	series.columns.template.adapter.add("fill", (fill, target) => {
	 return chart.colors.getIndex(target.dataItem.index);
	});
	
	setInterval(()=>{
		 am4core.array.each(chart.data, (item)=>{
		 })
		 chart.invalidateRawData();
		}, 2000)
	
	categoryAxis.sortBySeries = series;
	
	chart.cursor = new am4charts.RadarCursor();
	chart.cursor.behavior = "none";
	chart.cursor.lineX.disabled = true;
	chart.cursor.lineY.disabled = true;

}
</script>
	
	
</body>
</html>