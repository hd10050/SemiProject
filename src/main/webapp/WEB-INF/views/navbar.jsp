<%@page import="com.data.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<link rel="stylesheet" href="resources/css/nanavbar.css">

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
.menu_a, .menu_drop{ 
	
	font-size: 19.5px;
		
	font-family: 'Jeju Gothic', serif;
}

</style>
</head>
<body>
	<!-- 첫번째 회원정보 -->
	<div class="nanavbar_top" style="height: 40px;">     
<%
	
	Object obj_vo = session.getAttribute("mvo");
		MemberVO mvo = (MemberVO)obj_vo;	
	
		if(obj_vo != null){
			if(mvo.getM_level().equals("1") || mvo.getM_level().equals("2")){
%>
			<i class="fas fa-file-archive"></i><span class="nanav_menu_t" onclick="location.href='ad_page.inc'">관리자 모드</span>
		    <i class="fas fa-user"></i><input type="button" value="내정보" onclick="location.href='myPage.inc'" class="nanav_menu_t"/> 
		    <i class="fas fa-unlock-alt"></i><input type="button" value="로그아웃" onclick="logout()" class="nanav_menu_t"/>
<%				
			}else{
%>
			<span class="nanav_menu_t"><%=mvo.getM_name() %>님 환영합니다.</span>
		    <i class="fas fa-user"></i><input type="button" value="내정보" onclick="location.href='myPage.inc'" class="nanav_menu_t"/> 
		    <i class="fas fa-unlock-alt"></i><input type="button" value="로그아웃" onclick="logout()" class="nanav_menu_t"/>
<%				
			}
%>          
				
			 
<%
		}else{
%>		  
		    <i class="fas fa-user-plus"></i><input type="button" value="회원가입" onclick="location.href='reg_tos.inc'" class="nanav_menu_t"/> 
		   <i class="fas fa-lock"></i><input type="button" value="로그인" onclick="location.href='login.inc'" class="nanav_menu_t"/> 
		   <i class="fas fa-key"></i><input type="button" value="아이디/비밀번호 찾기" onclick="location.href='find.inc'" class="nanav_menu_t"/> 
<%		
		} 
%>		
	</div> 		
	
	<!-- 두번째 검색 기능 --> 
	
	<div class="nanavbar_middle" style="height: 180px;"> 
		<input type="image" src="resources/image/logo5.png" onclick="location.href='main.inc'" class="nav_logo"/> 
	</div>

	<!-- 마지막 게시판 뷰 기능 -->

	<div class="menubar" style= "padding-top: 190px;">
		<ul class="barul">
			 <li><a href="javascript:reviewbbs(0)" class="menu_a">야생동물 구조치료기관</a>
				 <ul>
				     <li><a href="javascript:reviewbbs(0)" class="menu_drop">정보</a></li>
				     <li><a href="rescueChart.inc" class="menu_drop">차트</a></li>
				 </ul>
			 </li>
			 <li><a href="javascript:reviewbbs(1)" class="menu_a">동물 병원</a>
				<ul>
				     <li><a href="javascript:reviewbbs(1)" class="menu_drop">정보</a></li>
				     <li><a href="hospChart.inc" class="menu_drop">차트</a></li>
				 </ul>
			 </li>
			 <li><a href="javascript:reviewbbs(2)" class="menu_a">동물 약국</a>
			 	<ul>
				     <li><a href="javascript:reviewbbs(2)" class="menu_drop">정보</a></li>
				     <li><a href="pharmacy.inc" class="menu_drop">차트</a></li>
				 </ul>
			 </li>
			 <li><a href="javascript:reviewbbs(3)" class="menu_a">유기 동물 보호시설</a>
				 <ul>
				     <li><a href="javascript:reviewbbs(3)" class="menu_drop">정보</a></li>
				     <li><a href="protect.inc" class="menu_drop">차트</a></li>
				 </ul>
			 </li>
			 <li><a href="javascript:bbs(4)" class="menu_a">공지사항</a></li>
			 <li><a href="javascript:bbs(5)" class="menu_a">자유 게시판</a></li>
		</ul>
		</div>
		

	<form action="reviewBbs.inc" method="post" name="r_form" id="r_form">
		<input type="hidden" name="s_type" id="s_type" />
	</form>
	
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script>
		
		function reviewbbs(num) {
			$("#s_type").attr("value", num);
			$("#r_form").attr("action", "reviewBbs.inc");
			r_form.submit();
		}
		function bbs(num) {
			$("#s_type").attr("value", num);
			$("#r_form").attr("action", "bbs.inc");
			r_form.submit();
		}
		
		//로그아웃 
		function logout() {
			$.ajax({
				
				url:"logout.inc",
				type:"post",
				dataType:"json"
				
			}).done(function (res) {
				if(res.chk == "1"){
					alert("로그아웃 성공");
					location.href="main.inc"
				}else{
					alert("로그아웃 실패")
				}
				
			}).fail(function (err) {
				console.log(err);
			});
		}
	/*
		function ad_page(lv) {
			if(lv == 1 || lv == 2) {
				location.href = "ad_page.inc";
			}
		}
	*/	
	</script>
  
</body>
</html>