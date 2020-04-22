<%@page import="com.data.vo.MemberVO"%>
<%@page import="com.data.vo.BbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/main3.css">
<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
span , .sp, .t3, h3{
	font-family: 'Jeju Gothic', serif; 
}

</style>

</head>
<jsp:include page="navbar.jsp"/><br/><br/><br/>
<jsp:include page="top.jsp"/>
<body>
<%
	Object mobj = session.getAttribute("mvo");
	MemberVO mvo = null;

	if(mobj != null) {
		mvo = (MemberVO)mobj;				
	}
%>
	<div id="mainbody">
	<div class="top">
	<div id="carousel-example-2" class="carousel slide carousel-fade" data-ride="carousel" style="width:1500px; height: 500px; margin-left: 240px;" >
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
                <a target="_blank" href="${m1_href }"><img class="d-block w-100" src="${m1_src }" alt="First slide" ></a>
                <div class="mask rgba-black-light"></div>
            </div>
            <div class="carousel-caption">
               
            </div>
        </div>
        <div class="carousel-item">
            <!--Mask color-->
            <div class="view">
                <a  target="_blank" href="${m2_href }"><img class="d-block w-100" src="${m2_src }" alt="Second slide" ></a>
                <div class="mask rgba-black-strong"></div>
            </div>
            <div class="carousel-caption">
                
            </div>
        </div>
        <div class="carousel-item">
            <!--Mask color-->
            <div class="view">
                <a target="_blank" href="${m3_href }"><img class="d-block w-100" src="${m3_src }" alt="Third slide" ></a>
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
				<h6 style="font-size: 17px;"><a href="bbs_view.inc?type=4&nowPage=1&b_idx=<%=vo.getB_idx() %>"><span class="cl"><%=vo.getSubject() %></span></a></h6>
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
					<span class="sp"><a href="javascript:bbs(5)" style="color:black; font-size: 32px" >자유게시판</a></span>
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
				if(vo.getStatus().equals("2")){//비밀글일 때,
					if((mvo !=null &&mvo.getM_level().equals("1")) || (mvo !=null && mvo.getM_name().equals(vo.getWriter()))){ //admin or 본인 일 때,
			%>		
								<ul>
									<li>
										<h6 style="font-size: 17px;"><a href="javascript:bbs_view('<%=vo.getB_idx()%>')"><span class="cl" style="font-size: 15px;"><%=vo.getSubject() %> <i class="fas fa-lock"></i></span></a></h6>
									</li>
								</ul>
			<%
					}else{//admin or 본인이 아닐 때,
			%>			
						<ul>
							<li>
								<h6><span class="cl" style="font-size: 17px;">비밀글 입니다. <i class="fas fa-lock"></i></span></h6>
							</li>
						</ul>
			<%		
					}
			%>
			
			<%		
				}else{// 일반글 일 때,
			%>		
					<ul>
						<li>
							<h6><a href="javascript:bbs_view('<%=vo.getB_idx()%>')"><span class="cl" style="font-size: 17px;"><%=vo.getSubject() %></span></a></h6>				
						</li>
					</ul>
			<%		
				}	
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
			<div class="banner">
				<a target="_blank" href="${m4_href}"><img class="d-block w-100" src="${m4_src}" style="width: 400px; height: 400px;"></a>
			</div>
		</div><!-- s_middle의 끝 -->
       </div>
	
	<div id="bottom">
		<ul class="main-link">
			<li>
				<div>
					<h3 class="t3"><span>동물판매업자 등의</span>
					<span style="font-size:12px">동물판매, 미용, 운송 등 영업자</span>
					<span>인터넷교육 동영상</span></h3>
					<img src="resources/image/main1.png" alt="">
					<a href="http://apms.epis.or.kr/petseller/IndexMain2" class="btn_l">시청하기</a>
				</div>
			</li>
			<li>
				<div>
					<h3 class="t3"><span>동물보호 명예감시원</span><span>인터넷교육 동영상</span></h3>
					<img src="resources/image/main2.png" alt="">
					
					<a href="http://apms.epis.or.kr/warden/IndexMain3" class="btn_l">시청하기</a>
				</div>
			</li>
			<li id="wild">
				<div>
					<h3 class="t3"><span>맹견 소유자</span><span>인터넷교육 동영상</span></h3>
					<img src="resources/image/main3.png" alt="">
					<a href="http://apms.epis.or.kr/wilddog/IndexMain3" class="btn_l">시청하기</a>
				</div>
			</li>
		</ul>
	
		<div id="hing">
				   <ul class="quickBtn4">
                    <li><a  target="_blank" href="https://www.animal.go.kr/front/community/index.do?boardId=boardID03&menuNo=7000000005" class="quickBtn4-1">정보공개</a></li>
                    <li><a  target="_blank" href="https://www.animal.go.kr/front/community/show.do?boardId=contents&seq=170&menuNo=3000000019" class="quickBtn4-2" title="인증제절차">동물복지농장 인증절차</a></li>
                </ul>
                <span class="quickBtn5">
                    <dl>
                        <dt>동물보호 상담센터</dt>
                        <dd>1577-0954</dd>
                    </dl>
                    <p>상담시간 : 평일 09:00 ~ 18:00</p>
                </span>
		</div>	
	
  
	
	</div>
</div>
	<form action="bbs_view.inc" method="post" name="v_form">
		<input type="hidden" name="type" value="${type }"/>
		<input type="hidden" name="nowPage" value="${nowPage }"/>
		<input type="hidden" id= "bidx" name="b_idx" value=""/>
	</form>

	<script>		
		function bbs_view(b_idx) {
			$("#bidx").attr("value", b_idx);
			v_form.submit();
		}
	</script>
	
</body>
<jsp:include page="footer.jsp"/><br/><br/><br/>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
</html>