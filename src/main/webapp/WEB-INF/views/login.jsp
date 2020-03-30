<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
<jsp:include page="header.jsp"/><br/><br/><br/>
<div class="container">
    <div class="row">
    	<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">Login via site</h3>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form">
                    <fieldset>
			    	  	<div class="form-group">
			    		    <input class="form-control" placeholder="아이디" name="m_id" id="m_id" type="text">
			    		</div>
			    		<div class="form-group">
			    			<input class="form-control" placeholder="비밀번호" name="m_pw" id="m_pw" type="password" value="">
			    		</div>
			    		<div class="checkbox">
			    	    	<label>
			    	    		<input name="remember" type="checkbox" value="Remember Me"> Remember Me
			    	    	</label>
			    	    </div>
			    		<input class="btn btn-lg btn-success btn-block" type="submit" value="Login">
			    	</fieldset>
			      	</form>
                      <hr/>
                    <center><h4>OR</h4></center>
                    <a href="" class="btn btn-block btn-google"> <i class="fab fa-google"></i>  구글로 로그인</a>
					<a href="" class="btn btn-block btn-naver"> <img src="resources/css/images/naver_logo.png"></i>  네이버로 로그인</a>
					<a href="" class="btn btn-block btn-kakao"> <img src="resources/css/images/naver_logo.png"></i>  카카오로 로그인</a>
			    </div>
			</div>
		</div>
	</div>
</div>

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