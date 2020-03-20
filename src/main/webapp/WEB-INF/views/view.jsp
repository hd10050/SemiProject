<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/jquery-ui.min.css"/>
<style type="text/css">
	
/*****************globals*************/
	body {
	  font-family: 'open sans';
	  overflow-x: hidden; }
	
	img {
	  max-width: 100%; }
	
	.preview {
	  display: -webkit-box;
	  display: -webkit-flex;
	  display: -ms-flexbox;
	  display: flex;
	  -webkit-box-orient: vertical;
	  -webkit-box-direction: normal;
	  -webkit-flex-direction: column;
	      -ms-flex-direction: column;
	          flex-direction: column; }
	  @media screen and (max-width: 996px) {
	    .preview {
	      margin-bottom: 20px; } }
	
	.preview-pic {
	  -webkit-box-flex: 1;
	  -webkit-flex-grow: 1;
	      -ms-flex-positive: 1;
	          flex-grow: 1; }
	
	.preview-thumbnail.nav-tabs {
	  border: none;
	  margin-top: 15px; }
	  .preview-thumbnail.nav-tabs li {
	    width: 18%;
	    margin-right: 2.5%; }
	    .preview-thumbnail.nav-tabs li img {
	      max-width: 100%;
	      display: block; }
	    .preview-thumbnail.nav-tabs li a {
	      padding: 0;
	      margin: 0; }
	    .preview-thumbnail.nav-tabs li:last-of-type {
	      margin-right: 0; }
	
	.tab-content {
	  overflow: hidden; }
	  .tab-content img {
	    width: 100%;
	    -webkit-animation-name: opacity;
	            animation-name: opacity;
	    -webkit-animation-duration: .3s;
	            animation-duration: .3s; }
	
	.card {
	  margin-top: 130px;
	  background: #eee;
	  padding: 3em;
	  line-height: 1.5em;
	 }
	
	@media screen and (min-width: 997px) {
	  .wrapper {
	    display: -webkit-box;
	    display: -webkit-flex;
	    display: -ms-flexbox;
	    display: flex; } }
	
	.details {
	  display: -webkit-box;
	  display: -webkit-flex;
	  display: -ms-flexbox;
	  display: flex;
	  -webkit-box-orient: vertical;
	  -webkit-box-direction: normal;
	  -webkit-flex-direction: column;
	      -ms-flex-direction: column;
	          flex-direction: column; }
	
	.colors {
	  -webkit-box-flex: 1;
	  -webkit-flex-grow: 1;
	      -ms-flex-positive: 1;
	          flex-grow: 1; }
	
	.product-title, .price, .sizes, .colors {
	  text-transform: UPPERCASE;
	  font-weight: bold; }
	
	.checked, .price span {
	  color: #ff9f1a; }
	
	.product-title, .rating, .product-description, .price, .vote, .sizes {
	  margin-bottom: 15px; }
	
	.product-title {
	  margin-top: 0; }
	
	.size {
	  margin-right: 10px; }
	  .size:first-of-type {
	    margin-left: 40px; }
	
	.color {
	  display: inline-block;
	  vertical-align: middle;
	  margin-right: 10px;
	  height: 2em;
	  width: 2em;
	  border-radius: 2px; }
	  .color:first-of-type {
	    margin-left: 20px; }
	
	.add-to-cart, .like {
	  background: #ff9f1a;
	  padding: 1.2em 1.5em;
	  border: none;
	  text-transform: UPPERCASE;
	  font-weight: bold;
	  color: #fff;
	  -webkit-transition: background .3s ease;
	          transition: background .3s ease; }
	  .add-to-cart:hover, .like:hover {
	    background: #b36800;
	    color: #fff; }
	
	.not-available {
	  text-align: center;
	  line-height: 2em; }
	  .not-available:before {
	    font-family: fontawesome;
	    content: "\f00d";
	    color: #fff; }
	
	.orange {
	  background: #ff9f1a; }
	
	.green {
	  background: #85ad00; }
	
	.blue {
	  background: #0076ad; }
	
	.tooltip-inner {
	  padding: 1.3em; }
	
	@-webkit-keyframes opacity {
	  0% {
	    opacity: 0;
	    -webkit-transform: scale(3);
	            transform: scale(3); }
	  100% {
	    opacity: 1;
	    -webkit-transform: scale(1);
	            transform: scale(1); } }
	
	@keyframes opacity {
	  0% {
	    opacity: 0;
	    -webkit-transform: scale(3);
	            transform: scale(3); }
	  100% {
	    opacity: 1;
	    -webkit-transform: scale(1);
	            transform: scale(1); } }        
	 #map{
	 	display: none;
	 }  
	 #pic-1{
	 	padding-left: 400px;
	 }
	 #detail{
	 	padding-left: 100px;
	 	padding-top: 100px;
	 }
	 .action{
	 	padding-top: 20px;
	 }
	
	/*# sourceMappingURL=style.css.map */
</style>
</head>
<body>
	<div class="container">
		<div class="card">
			<div class="container-fliud">
			
				<div id="wrapper row" class="wrapper row">
				
					<div class="preview col-md-6">
						<div class="preview-pic tab-content">
							<% 
						        switch( Integer.parseInt(request.getParameter("type")) ){
							           case 0:
							 %>     
						  		<div class="tab-pane active" id="pic-1"><img src="resources/css/images/threecuties.jpg" /></div>
						    <% 			
										break;
											
										case 1:
							%>
								<div class="tab-pane active" id="pic-1"><img src="resources/css/images/twocuties.jpg" /></div>
							<% 		
										break;
											
										case 2:
							%>	
								<div class="tab-pane active" id="pic-1"><img src="resources/css/images/dog.jpg" /></div>
							<%
										break;
								
										default:
							%>
								<div class="tab-pane active" id="pic-1"><img src="resources/css/images/cat.png" /></div>
							<%			
								}
						     %>
						</div>
					</div>
					
					<div class="details col-md-6" id="detail">
					
							  <input type="hidden" id="type" name="type" value="<%=request.getParameter("type")%>"/>
						      <% 
						        switch( Integer.parseInt(request.getParameter("type")) ){
							           case 0:
							   %>     	   
											<h3 class="product-title">야생동물 구조치료기관</h3>
												<h4 class="price">지역명: <span>${rvo.SIGUN_NM }</span></h4>
												<h4 class="price">보호소명 : ${rvo.RESCUE_INST_NM }</h4>
												<h4 class="price">전화번호 : ${rvo.RESCUE_INST_TELNO } </h4>
												<h4 class="price">주소 : ${rvo.REFINE_LOTNO_ADDR }</h4>
											<div id="map" style="width:500px;height:400px;"></div>
											
											<input type="hidden" id="r_y" value="${rvo.REFINE_WGS84_LAT }"/>
											<input type="hidden" id="r_x" value="${rvo.REFINE_WGS84_LOGT }"/>
											<input type="hidden" id="r_name" value="${rvo.RESCUE_INST_NM }"/>
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
											<input type="hidden" id="h_name" value="${hvo.BIZPLC_NM }"/>
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
											<input type="hidden" id="s_name" value="${svo.BIZPLC_NM }"/>
											
								<%
											break;
								
										default:
								%>				
											<h1>유기동물 보호시설</h1>
												지역명: ${pvo.SIGUN_NM }
												보호소명 : ${pvo.ENTRPS_NM }
												전화번호 : ${pvo.ENTRPS_TELNO } 
												주소 : ${pvo.REFINE_LOTNO_ADDR }
											<div id="map" ></div>
											
											<input type="hidden" id="p_y" value="${pvo.REFINE_WGS84_LAT }"/>
											<input type="hidden" id="p_x" value="${pvo.REFINE_WGS84_LOGT }"/>
											<input type="hidden" id="p_name" value="${pvo.ENTRPS_NM }"/>
								
								<%			
								 }
						         %>
      				
      						<div class="action">
								<button class="add-to-cart btn btn-default" type="button" id="list_btn">목록으로</button>
								<button class="add-to-cart btn btn-default" type="button" id="map_btn">지도</button>
							</div>
							
      					</div>
      					
	      			</div>
	      			
				</div>
			</div>
		</div>
      
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8d26b23142336a11ee181cc1c827a3ff"></script>
		<script src="resources/js/jquery-3.4.1.min.js"></script>
		<script src="resources/js/jquery-ui.min.js"></script>
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
			
			$("#map_btn").click(function () {
				$("#map").dialog({width: 500, height: 400 });
				$("#map").css("display", "block");
			});	
			
			$("#list_btn").click(function () {
				location.href="main.inc";
			});	
		</script>
</body>
</html>