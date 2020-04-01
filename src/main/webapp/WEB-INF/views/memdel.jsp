<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원탈퇴</h1>
	<hr />
	<form action="/memleave.inc"  method="post">
		<input type="hidden" name="userId" value="${m_Id}">
		<table>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="pwd" id="pwd"></td>
			</tr>
			<tr>
				<td colspan=2 align="center"><input type="button" value="탈퇴하기" id="button"></td>
			</tr>
		</table>
	</form>
	<hr>
</body>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
				
		$(function() {
			
			$("#button").bind("click", function() {

				//유효성 검사
				if($("#pwd").val() == ""){
					alert("비밀번호를 입력해주세요");
					$("#pwd").focus();
					return;
				};	
					
				var pwd = $("#pwd").val();	
				var param  = "pwd="+encodeURIComponent(pwd);

				$.ajax({
					url : "memleave.inc",
					type: "post",
					data : param,
					dataType: "json"
	
				}).done(function(data) {
					
					if(data.chk == 1){
						alert("탈퇴 되었습니다.");
						location.href = "main.inc";
						
					}else{
						alert("실패!");
					}
					
				}).fail(function(err) {
					
					console.log(err);
				});
		});
			
		});		
	</script>
</html>