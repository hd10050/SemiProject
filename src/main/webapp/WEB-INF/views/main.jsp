<%@page import="com.data.vo.ProtectVO"%>
<%@page import="com.data.vo.StoreVO"%>
<%@page import="com.data.vo.HospitalVO"%>
<%@page import="com.data.vo.RescueVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<link rel="stylesheet" href="resources/css/page.css"/>

<link type="text/css" rel="stylesheet" href="resources/css/main.css"/>

<!-- Nav -->
  <!-- Bootstrap core CSS -->
  <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="resources/css/modern-business.css" rel="stylesheet">

<style type="text/css">
	.navbar-menu{
		padding-left:30px;
		font-size: 16px;
		background-color: transparent;
		color: white;
		border: none;
	}
</style>
  
</head>
  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="main.inc" style="font-size: 20px; padding-top: 6px;">Home</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <input type="button" value="야생동물 구조치료기관" onclick="bbs(0)" class="navbar-menu"/>
          </li>
          <li class="nav-item">
            <input type="button" value="동물 병원" onclick="bbs(1)" class="navbar-menu" />
          </li>
          <li class="nav-item">
            <input type="button" value="동물 약국" onclick="bbs(2)" class="navbar-menu"/>
          </li>
           <li class="nav-item">
            <input type="button" value="유기 동물 보호시설" onclick="bbs(3)" class="navbar-menu"/>
            
          </li>
        </ul>
      </div>
      
    </div>
  </nav>
  
