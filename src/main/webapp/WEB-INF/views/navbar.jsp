<%@page import="com.data.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<link rel="stylesheet" href="resources/css/header.css">
<style type="text/css">
.nav_logo{
	margin: 0 auto;
}
.nanavbar_top {
  width: 100%; /* Full width */
  height: 40px;
  overflow: hidden;
  position: absolute; /* Set the navbar to fixed position */
  top: 0; /* Position the navbar at the top of the page */
  background-color: #fff;
  text-align: right;
  padding: 0 80px;
}
.nanavbar_middle {
  width: 100%; /* Full width */
  height: 130px;
  overflow: hidden;
  position: absolute; /* Set the navbar to fixed position */
  top: 40px; /* Position the navbar at the top of the page */
  background-color: #fff;
  text-align: center;
}
.nanavbar_last {
  width: 100%; /* Full width */
  height: 64px;
  overflow: hidden;
  background-color: #286386;
  position: absolute;
  top: 170px;
  float: left;
}
.nanavbar_last li{
  float: left;
  list-style: none;
}
/* Links inside the navbar */
.nanav_menu_t{
	border: none;
	font-size: 13px;
    color: #000;
    padding: 14px 16px;
    text-decoration: none;
    background-color: #fff;
}
.nanav_menu_m{
    background-color: #fff;
    font-size: 15px;
    width: 100px; 
    height: 40px;
    padding: 0px;
    border: none;
}
.nanav_menu_l{
	border: none;
	font-size: 15px;
    color: #f2f2f2;
    text-align: center;
    padding: 22px 100px;
    background-color: #286386;
    position: relative;
    display: block;
}
.nanav_menu_logo{
	position: absolute; 
	top: 65px; 
	left:40px; 
    background-color: #fff;
    font-size: 20px;
}
/* Change background on mouse-over */
.nanav_menu_l:hover {
    background: #f2f2f2;
    color: #286386;
}
.search123{
    display: block;
    width: 480px;
    height: 50px;
    border: 4px solid #286386;
    margin: -5px auto;
    box-sizing: border-box;
}
.nanav_search_icon{
    font-size: 15px;
    width: 100px; 
    height: 40px;
    padding: 0px;
    float: right;
    cursor: pointer;
}
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
		    <i class="fas fa-user"></i><input type="button" value="내정보" onclick="location.href='myPage.inc'" class="nanav_menu_t"/> 
		    <i class="fas fa-unlock-alt"></i><input type="button" value="로그아웃" onclick="logout()" class="nanav_menu_t"/> 
<%
		}else{
%>
		    <i class="fas fa-user-plus"></i><input type="button" value="회원가입" onclick="location.href='reg.inc'" class="nanav_menu_t"/> 
		   <i class="fas fa-lock"></i><input type="button" value="로그인" onclick="location.href='login.inc'" class="nanav_menu_t"/> 
<%
		}
%>
	</div> 		
	
	<!-- 두번째 검색 기능 --> 
	
	<div class="nanavbar_middle"> 
		<input type="image" src="resources/image/logo.png" onclick="location.href='main.inc'" class="nav_logo"/> 
	</div>
	 	
	<!-- 마지막 게시판 뷰 기능 -->

	<ul class="nanavbar_last" >
			<li>
            	<input type="button" value="야생동물 구조치료기관" onclick="reviewbbs(0)" class="nanav_menu_l"/>
            </li>
            <li>
            	<input type="button" value="동물 병원" onclick="reviewbbs(1)" class="nanav_menu_l" />
            </li>
            <li>
            	<input type="button" value="동물 약국" onclick="reviewbbs(2)" class="nanav_menu_l"/>
            </li>
            <li>
            	<input type="button" value="유기 동물 보호시설" onclick="reviewbbs(3)" class="nanav_menu_l"/>
            </li>
            <li> 
            	<input type="button" value="공지사항" onclick="bbs(4)" class="nanav_menu_l"/>
            </li>
            <li>
            	<input type="button" value="자유 게시판" onclick="bbs(5)" class="nanav_menu_l"/>
            </li>
            
	</ul> 		

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
	</script>
  
</body>
</html>
