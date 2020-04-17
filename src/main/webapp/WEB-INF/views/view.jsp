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
<link rel="stylesheet" href="resources/css/bootstrap.min.css" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style type="text/css">

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

/*********total**********/
.container{
	width: 1000px; 
	border-top: 5px solid rgba(40,99,134, 0.8);
	border-bottom: 5px solid rgba(40,99,134, 0.8);
	padding: 50px 0;
}
.images{
	width: 370px; 
	margin-bottom: 50px; 
	margin-top: 25px;
	padding-left: 50px;
}
table td{
	padding: 15px 10px;;
	border: 1px solid rgba(119, 136, 153, 0.3);
}
table td:nth-child(1){
	padding-left: 10px;
	background: rgba(0, 139, 139,0.4);
}
table td:nth-child(2){
	padding-left: 30px;
	background: #fff;
}
table span{
	font-size: 15px;
}
table tr td:nth-child(1) span{
	font-weight: bold;
}
.images {
    animation: fadein 2s;
    -moz-animation: fadein 2s;
    /* Firefox */
    -webkit-animation: fadein 2s;
    /* Safari and Chrome */
    -o-animation: fadein 2s;
    /* Opera */
}

@keyframes fadein {
    from {
        opacity: 0;
    }

    to {
        opacity: 1;
    }
}

@-moz-keyframes fadein {

    /* Firefox */
    from {
        opacity: 0;
    }

    to {
        opacity: 1;
    }
}

@-webkit-keyframes fadein {

    /* Safari and Chrome */
    from {
        opacity: 0;
    }

    to {
        opacity: 1;
    }
}

@-o-keyframes fadein {

    /* Opera */
    from {
        opacity: 0;
    }

    to {
        opacity: 1;
    }
}
.product-title{
	font-weight: bold; 
	padding-left: 80px;
}
.details123 hr{
	margin-left: 50px;
}
table{
	margin-left: 80px;
	width: 450px;
}
.action{
	width:70px; 
	padding-left: 450px;
}
.details123{
	flex: 1;
}
.detail123{
	margin-top: 60px; 
	margin-left: 50px;
}
.wrapper{
	width:100%; 
	margin-bottom: 70px; 
	display: flex; 
}
.review{
	margin-bottom: 50px;
}
</style>
</head>
<body>
<jsp:include page="navbar.jsp"/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<div class="container"><!-- 가장 바깥 테두리 -->
		<hr style="color: rgba(40,99,134, 0.8);"/>
			<div id="wrapper" class="wrapper" ><!-- 이미지+상세설명 -->
			
					<div class="images"><!-- 이미지 -->
							<%  String b_idx = (String)request.getAttribute("b_idx");
						        switch( Integer.parseInt(request.getParameter("type")) ){
							           case 0:
							 %>
						  		<img src="resources/css/images/three.png" />
						    <% 			
										break;
											
										case 1:
							%>
								<img src="resources/css/images/two.png" />
							<% 		
										break;
											
										case 2:
							%>	
								<img src="resources/css/images/dog.png" />
							<%
										break;
								
										default:
							%>
								<img src="resources/css/images/cat.png" style="width: 370px; height: 340px;"/>
							<%			
								}
						     %>
					</div>
					
							
					<div class="details123" id="details123"><!-- 상세설명 -->
							<div class="detail123">
							  <input type="hidden" id="type" name="type" value="<%=request.getParameter("type")%>" />
						      <% 
						        switch( Integer.parseInt(request.getParameter("type")) ){
							           case 0:
							   %>     	   
							   				<h1 class="product-title"><img alt="icon" src="resources/css/images/icon.png"></img>
											${rvo.RESCUE_INST_NM }</h1><br/><hr/><br/>
												<table>
													<tr>
														<td>
															<span>지역명</span>
														</td>
														<td>
															<span>${rvo.SIGUN_NM }</span>
														</td>
													</tr>
													<tr>
														<td>
															<span>전화번호</span>
														</td>
														<td>
															<span>${rvo.RESCUE_INST_TELNO }</span>
														</td>
													</tr>
													<tr>
														<td>
															<span>주소</span>
														</td>
														<td>
															<span>${rvo.REFINE_LOTNO_ADDR }</span>
														</td>
													</tr>
												</table>
											
											<input type="hidden" id="r_y" value="${rvo.REFINE_WGS84_LAT }"/>
											<input type="hidden" id="r_x" value="${rvo.REFINE_WGS84_LOGT }"/>
											<input type="hidden" id="r_name" value="${rvo.RESCUE_INST_NM }"/>
								<%			
											break;
											
										case 1:
								%>			
												<h1 class="product-title"><img alt="icon" src="resources/css/images/icon.png"></img>
												 ${hvo.BIZPLC_NM }</h1><br/><hr/><br/>
												<table>
													<tr>
														<td>
															<span>지역명</span>
														</td>
														<td>
															<span>${hvo.SIGUN_NM }</span>
														</td>
													</tr>
													<tr>
														<td>
															<span>전화번호</span>
														</td>
														<td>
															<span>${hvo.LOCPLC_FACLT_TELNO }</span>
														</td>
													</tr>
													<tr>
														<td>
															<span>주소</span>
														</td>
														<td>
															<span>${hvo.REFINE_LOTNO_ADDR }</span>
														</td>
													</tr>
												</table>
											
											<input type="hidden" id="h_y" value="${hvo.REFINE_WGS84_LAT }"/>
											<input type="hidden" id="h_x" value="${hvo.REFINE_WGS84_LOGT }"/>
											<input type="hidden" id="h_name" value="${hvo.BIZPLC_NM }"/>
								<% 		
											break;
											
										case 2:
								%>				
											<h1 class="product-title"><img alt="icon" src="resources/css/images/icon.png"></img>
											${svo.BIZPLC_NM }</h1><br/><hr/><br/>
												<table>
													<tr>
														<td>
															<span>지역명</span>
														</td>
														<td>
															<span> ${svo.SIGUN_NM }</span>
														</td>
													</tr>
													<tr>
														<td>
															<span>전화번호</span>
														</td>
														<td>
															<span>${svo.LOCPLC_FACLT_TELNO }</span>
														</td>
													</tr>
													<tr>
														<td>
															<span>주소</span>
														</td>
														<td>
															<span>${svo.REFINE_LOTNO_ADDR }</span>
														</td>
													</tr>
												</table>
											
											<input type="hidden" id="s_y" value="${svo.REFINE_WGS84_LAT }"/>
											<input type="hidden" id="s_x" value="${svo.REFINE_WGS84_LOGT }"/>
											<input type="hidden" id="s_name" value="${svo.BIZPLC_NM }"/>
											
								<%
											break;
								
										default:
								%>				
											<h1 class="product-title"><img alt="icon" src="resources/css/images/icon.png"></img>
											${pvo.ENTRPS_NM }</h1><br/><hr/><br/>
												<table>
													<tr>
														<td>
															<span>지역명</span>
														</td>
														<td>
															<span>${pvo.SIGUN_NM }</span>
														</td>
													</tr>
													<tr>
														<td>
															<span>전화번호</span>
														</td>
														<td>
															<span>${pvo.ENTRPS_TELNO }</span>
														</td>
													</tr>
													<tr>
														<td>
															<span>주소</span>
														</td>
														<td>
															<span>${pvo.REFINE_LOTNO_ADDR }</span>
														</td>
													</tr>
												</table>
											
											
											<input type="hidden" id="p_y" value="${pvo.REFINE_WGS84_LAT }"/>
											<input type="hidden" id="p_x" value="${pvo.REFINE_WGS84_LOGT }"/>
											<input type="hidden" id="p_name" value="${pvo.ENTRPS_NM }"/>
								<%			
								 }
						         %>
      				
      						<div class="action" >
								<button class="Tolist" type="button" id="Tolist" style="margin-top:20px; width: 70px; height: 40px; font-size: 12px; border-radius: 5px;">목록으로</button>
							</div>
							</div>
							
							
      					</div>
      					
					</div>
	      			
	      			
				<div id="map" style="width:998px;height:400px; margin-bottom: 150px;"></div>
	
		
