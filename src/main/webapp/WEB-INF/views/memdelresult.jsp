<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
<% 
	boolean result = (Boolean) request.getAttribute("result");
	if(result)  {
		response.sendRedirect("main.inc");
	} else {
%>
	<script>
		alert("��! ����! �ƴմϴ�. Ʋ�Ƚ��ϴ�.");
		history.back();
	</script>
<%
	}

%>


</body>
</html>