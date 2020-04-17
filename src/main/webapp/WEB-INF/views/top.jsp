<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.btn_gotop {
	display:none;
	position:fixed;
	bottom:30px;
	right:30px;
	z-index:999;
	border:1px solid #ccc;
	outline:none;
	background-color:white;
	color:#333;
	cursor:pointer;
	padding:15px 20px;
	border-radius:100%;
}
</style>
</head>
<body>
	
		<!-- 상단으로 이동하기 버튼 -->
		<a href="#" class="btn_gotop">
		  <span class="glyphicon glyphicon-chevron-up"></span>
		</a>
		

<script>

	$(window).scroll(function(){
		if ($(this).scrollTop() > 200){
			$('.btn_gotop').show();
		} else{
			$('.btn_gotop').hide();
		}
	});
	$('.btn_gotop').click(function(){
		$('html, body').animate({scrollTop:0},400);
		return false;
	});
	
</script>
</body>
</html>