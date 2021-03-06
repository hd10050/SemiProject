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
<%
	Object obj = session.getAttribute("mvo");
	MemberVO mvo = (MemberVO)obj;

	if(mvo == null || !(mvo.getM_level().equals("1"))) {
%>
		<script>
			alert("허가되지 않은 접근");
			location.href = "main.inc";
		</script>
<%
	}
%>
<jsp:include page="navbar.jsp"/><br/><br/><br/><br/>
	<div class="col-sm-12 pull-center well">
	<div class="well"  style="width: 800px; margin: 0 auto;">
		<h3>${mvo.m_id }(${mvo.m_name })님 게시글</h3>
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
					<th>게시판</th>
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
							<a href="javascript:bbs_view('${vo.b_idx }', '${vo.type}')">${vo.subject }</a>
						</td>
						<c:if test="${vo.type == 4}">
							<td>공지</td>
						</c:if>
						<c:if test="${vo.type == 5}">
							<td>자유</td>
						</c:if>
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
	</div>
	</div>
	
	<form action="bbs_view.inc" method="post" name="v_form">
		<input type="hidden" id= "bidx" name="b_idx" value=""/>
		<input type="hidden" id= "type" name="type" value=""/>
	</form>

	<script>
		function bbs_view(b_idx, type) {
			$("#bidx").attr("value", b_idx);
			$("#type").attr("value", type);
			v_form.submit();
		}
	</script>
	
</body>
<jsp:include page="footer.jsp"/>
</html>