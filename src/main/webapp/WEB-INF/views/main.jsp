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
<jsp:include page="top.jsp"/>
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
                <a target="_blank" href="https://www.animal.go.kr/front/community/show.do?boardId=contents&seq=66&menuNo=2000000016"><img class="d-block w-100" src="resources/image/carousel1.png" alt="First slide"></a>
                <div class="mask rgba-black-light"></div>
            </div>
            <div class="carousel-caption">
               
            </div>
        </div>
        <div class="carousel-item">
            <!--Mask color-->
            <div class="view">
                <a  target="_blank" href="https://apms.epis.or.kr/wilddog/IndexMain3"><img class="d-block w-100" src="resources/image/carousel2.png" alt="Second slide"></a>
                <div class="mask rgba-black-strong"></div>
            </div>
            <div class="carousel-caption">
                
            </div>
        </div>
        <div class="carousel-item">
            <!--Mask color-->
            <div class="view">
                <a target="_blank" href="http://www.mafra.go.kr/mafra/355/subview.do;jsessionid=X31CHBZ8iATuQsXT2kBqvvV2.inst21?enc=Zm5jdDF8QEB8JTJGYmJzJTJGbWFmcmElMkY2NCUyRjMxOTA2MyUyRmFydGNsVmlldy5kbyUzRg%3D%3D"><img class="d-block w-100" src="resources/image/carousel3.png" alt="Third slide"></a>
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
</div><!-- top의 끝 -->	


	
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
			<div class="uldiv">
<%		
			for(BbsVO vo : ar){
%>
			<ul class="ulul">
				<li>
				<h6 style="font-size: 15px;"><a href="bbs_view.inc?type=4&nowPage=1&b_idx=<%=vo.getB_idx() %>"><span class="cl"><%=vo.getSubject() %></span></a></h6>
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
%>
			<div class="uldiv">
<% 			
			for(BbsVO vo : ar_f){
%>
		<ul>
			<li>
				<h6 style="font-size: 15px;"><a href="bbs_view.inc?type=4&nowPage=1&b_idx=<%=vo.getB_idx() %>"><span class="cl"><%=vo.getSubject() %></span></a></h6>				
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
	
	<div id="bottom">
		<ul class="main-link">
			<li>
				<div>
					<h3 class="t3"><span>동물판매업자 등의</span>
					<span style="font-size:12px">동물판매, 미용, 운송 등 영업자</span>
					인터넷교육 동영상</h3>
					<img src="resources/image/main1.png" alt="">
					<a href="http://apms.epis.or.kr/petseller/IndexMain2" class="btn_l">시청하기</a>
				</div>
			</li>
			<li>
				<div>
					<h3 class="t3"><span>동물보호 명예감시원</span> 인터넷교육 동영상</h3>
					<img src="resources/image/main2.png" alt="">
					
					<a href="http://apms.epis.or.kr/warden/IndexMain3" class="btn_l">시청하기</a>
				</div>
			</li>
			<li id="wild">
				<div>
					<h3 class="t3"><span>맹견 소유자</span> 인터넷교육 동영상</h3>
					<img src="resources/image/main3.png" alt="">
					<a href="http://apms.epis.or.kr/wilddog/IndexMain3" class="btn_l">시청하기</a>
				</div>
			</li>
		</ul>
	
	
  
	
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