<%@page import="com.data.vo.MemberVO"%>
<%@page import="com.data.vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/jquery-ui.min.css"/>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style type="text/css">
/*****************textarea************/

.panel-shadow {
    box-shadow: rgba(0, 0, 0, 0.3) 7px 7px 7px;
}
.panel-white {
  border: 1px solid #dddddd;
}
.panel-white  .panel-heading {
  color: #333;
  background-color: #fff;
  border-color: #ddd;
}
.panel-white  .panel-footer {
  background-color: #fff;
  border-color: #ddd;
}

.post .post-heading {
  height: 95px;
  padding: 20px 15px;
}
.post .post-heading .avatar {
  width: 60px;
  height: 60px;
  display: block;
  margin-right: 15px;
}
.post .post-heading .meta .title {
  margin-bottom: 0;
}
.post .post-heading .meta .title a {
  color: black;
}
.post .post-heading .meta .title a:hover {
  color: #aaaaaa;
}
.post .post-heading .meta .time {
  margin-top: 8px;
  color: #999;
}
.post .post-image .image {
  width: 100%;
  height: auto;
}
.post .post-description {
  padding: 15px;
}
.post .post-description p {
  font-size: 14px;
}
.post .post-description .stats {
  margin-top: 20px;
}
.post .post-description .stats .stat-item {
  display: inline-block;
  margin-right: 15px;
}
.post .post-description .stats .stat-item .icon {
  margin-right: 8px;
}
.post .post-footer {
  border-top: 1px solid #ddd;
  padding: 15px;
}
.post .post-footer .input-group-addon a {
  color: #454545;
}
.post .post-footer .comments-list {
  padding: 0;
  margin-top: 20px;
  list-style-type: none;
}
.post .post-footer .comments-list .comment {
  display: block;
  width: 100%;
  margin: 20px 0;
}
.post .post-footer .comments-list .comment .avatar {
  width: 35px;
  height: 35px;
}
.post .post-footer .comments-list .comment .comment-heading {
  display: block;
  width: 100%;
}
.post .post-footer .comments-list .comment .comment-heading .user {
  font-size: 14px;
  font-weight: bold;
  display: inline;
  margin-top: 0;
  margin-right: 10px;
}
.post .post-footer .comments-list .comment .comment-heading .time {
  font-size: 12px;
  color: #aaa;
  margin-top: 0;
  display: inline;
}
.post .post-footer .comments-list .comment .comment-body {
  margin-left: 50px;
}
.post .post-footer .comments-list .comment > .comments-list {
  margin-left: 50px;
}
/*****************rating**************/
*{
    margin: 0;
    padding: 0;
}
.rate {
    float: left;
    height: 46px;
    padding: 0 10px;
}
.rate:not(:checked) > input {
    position:absolute;
    top:-9999px;
}
.rate:not(:checked) > label {
    float:right;
    width:1em;
    overflow:hidden;
    white-space:nowrap;
    cursor:pointer;
    font-size:30px;
    color:#ccc;
}
.rate:not(:checked) > label:before {
    content: '★ ';
}
.rate > input:checked ~ label {
    color: #ffc700;    
}
.rate:not(:checked) > label:hover,
.rate:not(:checked) > label:hover ~ label {
    color: #deb217;  
}
.rate > input:checked + label:hover,
.rate > input:checked + label:hover ~ label,
.rate > input:checked ~ label:hover,
.rate > input:checked ~ label:hover ~ label,
.rate > label:hover ~ input:checked ~ label {
    color: #c59b08;
}
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
<jsp:include page="navbar.jsp"/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<div class="container">
		<div class="card">
			<div class="container-fliud">
			
				<div id="wrapper row" class="wrapper row">
				
					<div class="preview col-md-6">
						<div class="preview-pic tab-content">
							<%  String b_idx = (String)request.getAttribute("b_idx");
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
		
<%-- 리뷰 -----------------------------------------------------------------------------------%>
<%
	ReviewVO[] r_ar = null;
	int total = 0;
	float avg = 0;
	if(request.getAttribute("review_ar") != null ){
		r_ar = (ReviewVO[])request.getAttribute("review_ar");
		for(int i = 0 ; i < r_ar.length ; i++) {
			total += Integer.parseInt(r_ar[i].getR_score());
			System.out.println(total);
		}
		if(r_ar.length > 0) {
			avg = (float)total / r_ar.length;
		}
	}
%>
	<div style="margin-left: 90px">
		<h3>평점</h3>
		<h1><%=(Math.round(avg*100)/100.0) %>점</h1>
	</div>
<%
	Object obj = session.getAttribute("mvo");
	MemberVO mvo = null; 
	if(obj != null) {
		mvo = (MemberVO)session.getAttribute("mvo");
	}
	// (String b_idx)
