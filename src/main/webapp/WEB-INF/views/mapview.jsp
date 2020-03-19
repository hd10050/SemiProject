<%@page import="com.data.vo.ProtectVO"%>
<%@page import="com.data.vo.StoreVO"%>
<%@page import="com.data.vo.HospitalVO"%>
<%@page import="com.data.vo.RescueVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="button" value="야생동물 구조 치료기관" onclick="load(0)"/>
	<input type="button" value="동물병원" onclick="load(1)"/>
	<input type="button" value="동물약국" onclick="load(2)"/> 
	<input type="button" value="유기동물 보호시설" onclick="load(3)"/> 
	<div id="map" style="width:500px;height:400px;"></div>
	<p>${length }개의 데이터</p>
	
	<script>
		function load(type) {
			document.location.href="marker.inc?s_type=" + type;
		}
	</script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8d26b23142336a11ee181cc1c827a3ff"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.26718595, 127.0312471),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		
		// -------------------------------------------------------------------
		
		// 마커를 표시할 위치와 title 객체 배열입니다
		var positions = [
			    
			    	<%
			    	Object obj = session.getAttribute("ar");
			    	if(request.getAttribute("type").equals("0")) {
			    		RescueVO[] ar = (RescueVO[])obj;
				    	for(int i = 0 ; i < ar.length ; i++) {%>
				    		{
					    		title: '<%=ar[i].getRESCUE_INST_NM()%>', 
						    	latlng: new kakao.maps.LatLng('<%=ar[i].getREFINE_WGS84_LAT()%>', '<%=ar[i].getREFINE_WGS84_LOGT()%>')
				    		}
				    <%		if(i != ar.length-1) { %>
				    		,			
			    	<%		}	
				   		}
				    	
			    	} else if(request.getAttribute("type").equals("1")) {
			    		HospitalVO[] ar = (HospitalVO[])obj;
			    		for(int i = 0 ; i < ar.length ; i++) {%>
			    		{
				    		title: '<%=ar[i].getBIZPLC_NM()%>', 
					    	latlng: new kakao.maps.LatLng('<%=ar[i].getREFINE_WGS84_LAT()%>', '<%=ar[i].getREFINE_WGS84_LOGT()%>')
			    		}
			    <%			if(i != ar.length-1) { %>
			    			,			
		    		<%		}	
			   			}
			    	} else if(request.getAttribute("type").equals("2")) {
			    		StoreVO[] ar = (StoreVO[])obj;
			    		for(int i = 0 ; i < ar.length ; i++) {%>
			    		{
				    		title: '<%=ar[i].getBIZPLC_NM()%>', 
					    	latlng: new kakao.maps.LatLng('<%=ar[i].getREFINE_WGS84_LAT()%>', '<%=ar[i].getREFINE_WGS84_LOGT()%>')
			    		}
			    <%		if(i != ar.length-1) { %>
				    		,			
			    	<%		}	
				   		}
			    	} else if(request.getAttribute("type").equals("3")) {
			    		ProtectVO[] ar = (ProtectVO[])obj;
			    		for(int i = 0 ; i < ar.length ; i++) {%>
			    		{
				    		title: '<%=ar[i].getENTRPS_NM()%>', 
					    	latlng: new kakao.maps.LatLng('<%=ar[i].getREFINE_WGS84_LAT()%>', '<%=ar[i].getREFINE_WGS84_LOGT()%>')
			    		}
			    <%		if(i != ar.length-1) { %>
				    		,			
			    	<%		}	
				   		}
			    	}
			    	%>
			    	
			    
		];
		
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