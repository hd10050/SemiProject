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
</head>
<body>
<jsp:include page="navbar.jsp"/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<%
	Object obj = session.getAttribute("mvo");
	MemberVO mvo = null;

	if(obj != null) {
		mvo = (MemberVO)obj;				
	}
%>
	<div class="col-sm-12 pull-center well">
	<div class="well"  style="width: 800px; margin: 0 auto;">
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
					<c:forEach var="vo" items="${ar}" varStatus="st">
					<tr>
						<td>${rowTotal - ((nowPage-1) * blockList + st.index) }</td>
						<td>
							<a href="javascript:bbs_view('${vo.b_idx }')">${vo.subject }</a>
						</td>
						<td>${vo.writer }</td>
						<td>${fn:substring(vo.write_date, 0, 10) }</td>
						<td>${vo.hit }</td>
					</tr>
					</c:forEach>
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
</html>