%>

		<hr/>
		<form action="r_write.inc" method="post" name="r_write">
				<div class="rate" style="margin-left: 80px;">
				    <input type="radio" id="score5" name="r_score" value="5" />
				    <label for="score5" title="text">5 stars</label>
				    <input type="radio" id="score4" name="r_score" value="4" />
				    <label for="score4" title="text">4 stars</label>
				    <input type="radio" id="score3" name="r_score" value="3" />
				    <label for="score3" title="text">3 stars</label>
				    <input type="radio" id="score2" name="r_score" value="2" />
				    <label for="score2" title="text">2 stars</label>
				    <input type="radio" id="score1" name="r_score" value="1" />
				    <label for="score1" title="text">1 star</label>
				</div>
			<div><br/><br/><br/>
				<input class="form-control" name="r_content" id="r_content" placeholder="Add a comment" type="text" style="width: 500px; margin-left: 90px;"/>
				<br/>
				<%
						if(mvo != null) {
				%>
							<input type="hidden" name="m_idx" value='<%=mvo.getM_idx()%>'/>
							<input type="hidden" name="type" value="<%=request.getParameter("type")%>"/>
							<input type="hidden" name="b_idx" value='<%=b_idx%>'/>
							<button type=button class="btn btn-primary" onclick="ans_write()" style="margin-left: 90px">작성</button>
				<%
						} else {
				%>			
							<button type=button class="btn btn-primary" onclick="alert('로그인 후 이용해 주세요');" style="margin-left: 30px">작성</button>
				<%
						}
				%>
			</div>
		</form>
		<br/>
<%
	if(r_ar != null ){
%>
		<ul class="comments-list">
<%
		for(int i = 0 ; i < r_ar.length ; i++) {
%>
			<hr/>
			<li class="comment">
			<form id="edit_frm<%=i%>" action="r_edit.inc" method="post">
				<div class="comment-body" style="margin-left: 100px">
					<div class="comment-heading">
						<h4 class="user"><%=r_ar[i].getMvo().getM_name() %></h4>
						<h5 class="time"><%=r_ar[i].getR_date() %></h5>
						<h5 class="user">평점 : <%=r_ar[i].getR_score() %></h6>
					</div>
					<p id="content<%=i%>"><%=r_ar[i].getR_content() %></p>
				<input type="hidden" name="r_idx" value='<%=r_ar[i].getR_idx() %>'/>
				<input type="hidden" name="type" value="<%=request.getParameter("type")%>"/>
				<input type="hidden" name="b_idx" value='<%=r_ar[i].getB_idx() %>'/>
<%			if(mvo != null && r_ar[i].getMvo().getM_idx().equals(mvo.getM_idx())) { %>
				<button type=button class="btn btn-primary" id="ans_edit<%=i%>" onclick="ans_edit('<%=i%>', '<%=r_ar[i].getR_idx()%>', this.form)">수정</button>
				<button type=button class="btn btn-danger" id="ans_del<%=i%>" onclick="ans_del('<%=r_ar[i].getR_idx() %>','<%=r_ar[i].getB_idx()%>', '<%=request.getParameter("type")%>')">삭제</button>
<%			} else {
				if(mvo != null && (mvo.getM_level().equals("1") || mvo.getM_level().equals("2"))) { %>
					<button type=button class="btn btn-danger" id="ans_del<%=i%>" onclick="ans_del('<%=r_ar[i].getR_idx() %>','<%=r_ar[i].getB_idx()%>', '<%=request.getParameter("type")%>')">삭제</button>					
<%				}
			}%>
			</div>
			</form>
			</li>
<%
		}
%>
			</ui>
<%
	}
%>
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
			
			<%------------------------------------------------------------%>
			function ans_write() {
				if($(':radio[name="r_score"]:checked').length < 1){
				    alert('평점을 선택해주세요');                        
				    return;
				}
				if ($("#r_content").val().trim().length < 1) {
					alert("내용을 입력하세요");
					return;
				}
				
				r_write.submit();
			}

			function ans_del(r_idx, b_idx, type){
				if (!(confirm('정말 삭제하시겠습니까?'))) {
					return;
				}

				var Param ="r_idx="+encodeURIComponent(r_idx);
				$.ajax({
					url: "r_del.inc",
					type: "post",
					data: Param,
					dataType:"json"
				}).done(function(data){
					if(data.value == "1"){
						if(type == "0") {
							location.href = "view.inc?type=0&RESCUE_INST_TELNO=" + b_idx;
						} else if(type == "1") {
							location.href = "view.inc?type=1&LOCPLC_FACLT_TELNO=" + b_idx;
						} else if(type == "2") {
							location.href = "view.inc?type=2&LOCPLC_FACLT_TELNO=" + b_idx;
						} else if(type == "3") {
							location.href = "view.inc?type=3&ENTRPS_TELNO=" + b_idx;
						}
					} else {
						alert("댓글삭제 실패");
					}
				}).fail(function(err){
					console.log(err)
				});
			}

			function ans_edit(num, r_idx, frm){
				var content = $("#content"+num).html();
				$("#content"+num).html("<textarea rows='5' cols='90' name='content'>" + content + "</textarea>");
				$("#ans_edit"+num).attr("onclick", "ans_editok("+ num +")", frm);
			}

			function ans_editok(num){
				var frm = $("#edit_frm"+num);
				frm.submit();
			}
		</script>
</body>
</html>