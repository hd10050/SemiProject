<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<link rel="stylesheet" href="resources/css/memreg.css">
<html>
<head>
</head>


<body>
<div style="position: relative;"> 
<jsp:include page="navbar.jsp"/><br/><br/><br/>
</div>
<div id="11" style="">
<article class="card-body mx-auto" style="max-width: 400px;">
	<h4 class="card-title mt-3 text-center">SIGN IN</h4>
	<p class="text-center"></p>
	<p class="divider-text">
        <hr/>
    </p>
    
	<form>
		<input type="hidden" id="snscode" value="${regist_vo.r_snscode }"/>
		    
	    <div class="form-group input-group">
			<div class="input-group-prepend">
			    <span class="input-group-text"><i class="fas fa-id-card"></i> </span>
			 </div>
	        <input class="form-control" placeholder="아이디(4자 이상 입력하시오.)" type="text" id="m_id" value="${regist_vo.m_id }">
	        <div id="box" class="box"></div>
	    </div> <!-- 아이디 -->
	    
	    <div class="form-group input-group">
	    	<div class="input-group-prepend">
			    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
			</div>
	        <input class="form-control" placeholder="비밀번호" type="password" id="pw">
	    </div> <!-- 비밀번호 -->
	    
	     <div class="form-group input-group">
	    	<div class="input-group-prepend">
			    <span class="input-group-text"><i class="fas fa-check"></i></span>
			</div>
	        <input class="form-control" placeholder="비밀번호 재입력" type="password" id="r_pw">
	    </div> <!-- 비밀번호 재확인 -->   
	    
	    <div class="form-group input-group">
			<div class="input-group-prepend">
			    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
			 </div>
	        <input class="form-control" placeholder="이름" type="text" id="name" value="${regist_vo.m_name }">
	    </div> <!-- 이름 -->
	    
	    <div class="form-group input-group">
	    	<div class="input-group-prepend">
			    <span class="input-group-text"> <i class="fas fa-mobile-alt"></i> </span>
			</div>
	    	<input class="form-control" placeholder="전화번호 (' - '없이 붙여 쓰시오.)" type="text" id="phone"  maxlength="11">
	    	<div id="box_p" class="box"></div>
	    </div> <!-- 전화번호 -->
	    
	    <div class="form-group input-group">
	    	<div class="input-group-prepend">
			    <span class="input-group-text"><i class="fas fa-venus-mars"></i></span>
			</div>
			<select class="form-control" id="gender">
				<option selected="">성별</option>
				<option value="1">여자</option>
				<option value="2">남자</option>
			</select>
		</div> <!-- 성별 -->

		<div class="form-group input-group">
	    	<div class="input-group-prepend">
			    <span class="input-group-text"> <i class="fas fa-question"></i> </span>
			</div>
	         <select id="question" name="question" class="form-control">
						<option value="0">어린시절 별명은?</option>
						<option value="1">살던 동네 이름은?</option>
						<option value="2">보물 1호는?</option>
						<option value="3">처음 키운 애완동물 이름은?</option>
			 </select>
	    </div> <!-- 힌트 질문 -->

	     <div class="form-group input-group">
	    	<div class="input-group-prepend">
			    <span class="input-group-text"><i class="fas fa-pencil-alt"></i></span>
			</div>
	        <input class="form-control" placeholder="힌트 정답" type="text" id="answer" name="answer" />
	    </div> <!-- 힌트 대답 -->       

	    <div class="form-group" style="padding-top: 20px;">
	        <button type="button" class="btn btn-primary btn-block" id="sub_btn" style="background: #286386;"> 등 록 </button>
	    </div> <!-- 회원가입 버튼 -->   

	    <p class="text-center" style="font-weight: bold; font-size: 13px; padding-top: 20px;">기존 회원 이십니까? <a href="login.inc">로그인</a> </p>

</form>
</article>
</div> <!-- card.// -->

