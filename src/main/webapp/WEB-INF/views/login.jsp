<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/><br/><br/><br/>
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
	
		
		$("#login_btn").click(function () {
		
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
				
				var param = "m_id="+encodeURIComponent(m_id)+
								  "&m_pw="+encodeURIComponent(m_pw);
				
				// 비동기식 통신
				$.ajax({
					url: "login.inc",
					type: "post",
					dataType: "json",
					data: param
							
					}).done(function(res){
						
						if(res.chk == "1") {
							alert("로그인 실패");
						} else {
							location.href="main.inc";	
						}
						
					}).fail(function(err) {
						console.log(err);
					});
				
		    });
		
		
	</script>
	
</body>
</html>