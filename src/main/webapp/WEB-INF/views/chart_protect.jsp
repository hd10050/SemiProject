<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		#chartdiv{
		width: 100%;
		height: 400px;
	}
</style>
</head>
<body>
<jsp:include page="navbar.jsp"/><br/><br/><br/><br/>
<jsp:include page="top.jsp"/>
	<h1>유기 동물 보호 시설 현황</h1>
	<div id="chartdiv"></div>
	
<!-- Resources -->
<script src="resources/js/jquery-3.4.1.min.js"></script>	
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<!-- Chart code -->
<script>

	$(function() {
		   
		   $.ajax({
		      
		      url: "http://192.168.0.186:5000/protect",
		      type: "post",
		      dataType: "json"            
		      
		   }).done(function(data){
		      viewChart(data);
		   });
		   
		      
		});

function viewChart(json_data) {
	
	var chart = am4core.create("chartdiv", am4charts.XYChart3D);
	
	chart.data = json_data;
	
	let categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
	categoryAxis.dataFields.category = "sigun";
	categoryAxis.renderer.labels.template.rotation = 270;
	categoryAxis.renderer.labels.template.hideOversized = false;
	categoryAxis.renderer.minGridDistance = 20;
	categoryAxis.renderer.labels.template.horizontalCenter = "right";
	categoryAxis.renderer.labels.template.verticalCenter = "middle";
	categoryAxis.tooltip.label.rotation = 270;
	categoryAxis.tooltip.label.horizontalCenter = "right";
	categoryAxis.tooltip.label.verticalCenter = "middle";

	let valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
	valueAxis.title.text = "시군별";
	valueAxis.title.fontWeight = "Verdana";

	// Create series
	var series = chart.series.push(new am4charts.ColumnSeries3D());
	series.dataFields.valueY = "counts";
	series.dataFields.categoryX = "sigun";
	series.name = "counts";
	series.tooltipText = "{categoryX}: [Verdana]{valueY}[/]";
	series.columns.template.fillOpacity = .8;

	var columnTemplate = series.columns.template;
	columnTemplate.strokeWidth = 2;
	columnTemplate.strokeOpacity = 1;
	columnTemplate.stroke = am4core.color("#FFFFFF");

	columnTemplate.adapter.add("fill", function(fill, target) {
	  return chart.colors.getIndex(target.dataItem.index);
});

}

 // end am4core.ready()
</script>
</body>
<jsp:include page="footer.jsp"/>
</html>





