<%@page import="com.data.vo.BbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"href="resources/css/main.css">




<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js" integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/carousel.css">
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
<style>

</style>

</head>
<jsp:include page="navbar.jsp"/><br/><br/><br/>
<body>
	
	
	<div class="middle">

    <div class="middle-left">
    <div class="section" id="carousel">
        <div class="container" >
            <div class="row" >
                <div class="col-md-8 mr-auto ml-auto" style="padding:0;">
                    <!-- Carousel Card -->
                    <div class="card card-raised card-carousel" style="width:500px;">
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="3000">
                          <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1" class=""></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2" class=""></li>
                          </ol>
                          <div class="carousel-inner">
                            <div class="carousel-item active">
                              <img class="d-block" src="https://rawgit.com/creativetimofficial/material-kit/master/assets/img/bg.jpg"
                              alt="First slide" style="width:500px; height:300px;" >
                              <div class="carousel-caption d-none d-md-block">
                                <h4>
                                    <i class="material-icons">location_on</i>
                                    Yellowstone National Park, United States
                                </h4>
                              </div>
                            </div>
                            <div class="carousel-item">
                              <img class="d-block" src="https://rawgit.com/creativetimofficial/material-kit/master/assets/img/bg2.jpg"  alt="Second slide" style="width:500px; height:300px;" >
                              <div class="carousel-caption d-none d-md-block">
                                <h4>
                                    <i class="material-icons">location_on</i>
                                    Somewhere Beyond, United States
                                </h4>
                              </div>
                            </div>
                            <div class="carousel-item">
                              <img class="d-block" src="https://rawgit.com/creativetimofficial/material-kit/master/assets/img/bg3.jpg" alt="Third slide" style="width:500px; height:300px;" >
                              <div class="carousel-caption d-none d-md-block">
                                <h4>
                                    <i class="material-icons">location_on</i>
                                    Yellowstone National Park, United States
                                </h4>
                              </div>
                            </div>
                          </div>
                          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <i class="material-icons">keyboard_arrow_left</i>
                            <span class="sr-only">Previous</span>
                          </a>
                          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <i class="material-icons">keyboard_arrow_right</i>
                            <span class="sr-only">Next</span>
                          </a>
                        </div>
                    </div>
                    <!-- End Carousel Card -->

                </div>
            </div>
        </div>
	</div>
    </div>

    <div class="middle-right">
		
      <div class="middle-right-notice"> 
      	<!-- 공지사항 미리보기 -->
				<div class="title1">
					<span class="sp">공지사항</span>   
	  			</div>
<% 
		Object obj = session.getAttribute("ar");
		if(obj != null){
			BbsVO[] ar = (BbsVO[]) obj;
%>
			<div>
<%		
			for(BbsVO vo : ar){
%>
			<ul class="ulul">
				<li>
				<h6><a href="bbs_view.inc?type=4&nowPage=1&b_idx=<%=vo.getB_idx() %>"><%=vo.getSubject() %></a></h6>
				</li>
			</ul>	
<%			
			}
%>
			</div>
<%
		}
%>	
	</div>
     
      
      <div class="middle-right-free">
      	<!-- 자유게시판 미리보기 -->
				<div class="title1">
					<span class="sp">자유게시판</span>   
				</div>
<%	Object obj_f = session.getAttribute("ar_f");
		if(obj_f != null){
			BbsVO[] ar_f = (BbsVO[]) obj_f;
			
			for(BbsVO vo : ar_f){
%>
		<ul>
			<li>
				<h6><a href="bbs_view.inc?type=4&nowPage=1&b_idx=<%=vo.getB_idx() %>"><%=vo.getSubject() %></a></h6>				
			</li>
		</ul>	
<%
			}
		}
%>		
	</div>
		
		
		
       </div>
        </div>
    

  
	
	
	
</body>
<jsp:include page="footer.jsp"/><br/><br/><br/>
</html>