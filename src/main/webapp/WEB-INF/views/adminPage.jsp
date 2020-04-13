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

</head>
<jsp:include page="navbar.jsp"/>
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
							<a href="javascript:changePage(1)">
							<i class="glyphicon glyphicon-pencil"></i>
							회원 권한 수정 </a>
						</li>
							<li>
							<a href="javascript:changePage(2)">
							<i class="glyphicon glyphicon-inbox"></i>
							회원 목록</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-md-9">
	    	<div class="profile-content">
				<div id="right_content">
					<h1>회원 권한 수정</h1>
					<div class="col-sm-12 pull-center well" style="width: 900px;">
						<div class="well"  style="width: 700px; margin: 0 auto;">
							<h6 style="color: gray;">* 0 : 일반회원  |  1 : root  |  2 : subroot</h6>
							<table class="table">
								<thead>
									<tr>
										<th>IDX</th>
										<th>ID</th>
										<th>Name</th>
										<th>Level</th>
										<th></th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="vo" items="${ar}">
										<tr>
											<td>${vo.m_idx }</td>
											<td>${vo.m_id }</td>
											<td>${vo.m_name }</td>
											<td>${vo.m_level }</td>
											<td>
												<c:if test="${vo.m_level != 1 }">
													<select id="levelSelect" style="width: 50px;">
														<option value="0"<c:if test="${vo.m_level == 0 }">selected="selected"</c:if>>0</option>
														<option value="1"<c:if test="${vo.m_level == 1 }">selected="selected"</c:if>>1</option>
														<option value="2"<c:if test="${vo.m_level == 2 }">selected="selected"</c:if>>2</option>
													</select>
													<input type="button" value="변경" onclick="changeLevel('${vo.m_idx }','${vo.m_level }')"/>
												</c:if>
											</td>
											<td>
												<c:if test="${vo.m_level == 0 }">
													<button type=button class="btn btn-danger" onclick="ban('${vo.m_idx }')">탈퇴</button>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<form action="" method="post" name="admin_frm" id="admin_frm">
	<input type="hidden" id="m_level" name="m_level" value=" "/>
	<input type="hidden" id="m_idx" name="m_idx" />
</form>

<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
	function changeLevel(m_idx, m_level) {
		var index = $("#levelSelect option").index($("#levelSelect option:selected"));
		$("#admin_frm").attr("action", "ad_changelv.inc");
		$("#m_level").attr("value", index);
		$("#m_idx").attr("value", m_idx);
		
		if(m_level == index) {
			alert("값을 변경해주세요");
			return;
		}
		
		admin_frm.submit();
	}
	
	function ban(m_idx) {
		$("#admin_frm").attr("action", "ad_ban.inc");
		$("#m_idx").attr("value", m_idx);
		
		 if(!(confirm("탈퇴시키겠습니까?"))) {
			 return;
		 }
		admin_frm.submit();
	}
	
</script>

</body>
</html>