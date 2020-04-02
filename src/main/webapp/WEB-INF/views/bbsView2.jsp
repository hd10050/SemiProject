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
</head>
<body>	
	<form action="bbs_view.inc" method="post" name="v_form">
		<input type="hidden" name="type" value="${type }"/>
		<input type="hidden" name="nowPage" value="${nowPage }"/>
		<input type="hidden" id= "bidx" name="b_idx" value="${b_idx }"/>
	</form>

	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function(){
	
			v_form.submit();
	
		});
	</script>
</body>
</html>