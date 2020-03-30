<%@page import="com.data.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body>
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
<%
	
	Object obj_vo = session.getAttribute("mvo");
		MemberVO mvo = (MemberVO)obj_vo;	
	
		if(obj_vo != null){
%>          
		  <li class="nav-item"><span class="navbar-menu"><%=mvo.getM_name() %>님 환영합니다.</span></li>
		  <li class="nav-item">
		    <input type="button" value="내정보" onclick="location.href='myPage.inc'" class="navbar-menu"/> 
		  </li>
		  <li class="nav-item">
		    <input type="button" value="로그아웃" onclick="logout()" class="navbar-menu"/> 
		  </li>
<%
		}else{
%>		  
		  <li class="nav-item">
		    <input type="button" value="회원가입" onclick="location.href='reg.inc'" class="navbar-menu"/> 
		  </li>
		  <li class="nav-item">
		    <input type="button" value="로그인" onclick="location.href='login.inc'" class="navbar-menu"/> 
		  </li>
<%		
		}
%>
		</ul>
       </div> 
   
        
      
    </div>
  </nav>
</body>
</html>