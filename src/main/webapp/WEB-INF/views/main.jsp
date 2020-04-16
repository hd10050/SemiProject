<%@page import="com.data.vo.BbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"href="resources/css/main.css">


</head>
<jsp:include page="navbar.jsp"/><br/><br/><br/>
<body>
	<div id="mainbody">
	<div class="top">
	<div id="carousel-example-2" class="carousel slide carousel-fade" data-ride="carousel" style="width:1200px; height: 400px; margin-left: 340px;">
    <!--Indicators-->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-2" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-2" data-slide-to="1"></li>
        <li data-target="#carousel-example-2" data-slide-to="2"></li>
    </ol>
    <!--/.Indicators-->
    <!--Slides-->
    <div class="carousel-inner" role="listbox">
        <div class="carousel-item active">
            <div class="view">
                <img class="d-block w-100" src="resources/image/carousel1.png" alt="First slide">
                <div class="mask rgba-black-light"></div>
            </div>
            <div class="carousel-caption">
               
            </div>
        </div>
        <div class="carousel-item">
            <!--Mask color-->
            <div class="view">
                <img class="d-block w-100" src="resources/image/carousel2.png" alt="Second slide">
                <div class="mask rgba-black-strong"></div>
            </div>
            <div class="carousel-caption">
                
            </div>
        </div>
        <div class="carousel-item">
            <!--Mask color-->
            <div class="view">
                <img class="d-block w-100" src="resources/image/carousel3.png" alt="Third slide">
                <div class="mask rgba-black-slight"></div>
            </div>
            <div class="carousel-caption">
               
            </div>
        </div>
    </div>
    <!--/.Slides-->
    <!--Controls-->
    <a class="carousel-control-prev" href="#carousel-example-2" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carousel-example-2" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
    <!--/.Controls-->
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

    <div class="middle-right"  style="left:730px;">
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
	</div>
    

  
	
	
	
</body>
<jsp:include page="footer.jsp"/><br/><br/><br/>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$('.carousel').carousel({
	  interval: 3000
	})
</script>
</html>