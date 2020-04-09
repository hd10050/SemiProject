<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id" content="133953135897-7njkqdpmu7gu7os61f48lpii4jovdt1d.apps.googleusercontent.com">
<title>Insert title here</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
	<div id="google-login-btn" class="g-signin2" data-width="0" data-height="0" data-onsuccess="onSignIn"></div>

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

		function onSignIn(googleUser) {
			var profile = googleUser.getBasicProfile();
			//console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			//console.log('Name: ' + profile.getName());
			//console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
			var idx = profile.getEmail().indexOf("@");
			if(idx != -1) {
				$("#m_id2").attr("value", profile.getEmail().substring(0, idx));
			}
			$("#m_name").attr("value", profile.getName());
			$("#r_snscode").attr("value", "G_" + profile.getId());
			
			snsform.submit();
		}
	</script>
</body>
</html>