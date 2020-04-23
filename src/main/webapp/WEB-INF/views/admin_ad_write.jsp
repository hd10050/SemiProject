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
					<!-- title company content start_date end_date link location -->
						<div class="container" style="margin: 0 auto; width: 900px;">
						    <div class="form-area" style="width: 900px">  
						    	<div style="margin: 0 auto; width: 700px;">
							        <form action="ad_write.inc" method="post" encType="multipart/form-data" name="write_form">
							        <br style="clear:both">
										<div class="form-group">
											<input type="text" class="form-control" id="title" name="title" placeholder="title" required style="width: 700px">
										</div>
										<div class="form-group">
											<input type="file" name="file" id="m_file" accept="image/*" />
										</div>
										<div class="form-group">
											<input type="text" class="form-control" id="company" name="company" placeholder="company" required style="width: 700px">
										</div>
										<div class="form-group">
											<input type="text" class="form-control" id="link" name="link" placeholder="link" required style="width: 700px">
										</div>
										<div class="form-group">
											<select class="form-control" id="location" name="location" style="width: 300px">
												<option value="m1">메인 배너1</option>											
												<option value="m2">메인 배너2</option>											
												<option value="m3">메인 배너3</option>											
												<option value="m4">메인 광고</option>											
											</select>
										</div>
										
										<button type="button" id="save_btn" class="btn btn-primary pull-right" style="margin-left: 10px;" onclick="sub_form()">등록</button>
							        </form>
						        </div>
						    </div>
						</div>
				</div>
					
			</div>
		</div>
	</div>
</div>

<script src="resources/js/jquery-3.4.1.min.js"></script>
<script>
	function sub_form() {
		var title = $("#title").val();
		var company = $("#company").val();
		var link = $("#link").val();
		var location = $("#location").val();
		
		if(title.trim().length < 1) {
			alert("제목을 입력하세요.");
			return;
		}
		if($("#m_file").val() == "") {
			alert("이미지를 등록하세요.");
			return;
		}
		if(company.trim().length < 1) {
			alert("회사명을 입력하세요.");
			return;
		}
		if(link.trim().length < 1) {
			alert("링크를 입력하세요.");
			return;
		}
		
		$.ajax({
			url: "ad_write_chk.inc",
			type: "post",
			dataType: "json",
			data: "location=" + encodeURIComponent(location)
		}).done(function(data){
			if(data.chk == 1) {
				write_form.submit();
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