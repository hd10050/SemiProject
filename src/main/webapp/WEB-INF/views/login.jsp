<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<meta charset="UTF-8">
<meta name="google-signin-client_id" content="133953135897-7njkqdpmu7gu7os61f48lpii4jovdt1d.apps.googleusercontent.com">

<link rel="dns-prefetch" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">

<title>Insert title here</title>
</head>

<body>
<jsp:include page="navbar.jsp"/><br/><br/><br/>
<jsp:include page="top.jsp"/>
<div class="">
<article class="card-body mx-auto" style="max-width: 400px;">
	<h4 class="card-title mt-3 text-center">LOGIN</h4>
	<p class="text-center"></p>
	<p class="divider-text">
        <hr/>
    </p>
    
	<form accept-charset="UTF-8" role="form">
		<input type="hidden" id="snscode" value="${regist_vo.r_snscode }"/>
		    
	    <div class="form-group input-group">
			<div class="input-group-prepend">
			    <span class="input-group-text"><i class="fas fa-user"></i> </span>
			 </div>
	        <input class="form-control" placeholder="아이디" type="text" id="m_id" name="m_id"  value="${regist_vo.m_id }">
	        <div id="box" class="box"></div>
	    </div> <!-- 아이디 -->
	    
	    <div class="form-group input-group">
	    	<div class="input-group-prepend">
			    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
			</div>
	        <input class="form-control" placeholder="비밀번호" type="password" id="m_pw" name="m_pw" value="${regist_vo.m_pw }">
	    </div> <!-- 비밀번호 -->
		
		<div class="form-group" style="padding-top: 20px;">
	        <button type="button" class="btn btn-primary btn-block" id="login_btn" style="background: #286386;"> 로그인 </button>
	    </div> <!-- 로그인 버튼 -->
	</form>
<!-- ======================================================================== -->
	<hr/>
	<p>
	    <h6 style="color: gray; font-weight: bold; text-align: center;">OR</h6>
	    <div id="google-login-btn" class="g-signin2" data-width="0" data-height="0" data-onsuccess="onSignIn"></div>
	    <a href="#" id="google_btn" class="btn btn-block btn-facebook" style="text-decoration: none; color: white; background-color: #ad2431"><i class="fab fa-google"></i> 구글 계정으로 로그인</a>
        <a href="javascript:location.href = naverLogin.generateAuthorizeUrl();" class="btn btn-block btn-facebook" style="background: green; text-decoration: none; color: white;"> <img src="resources/css/images/naver_logo.png" alt="Avatar" class="image"> 네이버 계정으로 로그인</a> 
	    <a id="kakao-loginbtn" class="btn btn-block btn-facebook" style="background: #ffc107;"></a>
	    <!--<div id="google-login-btn" class="g-signin2" data-width="360" data-height="38" data-onsuccess="onSignIn"><i class="fab fa-google"></i> 구글 계정으로 로그인</div> -->
        <!--<div id="naverIdLogin"></div>-->
        <!-- <a id="kakao-login-btn" ></a> -->
	</article>
	</div>
	
	<form action="snslogin.inc" method="post" name="snsform">
		<input type="hidden" id="m_id2" name="m_id"/>
		<input type="hidden" id="m_name" name="m_name"/>
		<input type="hidden" id="m_gender" name="m_gender"/>
		<input type="hidden" id="m_phone" name="m_phone"/>
		<input type="hidden" id="r_snscode" name="r_snscode"/>
	</form>

	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<%------------------%>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script>
		var isGButtonClicked = false; 
		$("#google-login-btn").click(function(){
			isGButtonClicked = true;
		});
		$("#google_btn").click(function(){
			isGButtonClicked = true;
			$('.abcRioButton').trigger("click");
		});
	
		function onSignIn(googleUser) {
			if(isGButtonClicked) {
				var profile = googleUser.getBasicProfile();
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
				loginButton: {width: 360, height: 38} /* 로그인 버튼의 타입을 지정 */
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
			container : '#kakao-loginbtn',
			success : function(authObj) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(res) {
						//console.log(res.id);
						//console.log(res.kaccount_email);
						//console.log(res.properties['nickname']); 
						//console.log(authObj.access_token);
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
		$("#kakao-login-btn").attr("src", "");
		//$("#kakao-loginbtn").attr("class", "btn btn-block btn-facebook");
		//$("#kakao-loginbtn").attr("style", "background: #ffc107;");
		$("#kakao-loginbtn").append("<i id='kakao-i' class='fas fa-comment'></i> <span style='text-decoration: none; color: black;'>카카오 계정으로 로그인</span>");
	</script>


	<%------------------%>
	<script type="text/javascript">
		$("#m_id").keydown(function(key) {
	        if (key.keyCode == 13) {
	        	login();
	        }
	    });
		$("#m_pw").keydown(function(key) {
	        if (key.keyCode == 13) {
	        	login();
	        }
	    });
		
		$("#login_btn").click(function () {
			login();
	    });
		
		function login() {
			var m_id = $("#m_id").val().trim();
			var m_pw = $("#m_pw").val().trim();
			
			//유효성 검사
			if(m_id.length < 1){
				alert("아이디를 입력하세요!");
				$("#m_id").focus();
				return;
			}
			if(m_pw.length < 1){
				alert("비밀번호를 입력하세요!");
				$("#m_pw").focus();
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
					console.log(res.chk);
					
					if(res.chk == 1) {
						alert("회원 정보가 없습니다.");
					} else {
						location.href="main.inc";	
					}
					
				}).fail(function(err) {
					console.log(err);
				});
		}
		
		
	</script>
	
</body>

<jsp:include page="footer.jsp"/>
</html>