<body style="padding-top: 80px;">
<header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url('resources/css/images/main1.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>First Slide</h3>
            <p>This is a description for the first slide.</p>
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('resources/css/images/main2.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>Second Slide</h3>
            <p>This is a description for the second slide.</p>
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('resources/css/images/main3.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>Third Slide</h3>
            <p>This is a description for the third slide.</p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header>



   
   <div id="wrap">
   
   <%-- 
   <div id="mainImage" class="col-sm-12 pull-center well" >
        메인 이미지 넣기 
      <h1>이미지 </h1>
   </div>
   --%>
   
   
   <div id="search" class="col-sm-12 pull-center well" >
   <form class="form-inline">
      <select name="searchSelect" id="searchSelect" class="form-control">   
         <option value=""> 지역</option>
         <option value=""> 시설명</option>
        </select>
        <input type="text"  class="form-control" size="20" name="searchValue" id="searchValue"/>
        <input type="button" value="검색" id="searchbt" class="btn btn-default" onclick="search()"/>
   </form>
   
  	 <div id = "buttons"> 
	       <input type="button" value="야생동물 구조치료기관" onclick="bbs(0)" class="btn btn-xs btn-primary"/>
		   <input type="button" value="동물 병원" onclick="bbs(1)" class="btn btn-xs btn-primary"/>
		   <input type="button" value="동물 약국" onclick="bbs(2)" class="btn btn-xs btn-primary"/>
		   <input type="button" value="유기 동물 보호시설" onclick="bbs(3)" class="btn btn-xs btn-primary"/>
      </div> 
   </div>
   
   <div id ="list" class="col-sm-12 pull-center well" >
   		<%-- 지도 --%>
   		<%if(request.getAttribute("chk").equals("1")){ %>
   			<div id="map" style="width:500px;height:400px;"></div>
   		<%} %>
   <table>
      <colgroup>
         <col width="66px"/>
         <col width="165px"/>
         <col width="*"/>
         <col width="105px"/>
      </colgroup>


      <%--야생동물 구조치료기관 --%>
      <%if(request.getAttribute("type").equals("0")) {
      		RescueVO[] ar = (RescueVO[])session.getAttribute("ar");%>
      <thead>   
         <tr>
            <th>지역</th>
            <th>기관명</th>
            <th>주소</th>
            <th>전화번호</th>
         </tr>
      </thead>   
      <tbody>
      <c:forEach var="vo" items="${ar}">
         <tr>
            <td>${vo.SIGUN_NM}</td>
            <td><a href="view.inc?RESCUE_INST_TELNO=${vo.RESCUE_INST_TELNO}&type=${requestScope.type}">${vo.RESCUE_INST_NM}</a></td>
            <td>${vo.REFINE_LOTNO_ADDR}</td>
            <td>${vo.RESCUE_INST_TELNO}</td>
         </tr>
      </c:forEach>
      </tbody>
      <%-- 동물병원 --%>
      <%}else if(request.getAttribute("type").equals("1")) {
    	  HospitalVO[] ar = (HospitalVO[])session.getAttribute("ar");%>
      <thead>   
         <tr>
            <th>지역</th>
            <th>병원명</th>
            <th>주소</th>
            <th>전화번호</th>
         </tr>
      </thead>     
      <tbody>
      <c:forEach var="vo" items="${ar}">
         <tr>
            <td>${vo.SIGUN_NM}</td>
            <td><a href="view.inc?LOCPLC_FACLT_TELNO=${vo.LOCPLC_FACLT_TELNO}&type=${requestScope.type}">${vo.BIZPLC_NM}</a></td>
            <td>${vo.REFINE_LOTNO_ADDR}</td>
            <td>${vo.LOCPLC_FACLT_TELNO}</td>
         </tr>
      </c:forEach>      
         </tbody>      
      
      <%-- 동물약국 --%>   
      <%}else if(request.getAttribute("type").equals("2")) { 
    	  StoreVO[] ar = (StoreVO[])session.getAttribute("ar");%>
      <thead>   
         <tr>
            <th>지역</th>
            <th>약국명</th>
            <th>주소</th>
            <th>전화번호</th>
         </tr>
      </thead>   
      <tbody>
      <c:forEach var="vo" items="${ar}">
         <tr>
            <td>${vo.SIGUN_NM}</td>
            <td><a href="view.inc?LOCPLC_FACLT_TELNO=${vo.LOCPLC_FACLT_TELNO}&type=${requestScope.type}">${vo.BIZPLC_NM}</a></td>
            <td>${vo.REFINE_LOTNO_ADDR}</td>
            <td>${vo.LOCPLC_FACLT_TELNO}</td>
         </tr>
      </c:forEach>      
         </tbody>      
      
      <%-- 유기 동물 보호시설  --%>   
      <%}else if(request.getAttribute("type").equals("3")) { 
    	  ProtectVO[] ar = (ProtectVO[])session.getAttribute("ar");%>
      <thead>   
         <tr>
            <th>지역</th>
            <th>기관명</th>
            <th>주소</th>
            <th>전화번호</th>
         </tr>
      </thead>   
      <tbody>
      <c:forEach var="vo" items="${ar}">
         <tr>
            <td>${vo.SIGUN_NM}</td>
            <td><a href="view.inc?ENTRPS_TELNO=${vo.ENTRPS_TELNO}&type=${requestScope.type}">${vo.ENTRPS_NM}</a></td>
            <td>${vo.REFINE_LOTNO_ADDR}</td>
            <td>${vo.ENTRPS_TELNO}</td>
         </tr>
      </c:forEach>
 
         </tbody>  
  
             
      <% }%>
	
         <tfoot id="tfoot">
         	 <tr>
         	 	<td colspan="4">
      		${pageCode }
      			</td>
      		</tr>		
     
         </tfoot>
      
        
   </table>
   </div> 
   </div>
	
	<form action="search.inc" method="post" name="search_form">
		<input type="hidden" id="search_value" name="search_value"/>
		<input type="hidden" id="search_type" name="search_type"/>
		<input type="hidden" name="s_type" value='<%=request.getAttribute("type")%>'/>
	</form>
  	
  	
  	  <!-- Bootstrap core JavaScript -->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  	
  	
  	
   <script src="resources/js/jquery-3.4.1.min.js"></script>
   <script>
   		function bbs(type) {
			document.location.href="main.inc?s_type=" + type;
		}
   		
		function search() {
			var val = $("#searchValue").val();
			var index = $("#searchSelect option").index($("#searchSelect option:selected"));
			if(val.trim().length < 1) {
				alert("검색값을 입력해주세요.");
				return;
			}
			$("#search_type").attr('value', index);
			$("#search_value").attr('value', val);
			search_form.submit();
		}
   </script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8d26b23142336a11ee181cc1c827a3ff"></script>
   <script>
			var container = document.getElementById('map');
			var type = $("#type").val();
			var options = null;
				options = { 
						center: new kakao.maps.LatLng(37.26718595, 127.0312471), 
						level: 10
				};
			var map = new kakao.maps.Map(container, options);
			
			// -------------------------------------------------------------------
			
			// 마커를 표시할 위치와 title 객체 배열입니다
			var positions = [
				<%Object obj = session.getAttribute("ar");
				if (request.getAttribute("type").equals("0")) {
					RescueVO[] ar = (RescueVO[]) obj;
					for (int i = 0; i < ar.length; i++) {%>
					    		{
						    		title: '<%=ar[i].getRESCUE_INST_NM()%>', 
							    	latlng: new kakao.maps.LatLng('<%=ar[i].getREFINE_WGS84_LAT()%>', '<%=ar[i].getREFINE_WGS84_LOGT()%>')
					    		}
					    <%if (i != ar.length - 1) {%>
					    		,			
				    	<%}
					}
	
				} else if (request.getAttribute("type").equals("1")) {
					HospitalVO[] ar = (HospitalVO[]) obj;
					for (int i = 0; i < ar.length; i++) {%>
				    		{
					    		title: '<%=ar[i].getBIZPLC_NM()%>', 
						    	latlng: new kakao.maps.LatLng('<%=ar[i].getREFINE_WGS84_LAT()%>', '<%=ar[i].getREFINE_WGS84_LOGT()%>')
				    		}
				    <%if (i != ar.length - 1) {%>
				    			,			
			    		<%}
					}
				} else if (request.getAttribute("type").equals("2")) {
					StoreVO[] ar = (StoreVO[]) obj;
					for (int i = 0; i < ar.length; i++) {%>
				    		{
					    		title: '<%=ar[i].getBIZPLC_NM()%>', 
						    	latlng: new kakao.maps.LatLng('<%=ar[i].getREFINE_WGS84_LAT()%>', '<%=ar[i].getREFINE_WGS84_LOGT()%>')
				    		}
				    <%if (i != ar.length - 1) {%>
					    		,			
				    	<%}
					}
				} else if (request.getAttribute("type").equals("3")) {
					ProtectVO[] ar = (ProtectVO[]) obj;
					for (int i = 0; i < ar.length; i++) {%>
				    		{
					    		title: '<%=ar[i].getENTRPS_NM()%>', 
						    	latlng: new kakao.maps.LatLng('<%=ar[i].getREFINE_WGS84_LAT()%>', '<%=ar[i].getREFINE_WGS84_LOGT()%>')
				    		}
				    <%if (i != ar.length - 1) {%>
					    		,			
				    	<%}
					}
				}%>
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