<script src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function () {
		//비밀번호 재입력 확인
		$("#r_pw").bind("keyup",function(){
			
			//비밀번호 재입력란 값
			var r_pw = $(this).val();
			//console.log(r_pw);

			//비밀번호란 값
			var pw = $("#pw").val();
			
			//재입력란과 비밀번호란 값의 길이가 같을 때,
			if(r_pw.trim().length == pw.trim().length){
					
					//값이 같을 때,
					if(r_pw.trim()==pw.trim()){
						
						$(".fa-check").css("color", "green");
					//값이 다를 때,
					}else{
						
						$(".fa-check").css("color", "red");
					
					}
			
			//재입력란 길이가 비밀번호란 길이보다 길 때,
			}else if(r_pw.trim().length > pw.trim().length){
				$(".fa-check").css("color", "red");
			}
			
		});
	
		
		
		var chk = true;
		
		//아이디 중복 체크
		
		$("#m_id").bind("keyup",function(){
				//사용자가 입력한 id값을 얻어낸다.
				var str = $(this).val();
				console.log(str);
				
				if(str.trim().length>3){
				//id 4자이상 입력시 수행	
					
					$.ajax({
						
						url: "idchk.inc",
						type: "post",
						data: "id="+encodeURIComponent(str)
						
					}).done(function (data) {
						if(data.chk==1){
							//id가 중복일 때,
							$("#box").html("<pre style='color: red;'>기존에 존재하는 아이디 입니다.</pre>");
							chk = false;
							
						}else{
							//id가 중복이 아닐 때,
							$("#box").html("<pre style='color: blue;'>사용 가능한 아이디 입니다.</pre>");
						}
						
						
					}).fail(function (err) {
						console.log(err);
					});
					
				}else{
					$("#box").html("");
				}
			
		});//아이디 중복 체크의 끝
		
		//전화번호 중복 체크
		$("#phone").bind("keyup",function(){
				//사용자가 입력한 id값을 얻어낸다.
				var str = $(this).val();
				console.log(str);
				
				if(str.trim().length>10){
				//phone 11자이상 입력시 수행	
					
					$.ajax({
						
						url: "telchk.inc",
						type: "post",
						data: "phone="+encodeURIComponent(str)
						
					}).done(function (data) {
						if(data.chk==1){
							//id가 중복일 때,
							$("#box_p").html("<pre style='color:red;'>기존에 존재하는 전화번호 입니다.</pre>");
						}else{
							//id가 중복이 아닐 때,
							$("#box_p").html("<pre style='color:blue;'>사용 가능한 전화번호 입니다.</pre>");
						}
						
						
					}).fail(function (err) {
						console.log(err);
					});
					
				}else{
					$("#box").html("");
				}
			
		});//전화번호 중복 체크의 끝


		//회원가입 기능
		$("#sub_btn").click(function () {
			
			

					//입력값 받기
					var snscode = $("#snscode").val().trim();
					var name = $("#name").val().trim();
					var s_id = $("#m_id").val().trim();
					var pw = $("#pw").val().trim();
					var phone = $("#phone").val().trim();
					var gender = $("#gender").val().trim(); //1 or 2
					var question = $("#question").val().trim();
					var answer = $("#answer").val().trim();
					
					//유효성 검사
					if(s_id.length < 1){
						alert("아이디를 입력하세요");
						$("#m_id").focus();
						return;
					}
					if(pw.length < 1){
						alert("비밀번호를 입력하세요");
						$("#pw").focus();
						return;
					}
					if(pw.length < 1){
						alert("비밀번호 재확인을 입력하세요");
						$("#r_pw").focus();
						return;
					}
					if(name.length < 1){
						alert("이름을 입력하세요");
						$("#name").focus();
						return;
					}
					if(pw.length < 1){
						alert("비밀번호를 입력하세요");
						$("#pw").focus();
						return;
					}
					if(name.length < 1){
						alert("성별을 선택하세요");
						$("#gender").focus();
						return;
					}
					if(answer.length < 1){
						alert("답변을 입력하세요");
						$("#answer").focus();
						return;
					}
					
					var param = "m_name="+encodeURIComponent(name)+
										"&m_id="+encodeURIComponent(s_id)+
										"&m_pw="+encodeURIComponent(pw)+
										"&m_phone="+encodeURIComponent(phone)+
										"&m_gender="+encodeURIComponent(gender)+
										"&r_snscode="+encodeURIComponent(snscode)+
										"&question="+encodeURIComponent(question)+
										"&answer="+encodeURIComponent(answer);
					console.log("param : " + param);
					
					if(chk == true){
					
					// 비동기식 통신
					$.ajax({
						url: "memreg.inc",
						type: "post",
						dataType: "json",
						data: param
								
						}).done(function(res){
							if(res.chk == "1") {
								location.href="login.inc";
							} else {
								alert("실패");
							}
							
							
						}).fail(function(err) {
							console.log(err);
						});
				
			  }else{//중복일 때,
				  	alert("아이디와 전화번호를 확인하세요.")			  
				  
			  }
				
		});//회원 가입의 끝


});
</script>
</body>
<jsp:include page="footer.jsp"/>
</html>





