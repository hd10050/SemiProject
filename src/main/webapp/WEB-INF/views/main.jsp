<%@page import="com.data.vo.MemberVO"%>
<%@page import="com.data.vo.ProtectVO"%>
<%@page import="com.data.vo.StoreVO"%>
<%@page import="com.data.vo.HospitalVO"%>
<%@page import="com.data.vo.RescueVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<body>
<jsp:include page="navbar.jsp"/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url('resources/css/images/imageView.jpg')">
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



   
   <div id="wrap">
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
	       <input type="button" value="공지사항" onclick="bbs(4)" class="btn btn-xs btn-primary"/>
		   <input type="button" value="자유게시판" onclick="bbs(5)" class="btn btn-xs btn-primary"/>
      </div> 
   </div>
   
	
	<form action="search.inc" method="post" name="search_form">
		<input type="hidden" id="search_value" name="search_value"/>
		<input type="hidden" id="search_type" name="search_type"/>
		<input type="hidden" name="s_type" value='<%=request.getAttribute("type")%>'/>
	</form>

  	</div>
  	  <!-- Bootstrap core JavaScript -->
  <script src="resources/vendor/jquery/jquery.min.js"></script>
  <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  	
  	
  	
   <script src="resources/js/jquery-3.4.1.min.js"></script>
   <script> 
   		
   
   		function bbs(type) {
			document.location.href="bbs.inc?type=" + type;
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
   <br/><br/><jsp:include page="footer.jsp"/>
   </body>
</html>