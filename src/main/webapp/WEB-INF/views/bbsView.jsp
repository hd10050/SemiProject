<%@page import="com.data.vo.BbsVO"%>
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
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="resources/css/listStyle.css"/>
<link rel="stylesheet" href="resources/css/summernote-lite.css"/>
<style>
.red {
    color:red;
}
.form-area {
    background-color: #FAFAFA;
	padding: 10px 40px 60px;
	margin: 10px 0px 60px;
	border: 1px solid GREY;
}
</style>
</head>
<body>
<div class="container">
<div class="col-md-5">
    <div class="form-area">  
        <br style="clear:both">
			<div class="form-group">
				<pre>제목 : ${vo.subject }</pre>
			</div>
			<div class="form-group">
				<pre>조회수 : ${vo.hit }</pre>
			</div>
			<div class="form-group">
				<pre>첨부파일 : </pre>
				<c:if test="${vo.file_name != null and fn:length(vo.file_name) > 4 }">
						<a href="javascript: fDown('${vo.file_name }')">
							${vo.file_name }
							(${vo.ori_name })
						</a>
				</c:if>
	        </div>
	        <div class="form-group">
				<pre>이름 : ${vo.writer }</pre>
	        </div>
	        <div class="form-group">
				<pre>${vo.content }</pre>
	        </div>
	        
<%			
			Object obj = session.getAttribute("mvo");
			MemberVO mvo = null;
			BbsVO bvo = (BbsVO)session.getAttribute("vo");
			if(obj != null) {
				mvo = (MemberVO)obj;
				if(bvo.getM_idx().equals(mvo.getM_idx())){
%>
					<button type="button" id="del_btn" class="btn btn-danger pull-right">삭제</button>
					<button type="button" id="edit_btn" class="btn btn-primary pull-right" style="margin-left: 10px; margin-right: 10px" onclick="sendData()">수정</button>
<%
				}
			}
%>
			<button type="button" id="list_btn" class="btn btn-white pull-right">목록</button>
    </div>
</div>
</div>

	<form action="" method="post" id="go_form" name="go_form">
        <input type="hidden" name="b_idx" value="${b_idx }"/>
        <input type="hidden" name="nowPage" value="${nowPage }"/>
		<input type="hidden" name="type" value="${type }"/>
	</form>

	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script>
		$(function(){
			$("#del_btn").click(function() {
				if(confirm("정말 삭제하시겠습니까?")) {
					$("#go_form").attr("action", "bbs_del.inc");
					go_form.submit();					
				}
			});

			$("#edit_btn").click(function() {
				$("#go_form").attr("action", "edit_form.inc");
				go_form.submit();
			});

			$("#list_btn").click(function() {
				$("#go_form").attr("action", "bbs.inc");
				go_form.submit();
			});
		});
	</script>
</body>
</html>