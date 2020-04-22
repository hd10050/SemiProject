<%@page import="com.data.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="resources/css/memview.css"/>
<link rel="stylesheet" href="resources/css/editform.css"/>
<link rel="stylesheet" href="resources/css/pagecode.css"/>

</head>
<jsp:include page="navbar.jsp"/>
<jsp:include page="top.jsp"/>
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
<div class="container">
    <div class="row_profile">
    	<div class="col-md-3">
			<div class="profile-sidebar">
				<!-- SIDEBAR MENU -->
				<div class="profile-usermenu">
					<ul class="nav">
						<li>
							<a href="javascript:location.href='ad_page.inc'">
							<i class="glyphicon glyphicon-pencil"></i>
							회원 권한 수정 </a>
						</li>
							<li>
							<a href="javascript:location.href='ad_ad.inc'">
							<i class="glyphicon glyphicon-inbox"></i>
							배너 관리</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-md-9">
	    	<div class="profile-content">
				<div id="right_content">
					<h1>배너 관리</h1>
					<table class="table">
						<thead>
							<tr>
								<th>IDX</th>
								<th>TITLE</th>
								<th>COMPANY</th>
								<th>LOCATION</th>
								<th>STATUS</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${fn:length(ad_ar) > 0}">
								<c:forEach var="avo" items="${ad_ar}">
									<tr>
										<td>${avo.idx }</td>
										<td>${avo.title }</td>
										<td>${avo.company }</td>
										<c:if test="${avo.location == 'm1' }">
											<td>메인 배너1</td>		
										</c:if>
										<c:if test="${avo.location == 'm2' }">
											<td>메인 배너2</td>		
										</c:if>
										<c:if test="${avo.location == 'm3' }">
											<td>메인 배너3</td>		
										</c:if>
										<c:if test="${avo.location == 'm4' }">
											<td>메인 광고</td>		
										</c:if>
										<td>
											<c:if test="${avo.status == 0 }">
												<button type=button class="btn btn-danger" onclick="ban('${avo.idx }')">삭제</button>
											</c:if>
											<c:if test="${avo.status == 1 }">
												<button type=button class="btn btn-success" onclick="re('${avo.idx }','${avo.location }')">복구</button>
											</c:if> 
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${fn:length(ad_ar) < 1}">
								<tr>
									<td colspan="7">등록된 배너가 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
					<div class="pagination" style="margin: 0 auto;">
					    <ul style="padding: 0;">
					        ${pageCode }
						</ul>
					</div>
				</div>
					<button class="btn btn-primary" onclick="javascript:location.href='ad_write_form.inc'">등록</button>
			</div>
		</div>
	</div>
</div>
<form action="ad_AdChange.inc" method="post" name="admin_frm" id="admin_frm">
	<input type="hidden" id="status" name="status"/>
	<input type="hidden" id="idx" name="idx" />
</form>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
	function ban(idx) {
		$("#idx").attr("value", idx);
		$("#status").attr("value", 1);
		
		 if(!(confirm("삭제시키겠습니까?"))) {
			 return;
		 }
		admin_frm.submit();
	}
	
	function re(idx, location) {
		$("#idx").attr("value", idx);
		$("#status").attr("value", 0);
		
		 if(!(confirm("복구시키겠습니까?"))) {
			 return;
		 }
		 
		$.ajax({
			url: "ad_write_chk.inc",
			type: "post",
			dataType: "json",
			data: "location=" + encodeURIComponent(location)
		}).done(function(data){
			if(data.chk == 1) {
				admin_frm.submit();
			} else {
				alert("사용중인 배너위치입니다");
			}
		}).fail(function(err){
			console.log(err);
		});
	}
</script>

</body>
<jsp:include page="footer.jsp"/>
</html>