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




<!-- -->

.menubar{
	border:none;
	border:0px;
	margin: 0 auto;
	padding:0px;
	font: 67.5% "Lucida Sans Unicode", "Bitstream Vera Sans", "Trebuchet Unicode MS", "Lucida Grande", Verdana, Helvetica, sans-serif;
	font-size:14px;
	font-weight:bold;
	
}


.menubar ul{
	background: #286386;;
	height:50px;
	list-style:none;
	margin:0;
	padding:0;
	position: absolute;
	width: 100%;
	 
}

html, body {
    overflow-x: hidden;
    width: 100%;
    position: fixed;
}

.menubar li{
	float:left;
	padding:0px;
	position: relative;
}


.menubar li a{
	background: #286386;;
	color: white;
	display:block;
	font-weight:normal;
	line-height:50px;
	margin:0px;
	padding:0px 55px;
	text-align:center;
	text-decoration:none;

}


.menubar li a:hover, .menubar ul li:hover a{
	background: rgb(71,71,71);
	color:#FFFFFF;
	text-decoration:none;
}



.menubar li ul{
	background: #286386;
	display:none; /* 평상시에는 드랍메뉴가 안보이게 하기 */
	height:auto;
	padding:0px;
	margin:0px;
	border:0px;
	position:absolute;
	
	z-index:200;
	/*top:1em;
	/*left:0;*/
}


.menubar li:hover ul{
	display:block; /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
}



.menubar li li {
	background: #286386;
	display:block;
	float:none;
	margin:0px;
	padding:0px;

}



.menubar li:hover li a{
	background:none;
}


.menubar li ul a{
	display:block;
	height:50px;
	font-size:12px;
	font-style:normal;
	margin:0px;
	padding:0px 10px 0px 15px;
	text-align:center;

}


.menubar li ul a:hover, .menubar li ul li:hover a{
background: rgb(71,71,71);
border:0px;
color: white;
text-decoration:none;
}

.menubar p{
clear:left;
}

@media (max-width: 1320px) {
	.menubar ul{
		overflow: hidden;
	}
}

ul.barul {
    padding-left: 150px;
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
%>          
				
		    <span class="nanav_menu_t"><%=mvo.getM_name() %>님 환영합니다.</span>
		    <i class="fas fa-user"></i><input type="button" value="내정보" onclick="location.href='myPage.inc'" class="nanav_menu_t"/> 
		    <i class="fas fa-unlock-alt"></i><input type="button" value="로그아웃" onclick="logout()" class="nanav_menu_t"/> 
<%
		}else{
%>		  
		    <i class="fas fa-user-plus"></i><input type="button" value="회원가입" onclick="location.href='reg.inc'" class="nanav_menu_t"/> 
		   <i class="fas fa-lock"></i><input type="button" value="로그인" onclick="location.href='login.inc'" class="nanav_menu_t"/> 
		   <i class="fas fa-key"></i><input type="button" value="아이디/비밀번호 찾기" onclick="location.href='find.inc'" class="nanav_menu_t"/> 
<%		
		} 
%>		
	</div> 		
	
	<!-- 두번째 검색 기능 --> 
	
	<div class="nanavbar_middle" style="height: 180px;"> 
		<input type="image" src="resources/image/logo.png" onclick="location.href='main.inc'" class="nav_logo"/> 
	</div>
	 	
	<!-- 마지막 게시판 뷰 기능 -->

	<div class="menubar" style= "padding-top: 150px;">
		<ul class="barul">
			 <li><a href="javascript:reviewbbs(0)">야생동물 구조치료기관</a>
				 <ul>
				     <li><a href="#">Test1</a></li>
				     <li><a href="#">Test2</a></li>
				     <li><a href="#">Test3</a></li>
				     <li><a href="#">Test4</a></li>
			    </ul></li>
			 <li><a href="javascript:reviewbbs(1)">동물 병원</a>
				<ul>
				     <li><a href="#">Test1</a></li>
				     <li><a href="#">Test2</a></li>
				     <li><a href="#">Test3</a></li>
				     <li><a href="#">Test4</a></li>
			    </ul>
			 </li>
			 <li><a href="javascript:reviewbbs(2)">동물 약국</a>
			 	<ul>
				     <li><a href="#">Test1</a></li>
				     <li><a href="#">Test2</a></li>
				     <li><a href="#">Test3</a></li>
				     <li><a href="#">Test4</a></li>
			    </ul>
			 </li>
			 <li><a href="javascript:reviewbbs(3)">유기 동물 보호시설</a>
				 <ul>
				     <li><a href="#">Test1</a></li>
				     <li><a href="#">Test2</a></li>
				     <li><a href="#">Test3</a></li>
				     <li><a href="#">Test4</a></li>
				 </ul></li>
			 <li><a href="javascript:reviewbbs(4)">공지사항</a>
				 <ul>
				     <li><a href="#">Test1</a></li>
				     <li><a href="#">Test2</a></li>
				     <li><a href="#">Test3</a></li>
				     <li><a href="#">Test4</a></li>
				</ul></li>
			 <li><a href="javascript:reviewbbs(5)">자유 게시판</a>
				 <ul>
				     <li><a href="#">Test1</a></li>
				     <li><a href="#">Test2</a></li>
				     <li><a href="#">Test3</a></li>
				     <li><a href="#">Test4</a></li>
				</ul>
			</li>
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
	</script>
  
</body>
</html>