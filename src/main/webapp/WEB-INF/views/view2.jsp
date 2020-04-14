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
	<form action="view.inc" method="post" name="v_form">
		<input type="hidden" name="type" value="${type }"/>
		<input type="hidden" name="nowPage" value="${nowPage }"/>
		<input type="hidden" id= "RESCUE_INST_TELNO" name="RESCUE_INST_TELNO" value="${RESCUE_INST_TELNO }"/>
		<input type="hidden" id= "LOCPLC_FACLT_TELNO" name="LOCPLC_FACLT_TELNO" value="${LOCPLC_FACLT_TELNO }"/>
		<input type="hidden" id= "ENTRPS_TELNO" name="ENTRPS_TELNO" value="${ENTRPS_TELNO }"/>
		<input type="hidden" id= "RESCUE_INST_NM" name="RESCUE_INST_NM" value="${RESCUE_INST_NM }"/>
		<input type="hidden" id= "BIZPLC_NM" name="BIZPLC_NM" value="${BIZPLC_NM }"/>
		<input type="hidden" id= "ENTRPS_NM" name="ENTRPS_NM" value="${ENTRPS_NM }"/>
	</form>

	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function(){
	
			v_form.submit();
	
		});
	</script>
</body>
</html>