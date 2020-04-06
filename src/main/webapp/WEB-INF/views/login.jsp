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
<meta name="google-signin-client_id" content="133953135897-7njkqdpmu7gu7os61f48lpii4jovdt1d.apps.googleusercontent.com">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
<jsp:include page="navbar.jsp"/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

<div class="container" style="width: 600px;">
    <div class="row">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">Login</h3>
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
			    		<input class="btn btn-lg btn-success btn-block" type="button" value="Login" id="login_btn">
			    	</fieldset>
			      	</form>
                      <hr/>
                    <center><h4>OR</h4>
                    <div class="g-signin2" data-onsuccess="onSignIn" style="width: 300px;"></div>
                    <div id="naverIdLogin" style="width: 300px;"></div>
					<a id="kakao-login-btn" style="width: 300px;"></a>
					</center>
			    </div>
			</div>
	</div>
</div>
	<form action="snslogin.inc" method="post" name="snsform">
		<input type="hidden" id="m_id2" name="m_id"/>
		<input type="hidden" id="m_name" name="m_name"/>
		<input type="hidden" id="m_gender" name="m_gender"/>
		<input type="hidden" id="m_phone" name="m_phone"/>
		<input type="hidden" id="r_snscode" name="r_snscode"/>
	</form>
	
	<%-- 구글 로그인 --%>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script>
		var isButtonClicked = false;
		document.querySelector('.g-signin2').addEventListener('click', function() { 
		    isButtonClicked = true; 
		});

		function onSignIn(googleUser) {
			if(isButtonClicked) {
				var profile = googleUser.getBasicProfile();
				console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
				console.log('Name: ' + profile.getName());
				console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	
				if (profile.getId() == null) {
					return;
				}

				var idx = profile.getEmail().indexOf("@");
				if(idx != -1) {
					$("#m_id2").attr("value", profile.getEmail().substring(0, idx));
				}
				$("#m_name").attr("value", profile.getName());
				$("#r_snscode").attr("value", "G_" + profile.getId());
				snsform.submit();
			}
		}
	</script>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<%------------------%>
	<%--네이버로그인----%>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<script type="text/javascript">
		var isNButtonClicked = false; 
		$("#naverIdLogin").click(function(){
			isNButtonClicked = true;
		});
		
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "OL_B5mSm18YdFdSjpYol",
				callbackUrl: "http://localhost:9090/semi/callback.inc",
				isPopup: false, /* 팝업을 통한 연동처리 여부 */
				loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
			}
		);
		
		/* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init();
		
		if(isNButtonClicked) {
		naverLogin.getLoginStatus(function (status) {
			if (!status) {
				//var email = naverLogin.user.getEmail();
				//var name = naverLogin.user.getNickName();
				//var uniqId = naverLogin.user.getId();
			//} else {
				console.log("AccessToken이 올바르지 않습니다.");
			}
		});
		}
	</script>
	<%------------------%>
	<%-- 카카오 로그인--%>
	<%-- ><script src="https://developers.kakao.com/sdk/js/kakao.js" ></script>
	<script>
		Kakao.init('8bb713c7ad18de327b58ceaa4fd70c70');
		Kakao.isInitialized();
		
		Kakao.Auth.authorize({
			  redirectUri: "http://localhost:9090/semi/kakao.inc"
		});
		
		Kakao.Auth.login({
			success : function(response) {
				console.log(response);
			},
			fail : function(error) {
				console.log(error);
			},
		});
		
	</script> --%>
	<script src="https://developers.kakao.com/sdk/js/kakao.js" ></script>
	<script type='text/javascript'>
		Kakao.init('8bb713c7ad18de327b58ceaa4fd70c70');

		//카카오 로그인 버튼을 생성합니다. 
		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			success : function(authObj) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(res) {
					console.log(res.id);
					console.log(res.kaccount_email);
					console.log(res.properties['nickname']); 
					console.log(authObj.access_token);
					$("#m_name").attr("value", res.properties['nickname']);
					$("#r_snscode").attr("value", "K_" + res.id);
					snsform.submit();
					}
				})
			},
			fail : function(error) {
				alert(JSON.stringify(error));
			}
		});
	</script>


	<%------------------%>
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
<jsp:include page="footer.jsp"/><br/><br/><br/>
</html>