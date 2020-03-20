<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		width: 800px;
		border-collapse: collapse;
	}
	table th, table td{
		border: 1px solid black;
		padding: 4px;
	}
</style>
</head>
<body>
	  <input type="hidden" id="type" name="type" value="<%=request.getParameter("type")%>"/>
      <% 
        switch( Integer.parseInt(request.getParameter("type")) ){
	           case 0:
	   %>     	   
					<h1>야생동물 구조치료기관</h1>
						지역명: ${rvo.SIGUN_NM }
						보호소명 : ${rvo.RESCUE_INST_NM }
						전화번호 : ${rvo.RESCUE_INST_TELNO } 
						주소 : ${rvo.REFINE_LOTNO_ADDR }
					<div id="map" style="width:500px;height:400px;"></div>
					
					<input type="hidden" id="r_y" value="${rvo.REFINE_WGS84_LAT }"/>
					<input type="hidden" id="r_x" value="${rvo.REFINE_WGS84_LOGT }"/>
		<% 			
					break;
					
				case 1:
		%>			
					<h1>동물병원</h1>
						지역명: ${hvo.SIGUN_NM }
						보호소명 : ${hvo.BIZPLC_NM }
						전화번호 : ${hvo.LOCPLC_FACLT_TELNO } 
						주소 : ${hvo.REFINE_LOTNO_ADDR }
					<div id="map" style="width:500px;height:400px;"></div>	
					
					<input type="hidden" id="h_y" value="${hvo.REFINE_WGS84_LAT }"/>
					<input type="hidden" id="h_x" value="${hvo.REFINE_WGS84_LOGT }"/>
		<% 		
					break;
					
				case 2:
		%>				
					<h1>동물약국</h1>
						지역명: ${svo.SIGUN_NM }
						보호소명 : ${svo.BIZPLC_NM }
						전화번호 : ${svo.LOCPLC_FACLT_TELNO } 
						주소 : ${svo.REFINE_LOTNO_ADDR }
					<div id="map" style="width:500px;height:400px;"></div>
					
					<input type="hidden" id="s_y" value="${svo.REFINE_WGS84_LAT }"/>
					<input type="hidden" id="s_x" value="${svo.REFINE_WGS84_LOGT }"/>
					
		<%
					break;
		
				default:
		%>				
					<h1>유기동물 보호시설</h1>
						지역명: ${pvo.SIGUN_NM }
						보호소명 : ${pvo.ENTRPS_NM }
						전화번호 : ${pvo.ENTRPS_TELNO } 
						주소 : ${pvo.REFINE_LOTNO_ADDR }
					<div id="map" style="width:500px;height:400px;"></div>
					
					<input type="hidden" id="p_y" value="${pvo.REFINE_WGS84_LAT }"/>
					<input type="hidden" id="p_x" value="${pvo.REFINE_WGS84_LOGT }"/>
		
		<%			
		}
      %>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8d26b23142336a11ee181cc1c827a3ff"></script>
		<script src="resources/js/jquery-3.4.1.min.js"></script>
		<script>
			var container = document.getElementById('map');
			var type = $("#type").val();
			var options = null;
			if(type == 0) {
				options = { 
						center: new kakao.maps.LatLng($("#r_y").val(), $("#r_x").val()), 
						level: 3
				};
			} else if(type == 1) {
				options = { 
						center: new kakao.maps.LatLng($("#h_y").val(), $("#h_x").val()), 
						level: 3
				};
			} else if(type == 2) {
				options = { 
						center: new kakao.maps.LatLng($("#s_y").val(), $("#s_x").val()), 
						level: 3
				};
			} else if(type == 3) {
				options = { 
						center: new kakao.maps.LatLng($("#p_y").val(), $("#p_x").val()), 
						level: 3
				};
			}
			
	
			var map = new kakao.maps.Map(container, options);
			
			// -------------------------------------------------------------------
			
			// 마커를 표시할 위치와 title 객체 배열입니다
			var positions = null;
			if(type == 0) {
				positions = [
				    {
				    	title: '실험', 
				    	latlng: new kakao.maps.LatLng($("#r_y").val(), $("#r_x").val())
				    }
				];
			} else if(type == 1) {
				positions = [
				    {
				    	title: '실험', 
				    	latlng: new kakao.maps.LatLng($("#h_y").val(), $("#h_x").val())
				    }
				];
			} else if(type == 2) {
				positions = [
				    {
				    	title: '실험', 
				    	latlng: new kakao.maps.LatLng($("#s_y").val(), $("#s_x").val())
				    }
				];
			} else if(type == 3) {
				positions = [
				    {
				    	title: '실험', 
				    	latlng: new kakao.maps.LatLng($("#p_y").val(), $("#p_x").val())
				    }
				];
			}
			
			// 마커 이미지의 이미지 주소입니다
			var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			    
			for (var i = 0; i < positions.length; i ++) {
			    
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new kakao.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			    
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng, // 마커를 표시할 위치
			        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage // 마커 이미지 
			    });
			    
			    // 이벤트 ----------------------------------------------------------------
				// 마커에 표시할 인포윈도우를 생성합니다 
			    var infowindow = new kakao.maps.InfoWindow({
			        content: positions[i].title // 인포윈도우에 표시할 내용
			    });
	
			    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			}
			
			// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
			function makeOverListener(map, marker, infowindow) {
			    return function() {
			        infowindow.open(map, marker);
			    };
			}
	
			// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
			function makeOutListener(infowindow) {
			    return function() {
			        infowindow.close();
			    };
			}
		</script>
</body>
</html>