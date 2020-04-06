<%@page import="com.data.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<link rel="stylesheet" href="resources/css/navbar.css">
<style>

</style>
</head>
<body>
	<!-- 첫번째 회원정보 -->
	<div class="nanavbar_top">     
<%
	
	Object obj_vo = session.getAttribute("mvo");
		MemberVO mvo = (MemberVO)obj_vo;	
	
		if(obj_vo != null){
%>          
				
		    <span class="nanav_menu_t"><%=mvo.getM_name() %>님 환영합니다.</span>
		    <input type="button" value="내정보" onclick="location.href='myPage.inc'" class="nanav_menu_t"/> 
		    <input type="button" value="로그아웃" onclick="logout()" class="nanav_menu_t"/> 
<%
		}else{
%>		  
		    <input type="button" value="회원가입" onclick="location.href='reg.inc'" class="nanav_menu_t"/> 
		    <input type="button" value="로그인" onclick="location.href='login.inc'" class="nanav_menu_t"/> 
<%		
		}
%>		
	</div> 		
	
	<!-- 두번째 검색 기능 --> 
	<input type="button" value="경기동물보호특공대" onclick="location.href='main.inc'" class="nanav_menu_logo"/> 
	
	<div class="nanavbar_middle"> 
		<form class="#">
			<span class="search123">
				      <select name="searchSelect" id="searchSelect"  class="nanav_menu_m">   
				         <option value=""> 지역</option>
				         <option value=""> 시설명</option>
				       </select>
				        <input type="text"  class="nanav_menu_m" name="searchValue" id="searchValue" placeholder="search..." style="width: 250px;"/>
				        <button id="searchbt" class="nanav_search_icon" onclick="search()"><i class="fas fa-search"></i></button>
			</span>
		</form>	   
	</div> 	
	
	<!-- 마지막 게시판 뷰 기능 -->
	<div class="nanavbar_last" >     
            <input type="button" value="야생동물 구조치료기관" onclick="reviewbbs(0)" class="nanav_menu_l"/>
            <input type="button" value="동물 병원" onclick="reviewbbs(1)" class="nanav_menu_l" />
            <input type="button" value="동물 약국" onclick="reviewbbs(2)" class="nanav_menu_l"/>
            <input type="button" value="유기 동물 보호시설" onclick="reviewbbs(3)" class="nanav_menu_l"/> 
	</div> 		
	
	<form action="reviewBbs.inc" method="post" name="r_form">
		<input type="hidden" name="s_type" id="s_type" />
	</form>
	
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script>
		function reviewbbs(num) {
			$("#s_type").attr("value", num);
			r_form.submit();
		}
	</script>
  
</body>
</html>