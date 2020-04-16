<%@page import="com.data.vo.BbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/carousel.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

</head>
<jsp:include page="navbar.jsp"/><br/><br/><br/>
<body>
	<div class="top">
	<div class="container">
	<div id="carousel" class="carousel slide carousel-fade" style="border: 4px dashed #d0d9e7;" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carousel" data-slide-to="0" class="active"></li>
        <li data-target="#carousel" data-slide-to="1"></li>
        <li data-target="#carousel" data-slide-to="2"></li>
    </ol>
    <!-- Carousel items -->
    <div class="carousel-inner carousel-zoom">
        <div class="active item"><img class="img-responsive" src="https://images.unsplash.com/photo-1419064642531-e575728395f2?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=1200">
          <div class="carousel-caption">
            <h2>Title</h2>
            <p>Description</p>
          </div>
        </div>
        <div class="item"><img class="img-responsive" src="https://images.unsplash.com/photo-1445280471656-618bf9abcfe0?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=1200">
          <div class="carousel-caption">
            <h2>Title</h2>
            <p>Description</p>
          </div>
        </div>
        <div class="item"><img class="img-responsive" src="https://images.unsplash.com/photo-1445462657202-a0893228a1e1?crop=entropy&fit=crop&fm=jpg&h=400&ixjsv=2.1.0&ixlib=rb-0.3.5&q=80&w=1200">
          <div class="carousel-caption">
            <h2>Title</h2>
            <p>Description</p>
          </div>
        </div>
       </div>
    <!-- Carousel nav -->
    <a class="carousel-control left" href="#carousel" data-slide="prev">‹</a>
    <a class="carousel-control right" href="#carousel" data-slide="next">›</a>
</div>
</div>
</div>	
	
	<div class="middle" >
    <div class="middle-left" style="left: 230px;">
    	<div class="middle-right-notice"> 
      	<!-- 공지사항 미리보기 -->
				<div class="title1">
					<span class="sp">공지사항</span><a href="javascript:bbs(4)" ><img src="resources/css/images/ico-more.png" class="moreicon"></a>      
	  			</div>
	  			<span class="ico"><img src="resources/css/images/notice.jpg" class="p1"></span>
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
				<h6 style="font-size: 21px;"><a href="bbs_view.inc?type=4&nowPage=1&b_idx=<%=vo.getB_idx() %>"><span class="cl"><%=vo.getSubject() %></span></a></h6>
				</li>
			</ul>	
<%			
			}
%>
			</div>
<%
		}else{
%>
			<ul class="ulul">
				<li>
					<span> 작성된 글이 없습니다. </span>
				</li>
			</ul>	
<%					
		}
%>	
	</div>
    </div>

    <div class="middle-right" style="left:730px;">
      <div class="middle-right-free">
      	<!-- 자유게시판 미리보기 -->
				<div class="title1">
					<span class="sp"><a href="javascript:bbs(5)" style="color:black;" >자유게시판</a></span>
					<a href="javascript:bbs(4)" ><img src="resources/css/images/ico-more.png" class="moreicon"></a>   
				</div>
				<span class="ico"><img src="resources/css/images/free.jpg"></span>
<%	Object obj_f = session.getAttribute("ar_f");
		if(obj_f != null){
			BbsVO[] ar_f = (BbsVO[]) obj_f;
			
			for(BbsVO vo : ar_f){
%>
		<ul>
			<li>
				<h6 style="font-size: 21px;"><a href="bbs_view.inc?type=4&nowPage=1&b_idx=<%=vo.getB_idx() %>"><span class="cl"><%=vo.getSubject() %></span></a></h6>				
			</li>
		</ul>	
<%			
			}
%>
			</div>
<%
		}else{
%>
			<ul class="ulul">
				<li>
					<span> 작성된 글이 없습니다. </span>
				</li>
			</ul>	
<%					
		}
%>	
		</div>
		</div><!-- s_middle의 끝 -->
       </div>

    

  
	
	
	
</body>
<jsp:include page="footer.jsp"/><br/><br/><br/>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</html>