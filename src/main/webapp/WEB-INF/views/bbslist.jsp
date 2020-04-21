<%@page import="com.data.vo.BbsVO"%>
<%@page import="com.data.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="resources/css/pagecode.css"/>

<style>

</style>
</head>
<body>
<jsp:include page="navbar.jsp"/><br/><br/><br/><br/>
<jsp:include page="top.jsp"/>
<%
	Object obj = session.getAttribute("mvo");
	MemberVO mvo = null;

	if(obj != null) {
		mvo = (MemberVO)obj;				
	}
%>
	<div class="col-sm-12 pull-center well">
	<div class="well"  style="width: 800px; margin: 0 auto; background: #fff;">
		<c:if test="${type == 4}">
			<h3>공지 게시판</h3>
		</c:if>
		<c:if test="${type == 5}">
			<h3>자유 게시판</h3>
		</c:if>
		<table class="table">
			<colgroup>
				<col width="50px"/>			
				<col width="*"/>
				<col width="100px"/>			
				<col width="100px"/>			
				<col width="100px"/>			
			</colgroup>
			<thead>
				<tr>
					<th>#</th>
					<th>제목</th>
					<th>이름</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${fn:length(ar) > 0}">
<%
	BbsVO[] ar = (BbsVO[])request.getAttribute("ar");
	int rowTotal = (Integer)request.getAttribute("rowTotal");
	int nowPage = (Integer)request.getAttribute("nowPage");
	int blockList = (Integer)request.getAttribute("blockList");
	
	for(int i=0; i<ar.length; i++){
		int num = rowTotal-((nowPage-1)*blockList + (i+1));
%>		
				<tr>
					<td><%= num%></td>

<%
	if(ar[i].getStatus().equals("2")){//비밀글일 때,
		if((mvo !=null &&mvo.getM_level().equals("1")) || (mvo !=null && mvo.getM_idx().equals(ar[i].getM_idx()))){ //admin or 본인 일 때,
%>		
					<td>
						<a href="javascript:bbs_view('<%=ar[i].getB_idx()%>')" style="color: #000;"><%=ar[i].getSubject() %></a><i class="fas fa-lock"></i>
					</td>
<%
		}else{//admin or 본인이 아닐 때,
%>			
					<td>
						 비밀글 입니다.<i class="fas fa-lock"></i>
					</td>
<%		
		}
%>

<%		
	}else{// 일반글 일 때,
%>		
					<td>
						<a href="javascript:bbs_view('<%=ar[i].getB_idx()%>')" style="color: #000;"><%=ar[i].getSubject() %></a>
					</td>
<%		
	}
%>
					<td><%=ar[i].getWriter() %></td>
					<td><%=ar[i].getWrite_date() %></td>
					<td><%=ar[i].getHit() %></td>
				</tr>	
<%		
	}
%>
</c:if>

				<c:if test="${fn:length(ar) < 1}">
					<tr>
						<td colspan="6">등록된 글이 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
		<br/>
		<div class="pagination" style="margin: 0 auto;">
		    <ul style="padding: 0;">
		        ${pageCode }
		    </ul>
		</div>
		<c:if test="${type == 4}">
		<%	if(mvo != null && (mvo.getM_level().equals("1") || mvo.getM_level().equals("2")))  {%>	
			<div class="btn-toolbar">
		    	<button class="btn btn-primary" onclick="write_btn()">글쓰기</button>
			</div>
		<%	} %>
		</c:if>
		
		<c:if test="${type == 5}">
		<%	if(mvo != null)  {%>	
			<div class="btn-toolbar">
		    	<button class="btn btn-primary" onclick="write_btn()">글쓰기</button>
			</div>
		<%	} %>
		</c:if>
	</div>
	</div>
	
	<form action="write_form.inc" method="post" name="w_form">
		<input type="hidden" name="type" value="${type }"/>
		<input type="hidden" name="nowPage" value="${nowPage }"/>
		<%if(mvo != null) { %>
		<input type="hidden" name="m_idx" value="<%=mvo.getM_idx()%>"/>
		<%} %>
	</form>
	
	<form action="bbs_view.inc" method="post" name="v_form">
		<input type="hidden" name="type" value="${type }"/>
		<input type="hidden" name="nowPage" value="${nowPage }"/>
		<input type="hidden" id= "bidx" name="b_idx" value=""/>
	</form>

	<script>
		function write_btn() {
			w_form.submit();
		}
		
		function bbs_view(b_idx) {
			$("#bidx").attr("value", b_idx);
			v_form.submit();
		}
	</script>
	
</body>
<jsp:include page="footer.jsp"/>
</html>