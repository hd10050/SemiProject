<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td>
				<label for='m_id'>아이디:</label>
			</td>
			<td>
				<input type="text" id="m_id" name="m_id"/>
			</td>
		</tr>
		<tr>	
			<td>	
				<label for='m_pw'>비밀번호:</label>
			</td>
			<td>
				<input type="text" id="m_pw" name="m_pw"/>
			</td>
		</tr>
		<tr>		
			<td>
				<button id="login_btn">로그인</button>
			</td>	
		</tr>
	</table>
	
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		
		var m_id = $("#m_id").val().trim();
		var m_pw = $("#m_pw").val().trim();
				
		//유효성 검사
		if(m_id.length < 1){
			alert("아이디를 입력하세요!");
			$("#id").focus();
			return;
		}
		if(m_pw.length < 1){
			alert("비밀번호를 입력하세요!");
			$("#pw").focus();
			return;
		}
		
		var param = "m_id="+encodeURIComponent(id)+
						  "&m_pw="+encodeURIComponent(pw);
		
		
	</script>
	
</body>
</html>