<%-- 리뷰 -----------------------------------------------------------------------------------%>
<div class="review">
<%	
	boolean isAdd = false;
	Object obj = session.getAttribute("mvo");
	MemberVO mvo = null; 
	if(obj != null) {
		mvo = (MemberVO)session.getAttribute("mvo");
	}

	ReviewVO[] r_ar = null;
	int total = 0;
	float avg = 0;
	if(request.getAttribute("review_ar") != null ){
		r_ar = (ReviewVO[])request.getAttribute("review_ar");
		for(int i = 0 ; i < r_ar.length ; i++) {
			total += Integer.parseInt(r_ar[i].getR_score());
			if(!(isAdd) && mvo != null && r_ar[i].getMvo().getM_idx().equals(mvo.getM_idx())) {
				isAdd = true;
			}
		}
		if(r_ar.length > 0) {
			avg = (float)total / r_ar.length;
		}
	}
%>

	<div style="margin-left: 90px">
		<h1>평균 평점</h1><h2><%=(Math.round(avg*100)/100.0) %>점</h2>
	</div>

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
						if(isAdd) {
				%>
							<button type=button class="btn btn-primary" onclick="alert('리뷰는 한번만 등록할 수 있습니다.');" style="margin-left: 90px">작성</button>
				<%
						} else if(mvo != null) {
				%>
							<input type="hidden" name="m_idx" value='<%=mvo.getM_idx()%>'/>
							<input type="hidden" name="type" value="<%=request.getParameter("type")%>"/>
							<input type="hidden" name="b_idx" value='<%=b_idx%>'/>
							<button type=button class="btn btn-primary" onclick="ans_write()" style="margin-left: 90px">작성</button>
				<%
						} else {				
				%>			
							<button type=button class="btn btn-primary" onclick="alert('로그인 후 이용해 주세요');" style="margin-left: 90px">작성</button>
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
			<li class="comment" style="list-style: none;">
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
			</div>
			<hr/>
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
				    	latlng: new kakao.maps.LatLng($("#r_y").val(), $("#r_x").val())
				    }
				];
			} else if(type == 1) {
				positions = [
				    {
				    	latlng: new kakao.maps.LatLng($("#h_y").val(), $("#h_x").val())
				    }
				];
			} else if(type == 2) {
				positions = [
				    {
				    	latlng: new kakao.maps.LatLng($("#s_y").val(), $("#s_x").val())
				    }
				];
			} else if(type == 3) {
				positions = [
				    {
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
			
			<%--
			$("#map_btn").click(function () {
				$("#map").dialog({width: 500, height: 400 });
				$("#map").css("display", "block");
			});	
			--%>
			$("#Tolist").click(function () {
				location.href="reviewBbs.inc?nowPage=" + ${nowPage}+"&s_type="+${type};
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
<jsp:include page="footer.jsp"/>
</html>