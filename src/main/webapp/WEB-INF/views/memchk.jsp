<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>비밀번호 확인</h1>
	<hr />
	<form action="/memleave.inc"  method="post">
		<table>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="pwd" id="pwd"></td>
			</tr>
			<tr>
				<td colspan=2 align="center"><input type="button" value="수정하기" id="button"></td>
			</tr>
		</table>
	</form>
	
   
	
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
					url : "editchk.inc",
					type: "post",
					data : param,
					dataType: "json"
	
				}).done(function(data) {
					
					if(data.chk == 1){
						alert("성공");
						//window.location.href = "editmove.inc";
						$("#right_content").load("editmove.inc");
						
					}else{
						alert("실패!");
					}
					
				}).fail(function(err) {
					
					console.log(err);
				});
		});
			
		});		
	</script>
</body>
</html>