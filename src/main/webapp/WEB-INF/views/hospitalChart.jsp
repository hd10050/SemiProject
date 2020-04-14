<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#chart_div{
		width: 100%;
		height: 300px;
	}
</style>
</head>
<body>
<jsp:include page="navbar.jsp"/><br/><br/><br/><br/>

		<h1>동물병원 경기도 현황</h1>
		<div id="chart_div"></div>

<script src="resources/js/jquery-3.4.1.min.js"></script>
<script src="//www.amcharts.com/lib/4/core.js"></script>
<script src="//www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script><!-- 차트 움직이는 애니메이션 기능 추가-->

<script>
		$(function() {
			
			$.ajax({
				
				url: "http://192.168.0.186:5000/hospChart",
				type: "post",
				dataType: "json"				
				
			}).done(function(data){
				viewChart(data);
			});
			
				
		});
		
		function viewChart(json_data) {

			am4core.useTheme(am4themes_animated); 
			
			var chart = am4core.create("chart_div", am4charts.XYChart);
			
			chart.data = json_data;
			
				// x축 만들기 
				var categoryAxis = 
				chart.xAxes.push(new am4charts.CategoryAxis());
				categoryAxis.dataFields.category = "sigun";
				
				categoryAxis.renderer.labels.template.fontSize = 12;
				categoryAxis.renderer.minGridDistance = 30;
				
				// y축 만들기
				var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
				
				// Series 만들기
				var series = chart.series.push(new am4charts.ColumnSeries());
				series.dataFields.valueY = "counts";
				series.dataFields.categoryX = "sigun";
				
				series.columns.template.tooltipText = "[bold]{valueY}[/]"; //막대 가리켰을 때 값 뜨게 하기
				//series.columns.template.tooltipText = 	"[bold]{categoryX}[/]";
				series.columns.template.fillOpacity = 0.7; //막대 투명도
				
				var columnTemplate = series.columns.template;
				columnTemplate.strokeWidth = 2; //막대 테두리 두께
				columnTemplate.Width = 7; //막대 테두리 두께
		}
</script>
		
</body>
<jsp:include page="footer.jsp"/>
</html>